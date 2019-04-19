def _impl(ctx):
    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = "asmjs-toolchain",
        host_system_name = "i686-unknown-linux-gnu",
        target_system_name = "asmjs-unknown-emscripten",
        target_cpu = "asmjs",
        target_libc = "unknown",
        compiler = "emscripten",
        abi_version = "unknown",
        abi_libc_version = "unknown",
    )

cc_toolchain_config = rule(
    implementation = _impl,
    attrs = {},
    provides = [CcToolchainConfigInfo],
)
