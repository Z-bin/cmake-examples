cmake_minimum_required(VERSION 3.15)

project(protobuf_example)

find_package(Protobuf REQUIRED)

if (PROTOBUF_FOUND)
    message("protobuf found")
else()
    message(FATAL_ERROR "can not found protobuf")
endif()

# 生成头文件和源文件
PROTOBUF_GENERATE_CPP(PROTO_SRCS PROTO_HEADS AddressBook.proto)

message("PROTO_SRCS = ${PROTO_SRCS}")
message("PROTO_SRCS = ${PROTO_HDRS}")

add_executable(protobuf_example
    main.cpp
    ${PROTO_SRCS}
    ${PROTO_HDRS})

target_include_directories(protobuf_example
    PUBLIC
    ${PROTOBUF_INCLUDE_DIRS}
    ${CMAKE_CURRENT_BINARY_DIR})

target_link_libraries(protobuf_example
    PUBLIC
    ${PROTOBUF_LIBRARIES})
