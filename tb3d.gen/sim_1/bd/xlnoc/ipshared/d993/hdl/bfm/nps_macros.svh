`ifndef NPS_MACROS
`define NPS_MACROS
`ifndef VERBOSITY_T_ENUM
`define VERBOSITY_T_ENUM
typedef enum {NONE,LOW,FULL,DBG} verbosity_t;
parameter verbosity_t VERBOSITY=DBG;
`endif

`define PRINT_NPS(ifdef_msg,msg,verbosity_l) \
  if (ifdef_msg ) begin \
  $display("%m :: (%0d) :: @%t ",`__LINE__,$time,msg); \
  end
 
`define PRINT_NPS_MODEL(ifdef_msg,msg,verbosity_l) \
  if (ifdef_msg ) begin\
  $display("%m :: (%0d) :: @%t ",`__LINE__,$time,msg); \
  end
 
// By-pass the FATAL & ERROR to WARNING :: Subhadeep
`define PRINT_NPS_FATAL(msg) \
  if (verbosity_fatal_to_warn && ~disable_warnings) begin \
    $display("time %0t ",$time,msg); \
    $warning;\
  end \
  else begin\
   $display("time %0t ",$time,msg); \
   $fatal(); \
  end

`define PRINT_NPS_ERROR(msg) \
  if (verbosity_error_to_warn && ~disable_warnings) begin \
	$display("%m :: (%0d) :: time %0t ",`__LINE__,$time,msg); \
	$warning; \
  end \
  else  begin \
	$display("%m :: (%0d) :: time %0t ",`__LINE__,$time,msg); \
	$error(); \
  end 
   
`define PRINT_NPS_WARNING(msg) \
  if(~disable_warnings) begin \
	$display("%m :: (%0d) :: at time %0t ",`__LINE__,$time,msg); \
	$warning; \
  end

`endif 
