# bazelexample_hitcache

bazelexample_hitcache
These are example snippets and BUILD files for [Bazel](https://github.com/bazelbuild/bazel).
### This repository is based on https://github.com/bazelbuild/examples/.

##########################################################################################################
###### 2122  docker pull buchgr/bazel-remote-cache                                                       #
###### 2123  df                                                                                          #
###### 2124  docker run -v `pwd`/bazel_cache/:/data -p 9090:8080 buchgr/bazel-remote-cache --max_size=5  #
###### 2125  ps -aux |grep 9090                                                                          #
###### 2126  docker run -v `pwd`/bazel_cache/:/data -p 8080:8080 buchgr/bazel-remote-cache --max_size=5  #
###### 2127  ls                                                                                          #
###### 2128  ls -al                                                                                      #
###### 2129  sudo chmod 777 * -R                                                                         #
###### 2130  docker run -v `pwd`/bazel_cache/:/data -p 8080:8080 buchgr/bazel-remote-cache --max_size=5  #
###### 2131  docker run -v `pwd`/bazel_cache/:/data -p 8080:8080 buchgr/bazel-remote-cache --max_size=10 #
##########################################################################################################
