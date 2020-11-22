### 概念

#### Finding a Package

大部分项目都将要求包含第三方库，头文件或程序。 `CMake`支持使用`find_package（）`函数查找这些工具的路径。 这将从`CMAKE_MODULE_PATH`中的文件夹列表中搜索格式为“ FindXXX.cmake”的CMake模块。

```cmake
find_package(Boost 1.46.1 REQUIRED COMPONENTS filesystem system)	
```

参数解释:

- `Boost`-库名称,用于查找模块文件`FindBoost.cmake`的一部分
- `1.46.1`-需要的boost库最低版本
- `REQUIRED`-告诉模块这是必需的，如果找不到会报错
- `COMPONENTS` - 要查找的库列表。从后面的参数代表的库里找`boost`

#### Checking if the package is found

大多数被包含的包将设置变量XXX_FOUND，该变量可用于检查软件包在系统上是否可用。

```cmake
if(Boost_FOUND)
    message("boost found")
else()
    message(FATAL_ERROR "boost not found")
endif()
```

#### Exported Variables

找到包后，它会自动导出变量，这些变量可以通知用户在哪里可以找到库，头文件或可执行文件。 与XXX_FOUND变量类似，它们与包绑定在一起，通常记录在FindXXX.cmake文件的顶部。

本例子中的变量

```cmake
Boost_INCLUDE_DIRS - boost头文件的路径
```

#### Alias / Imported targets

大多数modern CMake库在其模块文件中导出别名目标。 导入目标的好处是它们也可以填充包含目录和链接的库。 例如，从CMake v3.5开始，Boost模块支持此功能。 与使用自己的别名目标相似，模块中的别名可以使引用找到的目标变得更加容易。 对于Boost，所有目标均使用Boost ::标识符，然后使用子系统名称导出。 例如，您可以使用:

- `Boost::boost` for header only libraries
- `Boost::system` for the boost system library.
- `Boost::filesystem`  for filesystem library.

与您自己的目标一样，这些目标包括它们的依赖关系，因此与Boost :: filesystem链接将自动添加Boost :: boost和Boost :: system依赖关系。要链接到导入的目标,可以使用如下命令:

```cmake
target_link_libraries(third_party_include
    PRIVATE
        Boost::filesystem
)
```

#### Non-alias targets

尽管大多数现代库都使用导入的目标，但并非所有模块都已更新。 如果未更新库，则通常会发现以下可用变量：

- xxx_INCLUDE_DIRS - 指向库的包含目录的变量。
- xxx_LIBRARY - 指向库路径的变量。

然后可以将它们添加到您的target_include_directories和target_link_libraries中，如下所示：

```cmake
  # Include the boost headers
  target_include_directories( third_party_include
      PRIVATE ${Boost_INCLUDE_DIRS}
  )

  # link against the boost libraries
  target_link_libraries( third_party_include
      PRIVATE
      ${Boost_SYSTEM_LIBRARY}
      ${Boost_FILESYSTEM_LIBRARY}
  )
```

