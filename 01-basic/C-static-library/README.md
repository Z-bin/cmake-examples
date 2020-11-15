### 概念

#### Adding a Static Library

add_library（）函数用于从某些源文件创建一个库，默认生成在构建文件夹:

```cmake
add_library(hello_library STATIC
	src/Hello.cpp
)
```

这将用于创建名称为libhello_library.a的静态库，并在add_library调用中包含了源文件

#### 注意:

**如前面的示例所述，将源文件直接传递给add_library调用，这是modern CMake的建议。（而不是先把Hello.cpp赋给一个变量,再传递给`add_library`）**

#### Populating Including Directories

使用`target_include_directories（）`添加了一个目录，这个目录是库所包含的头文件的目录，并设置库属性为PUBLIC。

```cmake
target_include_directories(hello_library
	PUBLIC
		${PROJECT_SOURCE_DIR}/inlcude
)
```

使用这个函数后,这个目录将在以下情况被调用:

1. 编译这个库(hello_library)时[因为这个库hello_library由Hello.cpp生成，Hello.cpp中函数的定义在Hello.h中，Hello.h在这个include目录下，所以显然编译这个库的时候，这个目录会用到]
2. 编译链接到这个库hello_library的任何其他目标（库或者可执行文件）

属性详解:(**还没搞懂**)

- PRIVATE - 目录被添加到目标（库）的包含路径中
- INTERFACE - 目录没有被添加到目标（库）的包含路径中，而是链接了这个库的其他目标（库或者可执行程序）包含路径中
- PUBLIC - 目录既被添加到目标（库）的包含路径中，同时添加到了链接了这个库的其他目标（库或者可执行程序）的包含路径中

#### Linking a Library

创建将使用这个库的可执行文件时，必须告知编译器需要用到这个库。 可以使用`target_link_library（）`函数完成此操作。`add_executable()`连接源文件，`target_link_libraries()`连接库文件

```cmake
add_executable(hello_binary
	src/main.cpp
)

target_link_libraries(hello_binary
	PRIVATE
		hello_library
)
```

这告诉CMake在链接期间将hello_library链接到hello_binary可执行文件。 同时，这个被链接的库如果有INTERFACE或者PUBLIC属性的包含目录，那么，这个包含目录也会被传递（ propagate ）给这个可执行文件。

用代码解释就是:

```shell
/usr/bin/c++ CMakeFiles/hello_binary.dir/src/main.cpp.o -o hello_binary -rdynamic libhello_library.a
```

