workspaceDir = "/apollo/" 
protobufpath = "external/com_google_protobuf/src"

cuda_srcs = FileType([
    ".cu",
    ".cc",
    ".cpp",
    ".h",
    ".hpp",
    ".cuh",
])

cuda_headers = FileType([
    ".h",
    ".hpp",
    ".cuh",
])

cuda_arch = [
    "-arch=sm_30",
    "-gencode=arch=compute_30,code=sm_30",
    "-gencode=arch=compute_50,code=sm_50",
    "-gencode=arch=compute_52,code=sm_52",
    #"-gencode=arch=compute_60,code=sm_60",
    #"-gencode=arch=compute_61,code=sm_61",
    #"-gencode=arch=compute_61,code=compute_61",
]

def parseDeps(deps):
    lib_flag = []
    for dep in deps:
        if ".so" not in dep.basename and ".a" not in dep.basename:
            continue
        name = dep.basename[3:].split(".so")[0].split(".a")[0]
        flag = "-L " + dep.dirname
        lib_flag.append(flag)
        flag = " -l" + name
        lib_flag.append(flag)

    return lib_flag

def get_transitive_deps(deps):
    return depset(deps)


def _mx_cuda_library_impl(ctx):
    index = ctx.build_file_path.rfind("/BUILD")
    buildpath = workspaceDir+ctx.build_file_path[:index]
    externalpath = protobufpath
    copts = ctx.attr.copts
    output=ctx.outputs.out
    trans_deps = get_transitive_deps(ctx.files.deps)
    deps_list = trans_deps.to_list()
    lib_flags = ["-std=c++11", "-shared", "-Xcompiler", "-fPIC"] + parseDeps(deps_list)
    srcs = [f.path for f in ctx.files.srcs] 
    OutputGroupInfo(dynamic_library=ctx.files.deps)

    link_flags = ctx.attr.flags
    include_directories = []
    quote_include_directories = []
    system_include_directories = []
    for f in ctx.attr.deps:
      link_flags += f.cc.link_flags
      include_directories += ["-I" + d for d in f.cc.include_directories]
      quote_include_directories += ["-I" + d for d in f.cc.quote_include_directories]
      system_include_directories += ["-I" + d for d in f.cc.system_include_directories]

    deps_flags = link_flags + include_directories + quote_include_directories + system_include_directories

    ctx.actions.run_shell(
        inputs=ctx.files.srcs + ctx.files.hdrs + ctx.files.deps,
        outputs = [output],
        env={'PATH':'/usr/local/cuda/bin:/usr/local/bin:/usr/bin:/bin',},
        command="nvcc %s -ccbin /usr/bin %s %s -I. -L. -I %s -I %s -I %s -I %s %s %s -o %s" % (" ".join(copts), " ".join(cuda_arch), \
' '.join(srcs), buildpath, workspaceDir, ctx.genfiles_dir.path, externalpath, ' '.join(deps_flags), ' '.join(lib_flags),  output.path),
    )

    CcCompilationInfo = provider()
    cc = struct(defines=[], libs=[], compile_flags=[], link_flags=link_flags, include_directories=include_directories, quote_include_directories=quote_include_directories, system_include_directories=system_include_directories, transitive_headers=[])

    return struct(cc=cc)

def _mx_cuda_binary_impl(ctx):
    index = ctx.build_file_path.rfind("/BUILD")
    buildpath = workspaceDir+ctx.build_file_path[:index]
    externalpath = protobufpath
    copts = ctx.attr.copts
    output=ctx.outputs.out
    trans_deps = get_transitive_deps(ctx.files.deps)
    deps_list = trans_deps.to_list()
    lib_flags = ["-std=c++11"] + parseDeps(deps_list)
    srcs = [f.path for f in ctx.files.srcs] 

    deps_flags = ctx.attr.flags
    for f in ctx.attr.deps:
      deps_flags += f.cc.link_flags
      deps_flags += ["-I" + d for d in f.cc.include_directories]
      deps_flags += ["-I" + d for d in f.cc.quote_include_directories]
      deps_flags += ["-I" + d for d in f.cc.system_include_directories]
    
    ctx.actions.run_shell(
        inputs=ctx.files.srcs + ctx.files.deps,
        outputs = [output],
        env={'PATH':'/usr/local/cuda/bin:/usr/local/bin:/usr/bin:/bin',},
        command="nvcc %s -ccbin /usr/bin %s %s -I. -L. -I %s -I %s -I %s -I %s %s %s -o %s" % (" ".join(copts), " ".join(cuda_arch), \
' '.join(srcs), buildpath, workspaceDir, ctx.genfiles_dir.path, externalpath, ' '.join(deps_flags), ' '.join(lib_flags), output.path)
    )

mx_cuda_library = rule(
    implementation = _mx_cuda_library_impl,
    attrs = {
        "hdrs": attr.label_list(allow_files=True),
        "srcs": attr.label_list(allow_files=True),
        "deps": attr.label_list(),
        "flags": attr.label_list(allow_files = False),
        "copts": attr.string_list(default = []),
    },
    outputs = {"out": "lib%{name}.so"},
)

mx_cuda_binary = rule(
    implementation = _mx_cuda_binary_impl,
    attrs = {
        "srcs": attr.label_list(allow_files=cuda_srcs),
        "deps": attr.label_list(),
        "flags": attr.label_list(allow_files = False),
        "copts": attr.string_list(default = []),
    },
    outputs = {"out": "%{name}"},
)

