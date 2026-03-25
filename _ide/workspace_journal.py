# 2026-03-24T19:12:52.935923909
import vitis

client = vitis.create_client()
client.set_workspace(path="tb3d")

platform = client.create_platform_component(name = "tb3d",hw_design = "$COMPONENT_LOCATION/../tb3d_driver.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",compiler = "gcc")

