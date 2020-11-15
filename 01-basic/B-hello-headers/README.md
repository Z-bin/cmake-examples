### 概念

#### Directory Paths

CMake语法指定了许多变量，这些变量可用于帮助您在项目或源代码树中找到有用的目录(了解目录i的含义)。

| Variable                 | Info                                                     |
| ------------------------ | -------------------------------------------------------- |
| CMAKE_SOURCE_DIR         | 源代码根目录，工程顶层目录。暂认为就是PROJECT_SOURCE_DIR |
| CMAKE_CURRENT_SOURCE_DIR | 当前处理的 CMakeLists.txt 所在的路径                     |
| PROJECT_SOURCE_DIR       | cmake项目根目录                                          |
| CMAKE_BINARY_DIR         | 运行`cmake`命令目录                                      |
| CMAKE_CURRENT_BINARY_DIR | build目录                                                |
| PROJECT_BINARY_DIR       | 当前项目的构建目录。                                     |

#### Source Files Variable

创建包含源文件的变量可以使您更清楚地了解这些文件，并将其轻松添加到多个命令中，例如`add_executable（）`函数。

```cmake
# 创建一个带有所有要编译的cpp文件链接的SOURCES变量(不建议这样做)
set(SOURCES
    src/Hello.cpp
    src/main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCES})
```

##### 注意

在SOURCES变量中设置特定文件名的另一种方法是使用GLOB命令使用通配符模式匹配来查找文件。

```cmake
# 表示所有.cpp结尾的文件都会包含到这个SOURCES变量
file(GLOB SOURCES "src/*.cpp")
```

##### 建议

对于现代CMake，不建议对源使用变量。 相反，通常直接在add_xxx函数中声明源。

这对于glob命令尤其重要，如果添加新的源文件，这些命令可能不会始终为您显示正确的结果。

#### Including Directories

当你有其他需要包含的文件夹（文件夹里有头文件）时，可以使用`arget_include_directories()`使编译器包含它们, 编译这些文件时，这将使用-I标志将这些目录添加到编译器中，例如 `-I/directory/path`

```cmake
target_include_directories(target
    PRIVATE
        ${PROJECT_SOURCE_DIR}/include
)
```

PRIVATE 标识符指定包含的范围。 这对库很重要，将在下一个示例中进行说明。 有关该功能的更多详细信息，请参见以下链接：https：//cmake.org/cmake/help/v3.0/command/target_include_directories.html

#### Verbose Output

在前面的示例中，运行make命令时，输出仅显示构建状态。 要查看用于调试目的的完整输出，可以在运行make时添加VERBOSE = 1标志。
