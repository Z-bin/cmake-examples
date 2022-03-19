### 概念

#### 配置文件

在CMake中，你可以在文件中使用 `configure_file()` 函数进行变量的替换，这一函数的必要参数是源文件和目标文件。

```cmake
configure_file(ver.h.in ${PROJECT_BINARY_DIR}/ver.h)

configure_file(path.h.in ${PROJECT_BINARY_DIR}/path.h @ONLY)
```

第一个例子，在ver.h.in文件中，CMake可以将使用 `${}` 或 `@@` 的语法来定义一个CMake变量。在执行代码生成之后，在 `PROJECT_BINARY_DIR` 目录下将会出现一个新的ver.h文件。

```c++
const char* ver = "${cf_example_VERSION}";
```

第二个例子，在path.h.in文件中，`@ONLY` 指定了它只能用 `@@` 的语法来定义一个CMake变量。同样地，在执行代码生成之后，在 `PROJECT_BINARY_DIR` 目录下将会出现一个新的path.h文件。

```c++
const char* path = "@CMAKE_SOURCE_DIR@";
```

