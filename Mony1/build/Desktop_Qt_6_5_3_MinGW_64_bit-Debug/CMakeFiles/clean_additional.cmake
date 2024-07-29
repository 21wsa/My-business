# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appMony1_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appMony1_autogen.dir\\ParseCache.txt"
  "appMony1_autogen"
  )
endif()
