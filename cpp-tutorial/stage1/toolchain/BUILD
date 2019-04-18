package(default_visibility = ['//visibility:public'])

filegroup(name = "asmjs_toolchain_config")

cc_toolchain(
    name = "asmjs_toolchain",
    toolchain_identifier = "asmjs-toolchain",
    toolchain_config = ":asmjs_toolchain_config",
    all_files = ":empty",
    compiler_files = ":empty",
    cpu = "asmjs",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
)
