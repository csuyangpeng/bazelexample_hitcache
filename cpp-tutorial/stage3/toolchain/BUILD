package(default_visibility = ['//visibility:public'])

cc_toolchain_suite(
    name = "testsuite",
    toolchains = {
        "test": ":test_toolchain",
        "test|test": ":test_toolchain",
    },
)

filegroup(
    name = "empty",
    srcs = [],
)

cc_toolchain(
    name = "test_toolchain",
    all_files = ":empty",
    compiler_files = ":empty",
    cpu = "test",
    dwp_files = ":empty",
    linker_files = ":empty",
    objcopy_files = ":empty",
    strip_files = ":empty",
    supports_param_files = 0,
    toolchain_identifier = "test-toolchain",
)

toolchain(
    name = "test-toolchain",
    exec_compatible_with = [
        "@bazel_tools//platforms:x86_64",
    ],
    target_compatible_with = [
        "@bazel_tools//platforms:x86_64",
    ],
    toolchain = "test-toolchain",
    toolchain_type = ":toolchain_type",
)
