# 运行程序所需要的最小CMake版本
# $ cmake --version 
cmake_minimum_required(VERSION 3.5)

# 项目名称
project(hello_library)


# 从源文件生成静态库
add_library(hello_library STATIC
    src/Hello.cpp
)

# 使用target_include_directories（）函数在库中包含目录，并且将目录范围设置为PUBLIC。
target_include_directories(  hello_library
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
