### 介绍

- sublibrary1 - 一个静态库
- sublibrary2 - 只有头文件的库
- subbinary - 一个可执行文件

### 概念

#### 引用子项目目录

CMake中有一些变量会自动创建:

| Variable           | Info                                                         |
| ------------------ | ------------------------------------------------------------ |
| PROJECT_NAME       | 当前project（）设置的项目的名称。                            |
| CMAKE_PROJECT_NAME | 由project（）命令设置的第一个项目的名称，即顶层项目。        |
| PROJECT_SOURCE_DIR | 当前项目的源文件目录。                                       |
| PROJECT_BINARY_DIR | 当前项目的构建目录。                                         |
| name_SOURCE_DIR    | 在此示例中，创建的源目录为 `sublibrary1_SOURCE_DIR`, `sublibrary2_SOURCE_DIR`, and `subbinary_SOURCE_DIR` |
| name_BINARY_DIR    | 本工程的二进制目录是`sublibrary1_BINARY_DIR`, `sublibrary2_BINARY_DIR`,和 `subbinary_BINARY_DIR` |

## Header only Libraries

如果您有一个库被创建为仅头文件的库，则cmake支持INTERFACE目标，以允许创建没有任何构建输出的目标。 可以从[here](https://cmake.org/cmake/help/v3.4/command/add_library.html#interface-libraries)找到更多详细信息

```cmake
add_library(${PROJECT_NAME} INTERFACE)
```

创建目标时，您还可以使用INTERFACE范围包含该目标的目录。 INTERFACE范围用于制定在链接此目标的任何库中使用的目标需求，但在目标本身的编译中不使用。

```cmake
target_include_directories(${PROJECT_NAME}
    INTERFACE
        ${PROJECT_SOURCE_DIR}/include
)
```

## 引用子项目中的库

如果子项目创建了一个库，则其他项目可以通过在target_link_libraries（）命令中调用该项目的名称来引用该库。 这意味着您不必引用新库的完整路径，而是将其添加为依赖项。

```cmake
target_link_libraries(subbinary
    PUBLIC
        sublibrary1
)
```

或者，您可以创建一个别名目标，该目标允许您在上下文（其实就是某个目标的绰号）中引用该目标。

```cmake
add_library(sublibrary2)
add_library(sub::lib2 ALIAS sublibrary2)
```

然后引用别名，如下

```cmake
target_link_libraries(subbinary
    sub::lib2
)
```