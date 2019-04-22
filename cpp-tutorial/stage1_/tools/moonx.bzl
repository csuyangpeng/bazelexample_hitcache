
def mx_cc_copts():
    return ["-fdiagnostics-color=always", "-Werror"]

def mx_cuda_copts():
    return ["-xcuda", "-std=c++11"]

def mx_cc_library(
        name,
        srcs = [],
        deps = [],
        copts = [],
        **kwargs):

    native.cc_library(
        name = name,
        copts = mx_cc_copts() + copts,
        srcs = srcs,
        deps = deps,
        **kwargs
    )

def mx_cc_binary(
        name,
        srcs = [],
        deps = [],
        copts = [],
        **kwargs): 

    native.cc_binary(
        name = name,
        copts = mx_cc_copts() + copts,
        srcs = srcs,
        deps = deps,
        **kwargs
    )

def mx_cc_test(
        name,
        srcs = [],
        deps = [],
        copts = [],
        **kwargs): 

    native.cc_test(
        name = name,
        copts = mx_cc_copts() + copts,
        srcs = srcs,
        deps = deps,
        **kwargs
    )

def mx_cuda_library(
        name,
        srcs = [],
        deps = [],
        copts = [],
        **kwargs):

    native.cc_library(
        name = name,
        copts = mx_cuda_copts() + copts,
        srcs = srcs,
        deps = deps,
        **kwargs
    )

def mx_cuda_binary(
        name,
        srcs = [],
        deps = [],
        copts = [],
        **kwargs): 

    native.cc_binary(
        name = name,
        copts = mx_cuda_copts() + copts,
        srcs = srcs,
        deps = deps,
        **kwargs
    )
