# 运行程序所需要的最小CMake版本
# $ cmake --version 
cmake_minimum_required(VERSION 3.5)

# 项目名称
project(hello_headers)


# 创建一个带有所有要编译的cpp文件链接的SOURCES变量
set(SOURCES
    src/Hello.cpp
    src/main.cpp    
)

# 从制定源文件构建可执行文件
add_executable(hello_headers ${SOURCES})

# 包含头文件文件夹
target_include_directories(hello_headers
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include    	
)
