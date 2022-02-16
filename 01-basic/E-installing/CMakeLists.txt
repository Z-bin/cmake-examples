cmake_minimum_required(VERSION 3.16.3)

project(cmake_examples_install)

add_library(cmake_examples_inst SHARED
        src/Hello.cpp)

target_include_directories(cmake_examples_inst
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)

add_executable(cmake_examples_inst_bin
    src/main.cpp
)

target_link_libraries(cmake_examples_inst_bin
    PRIVATE
        cmake_examples_inst
)

# 安装

# 二进制
install (TARGETS cmake_examples_inst
    LIBRARY DESTINATION lib)

# 库
install (TARGETS cmake_examples_inst
    LIBRARY DESTINATION lib)

# 头文件
install (DIRECTORY ${PROJECT_SOURCE_DIR}/include/
    DESTINATION include)

# 配置文件
install (FILES cmake-examples.conf
    DESTINATION etc)

