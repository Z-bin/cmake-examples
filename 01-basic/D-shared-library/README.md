### 概念

#### Adding a Shared Library

`add_library()`函数用于从某些源文件创建一个动态库，默认生成在构建文件夹。 写法如下：

```cmake
add_library(hello_library SHARED
    src/Hello.cpp
)
```

上述代码将会从源文件生成一个名为libhello_lbirary.so的动态库,

####  Alias Target

顾名思义，别名目标是在只读上下文中可以代替真实目标名称\替代名称。

```cmake
add_library(hello::library ALIAS hello_library)
```

如下所示，当您将目标链接到其他目标时，使用别名可以引用目标

#### Linking a Shared Library

链接动态库与链接静态库相同。 创建可执行文件时，请使用`target_link_library（）`函数指向您的库:

```cmake
add_executable(hello_binary
	src/main.cpp
)

target_link_libraries(hello_binary
	PRIVATE
		hell::library
)
```

上述代码告诉CMake使用别名目标名称将hello_library链接到hello_binary可执行文件。

用代码解释为:

```shell
/usr/bin/c++ CMakeFiles/hello_binary.dir/src/main.cpp.o -o hello_binary -rdynamic libhello_library.so -Wl,-rpath,/home/matrim/workspace/cmake-examples/01-basic/D-shared-library/build
```

