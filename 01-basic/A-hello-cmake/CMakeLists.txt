# 运行程序所需要的最小CMake版本
# $ cmake --version 
cmake_minimum_required(VERSION 3.5)

# 项目名称
project(hello_cmake)

# 从制定源文件构建可执行文件
add_executable(hello_cmake main.cpp)
