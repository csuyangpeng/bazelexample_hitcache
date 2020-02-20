apollo@in_dev_docker:/apollo/tmp/bazelexample_hitcache/cpp-tutorial/stage1_$ bazel clean
INFO: Starting clean (this may take a while). Consider using --async if the clean takes more than several minutes.
apollo@in_dev_docker:/apollo/tmp/bazelexample_hitcache/cpp-tutorial/stage1_$ bazel build --nobuild --profile=./prof ...
INFO: Writing profile data to '/apollo/tmp/bazelexample_hitcache/cpp-tutorial/stage1_/prof'
INFO: Analysed 2 targets (9 packages loaded, 64 targets configured).
INFO: Found 2 targets...
INFO: Elapsed time: 0.244s
INFO: 0 processes.
INFO: Build completed successfully, 0 total actions
apollo@in_dev_docker:/apollo/tmp/bazelexample_hitcache/cpp-tutorial/stage1_$ ls
README.md  WORKSPACE  main  prof
apollo@in_dev_docker:/apollo/tmp/bazelexample_hitcache/cpp-tutorial/stage1_$ bazel analyze-profile prof 
WARNING: This information is intended for consumption by Bazel developers only, and may change at any time.  Script against it at your own risk
INFO: Loading /apollo/tmp/bazelexample_hitcache/cpp-tutorial/stage1_/prof
INFO: bazel profile for /home/apollo/.cache/bazel/_bazel_apollo/32f10402bbfc3df95a457bf0aa58812e at Thu Feb 20 04:23:33 UTC 2020, build ID: d55b9f53-cbdd-4ace-92e3-911c59d73898, 3183 record(s)
INFO: Aggregating task statistics

=== PHASE SUMMARY INFORMATION ===

Total launch phase time         8.00 ms    3.21%
Total init phase time           15.6 ms    6.24%
Total loading phase time        55.8 ms   22.38%
Total analysis phase time        165 ms   66.01%
Total finish phase time         5.42 ms    2.17%
Total run time                   250 ms  100.00%

=== INIT PHASE INFORMATION ===

Total init phase time                    15.6 ms

Total time (across all threads) spent on:
              Type    Total    Count     Average
              INFO   71.72%       77     0.15 ms
          VFS_STAT    0.16%        5     0.01 ms
         VFS_WRITE    0.22%        2     0.02 ms

=== LOADING PHASE INFORMATION ===

Total loading phase time                 55.8 ms

Total time (across all threads) spent on:
              Type    Total    Count     Average
              INFO    1.68%        2     1.05 ms
    CREATE_PACKAGE    0.35%        1     0.44 ms
          VFS_OPEN    0.05%        1     0.06 ms
          VFS_READ    0.00%        1     0.00 ms
         VFS_WRITE    0.01%        1     0.01 ms
     SKYFRAME_EVAL   42.91%        1     53.7 ms
       SKYFUNCTION   42.14%      302     0.17 ms
   STARLARK_PARSER    7.81%       16     0.61 ms
  STARLARK_USER_FN    0.43%        3     0.18 ms
STARLARK_BUILTIN_FN    4.58%       51     0.11 ms

=== ANALYSIS PHASE INFORMATION ===

Total analysis phase time                 165 ms

Total time (across all threads) spent on:
              Type    Total    Count     Average
              INFO    2.97%       63     0.26 ms
    CREATE_PACKAGE    2.08%       12     0.97 ms
          VFS_STAT    0.06%       41     0.01 ms
           VFS_DIR    0.04%        4     0.06 ms
        VFS_DELETE    0.00%        1     0.01 ms
          VFS_OPEN    0.19%        9     0.12 ms
          VFS_READ    0.02%        8     0.01 ms
         VFS_WRITE    0.01%        3     0.02 ms
          VFS_GLOB    0.15%       16     0.05 ms
     SKYFRAME_EVAL   26.26%        3     49.0 ms
       SKYFUNCTION   52.10%      736     0.40 ms
   STARLARK_PARSER    1.56%       26     0.34 ms
  STARLARK_USER_FN    9.46%      731     0.07 ms
STARLARK_BUILTIN_FN    4.93%     1107     0.02 ms
apollo@in_dev_docker:/apollo/tmp/bazelexample_hitcache/cpp-tutorial/stage1_$

refers: https://docs.bazel.build/versions/2.1.0/skylark/performance.html#performance-profiling
