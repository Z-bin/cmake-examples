cmake_minimum_required(VERSION 3.5)

project(third_party_include)

#使用库文件系统和系统查找boost install
find_package(Boost  REQUIRED REQUIRED COMPONENTS filesystem system)

#boost 是否被找到
if(Boost_FOUND)
    message("boost found")
else()
    message(FATAL_ERROR "boost not found")
endif()

add_executable(third_party_include main.cpp)

# 将Boost::filesystem链接到可执行文件
target_link_libraries(third_party_include
    PRIVATE
        Boost::filesystem
)
