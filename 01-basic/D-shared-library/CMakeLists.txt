# 运行程序所需要的最小CMake版本
# $ cmake --version 
cmake_minimum_required(VERSION 3.5)

# 项目名称
project(hello_library)


# 从源文件生成共享库 （将会创建一个libhello_library.so）
add_library(hello_library 
    src/Hello.cpp
)

add_library(hello::library ALIAS hello_library)

target_include_directories( hello_library
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)

# 从制定源文件构建可执行文件
add_executable(hello_binary 
    src/main.cpp
)

# 将新的hello_library目标与hello_binary目标链接
target_link_libraries( hello_binary
   PRIVATE
       hello_library
)
