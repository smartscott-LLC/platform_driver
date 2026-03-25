cmake_minimum_required(VERSION 3.16)

project(DyaSmart
    VERSION      1.0.0
    DESCRIPTION  "DyaSmart TB3-D Ternary Binary Multi-Dimensional Logic Engine"
    LANGUAGES    C
)

# ============================================================================
# Toolchain & standard
# ============================================================================
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

# Default to Release if not set
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

# ============================================================================
# Platform / architecture detection
#
# ARCHITECTURE DECISION: x86-64 primary target.
#
# We probe the compiler for BMI2 and AVX2 support at configure time:
#   - BMI2 (PDEP/PEXT): single-cycle nibble spread/compress.
#   - AVX2 (256-bit SIMD): vectorized buffer encode/decode (16 bytes/iter).
#   - AVX-512: guarded at compile time; code path enabled if host supports it.
#
# Both BMI2 and AVX2 are present on Intel Haswell (2013) and AMD Zen (2017)+,
# making them safe defaults for any modern commodity hardware.
# ============================================================================
include(CheckCCompilerFlag)
include(CheckCSourceCompiles)

# Detect BMI2
check_c_compiler_flag(-mbmi2 COMPILER_SUPPORTS_BMI2)
# Detect AVX2
check_c_compiler_flag(-mavx2 COMPILER_SUPPORTS_AVX2)
# Detect AVX-512F
check_c_compiler_flag(-mavx512f COMPILER_SUPPORTS_AVX512F)

# Build options: users can force-disable individual ISA extensions
option(TB3D_ENABLE_BMI2   "Enable BMI2 PDEP/PEXT acceleration"     ON)
option(TB3D_ENABLE_AVX2   "Enable AVX2 vectorized buffer operations" ON)
option(TB3D_ENABLE_AVX512 "Enable AVX-512 acceleration (requires AVX-512 hardware)" OFF)

# ============================================================================
# Compiler flags
# ============================================================================
set(TB3D_COMPILE_FLAGS
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Wstrict-prototypes
    -fno-strict-aliasing
)

set(TB3D_ISA_FLAGS "")
if(TB3D_ENABLE_BMI2 AND COMPILER_SUPPORTS_BMI2)
    list(APPEND TB3D_ISA_FLAGS -mbmi2)
    message(STATUS "DyaSmart: BMI2 PDEP/PEXT enabled")
else()
    message(STATUS "DyaSmart: BMI2 disabled — using portable LUT path")
endif()

if(TB3D_ENABLE_AVX2 AND COMPILER_SUPPORTS_AVX2)
    list(APPEND TB3D_ISA_FLAGS -mavx2)
    message(STATUS "DyaSmart: AVX2 SIMD enabled")
else()
    message(STATUS "DyaSmart: AVX2 disabled — using scalar buffer path")
endif()

if(TB3D_ENABLE_AVX512 AND COMPILER_SUPPORTS_AVX512F)
    list(APPEND TB3D_ISA_FLAGS -mavx512f)
    message(STATUS "DyaSmart: AVX-512 enabled")
endif()

# ============================================================================
# Library: dyasmart_tb3d
# ============================================================================
add_library(dyasmart_tb3d STATIC
    src/tb3d_engine.c
    src/tb3d_driver.c
)

target_include_directories(dyasmart_tb3d
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
)

target_compile_options(dyasmart_tb3d
    PRIVATE
        ${TB3D_COMPILE_FLAGS}
        ${TB3D_ISA_FLAGS}
)

# Math library (needed on some platforms for bit ops)
target_link_libraries(dyasmart_tb3d PUBLIC m)

# ============================================================================
# Test executable
# ============================================================================
enable_testing()

add_executable(test_tb3d tests/test_tb3d.c)
target_link_libraries(test_tb3d PRIVATE dyasmart_tb3d)
target_compile_options(test_tb3d
    PRIVATE
        ${TB3D_COMPILE_FLAGS}
        ${TB3D_ISA_FLAGS}
)

add_test(
    NAME    TB3D_LogicEngine
    COMMAND test_tb3d
)

# ============================================================================
# Metrics & benchmark test executable
# ============================================================================
add_executable(test_tb3d_bench tests/test_tb3d_bench.c)
target_link_libraries(test_tb3d_bench PRIVATE dyasmart_tb3d)
target_compile_options(test_tb3d_bench
    PRIVATE
        ${TB3D_COMPILE_FLAGS}
        ${TB3D_ISA_FLAGS}
        -O3
)

add_test(
    NAME    TB3D_Metrics
    COMMAND test_tb3d_bench
        ${CMAKE_CURRENT_BINARY_DIR}/metrics_report.csv
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
)

# ============================================================================
# LLVM IR — assemble to bitcode (if llvm-as is available)
# ============================================================================
find_program(LLVM_AS NAMES llvm-as-18 llvm-as-17 llvm-as llvm-as-16)
find_program(LLC     NAMES llc-18 llc-17 llc llc-16)

if(LLVM_AS AND LLC)
    message(STATUS "DyaSmart: LLVM toolchain found — building IR reference module")

    # Assemble .ll → .bc
    add_custom_command(
        OUTPUT  ${CMAKE_CURRENT_BINARY_DIR}/tb3d_decoder.bc
        COMMAND ${LLVM_AS} ${CMAKE_CURRENT_SOURCE_DIR}/llvm/tb3d_decoder.ll
                -o ${CMAKE_CURRENT_BINARY_DIR}/tb3d_decoder.bc
        DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/llvm/tb3d_decoder.ll
        COMMENT "Assembling TB3-D LLVM IR → bitcode"
    )

    # Compile .bc → native object (informational, not linked into the library)
    add_custom_command(
        OUTPUT  ${CMAKE_CURRENT_BINARY_DIR}/tb3d_decoder.o
        COMMAND ${LLC} -filetype=obj -mcpu=x86-64 -mattr=+avx2,+bmi2
                ${CMAKE_CURRENT_BINARY_DIR}/tb3d_decoder.bc
                -o ${CMAKE_CURRENT_BINARY_DIR}/tb3d_decoder.o
        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/tb3d_decoder.bc
        COMMENT "Compiling TB3-D bitcode → native object"
    )

    add_custom_target(tb3d_ir_module ALL
        DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/tb3d_decoder.o
    )
else()
    message(STATUS "DyaSmart: llvm-as/llc not found — skipping LLVM IR build")
endif()

# ============================================================================
# Install
# ============================================================================
install(TARGETS dyasmart_tb3d
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib
)

install(DIRECTORY include/
    DESTINATION include
)

install(DIRECTORY llvm/
    DESTINATION share/dyasmart/llvm
)

install(DIRECTORY docs/
    DESTINATION share/dyasmart/docs
)

# ============================================================================
# Summary
# ============================================================================
message(STATUS "")
message(STATUS "DyaSmart TB3-D Logic Engine v${PROJECT_VERSION}")
message(STATUS "  Build type : ${CMAKE_BUILD_TYPE}")
message(STATUS "  Compiler   : ${CMAKE_C_COMPILER}")
message(STATUS "  ISA flags  : ${TB3D_ISA_FLAGS}")
message(STATUS "")
