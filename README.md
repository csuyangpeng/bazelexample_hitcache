# bazelexample_hitcache
o

bazelexample_hitcache
These are example snippets and BUILD files for [Bazel](https://github.com/bazelbuild/bazel).
### This repository is based on https://github.com/bazelbuild/examples/.

 2122  docker pull buchgr/bazel-remote-cache
  
 2124  docker run -v `pwd`/bazel_cache/:/data -p 9090:8080 buchgr/bazel-remote-cache --max_size=5
  
 2126  docker run -v `pwd`/bazel_cache/:/data -p 8080:8080 buchgr/bazel-remote-cache --max_size=5

 2129  sudo chmod 777 * -R
 
 2130  docker run -v `pwd`/bazel_cache/:/data -p 8080:8080 buchgr/bazel-remote-cache --max_size=5
 
 2131  docker run -v `pwd`/bazel_cache/:/data -p 8080:8080 buchgr/bazel-remote-cache --max_size=10
