# 制定cmke运行最小版本
cmake_minimum_required(VERSION 3.5)

# 设置默认的构建类型
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message("Setting build type to 'RelWithDebInfo' as none was specified.")
  set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
    "MinSizeRel" "RelWithDebInfo")
endif()


# 设置项目名称
project (build_type)

# 添加可执行文件cmake_examples_build_type
add_executable(cmake_examples_build_type main.cpp)