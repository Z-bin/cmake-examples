### 概念

#### Set Per-Target C++ Flags

在现代CMake中设置C ++标志的推荐方法是专门针对某个目标（target）设置标志，可以通过target_compile_definitions（）函数设置某个目标的编译标志

```cmake
target_compile_definitions(cmake_examples_compile_flags
    PRIVATE EX3
)
```

这将导致编译器在编译目标时添加定义-DEX3。

对于编译器选项,还可以使用`target_compile_options()`函数

---

```cmake
target_compile_definitions(<target>
2   <INTERFACE|PUBLIC|PRIVATE> [items1...]
3   [<INTERFACE|PUBLIC|PRIVATE> [items2...] ...])
```

是给 `target` 添加编译选项， `target` 指的是由 `add_executable()`产生的可执行文件或 `add_library()`添加进来的库。`<INTERFACE|PUBLIC|PRIVATE>`指的是`[items...]` 选项可以传播的范围， `PUBLIC and INTERFACE`会传播 `<target>`的 [INTERFACE_COMPILE_DEFINITIONS](https://cmake.org/cmake/help/v3.0/prop_tgt/INTERFACE_COMPILE_DEFINITIONS.html#prop_tgt:INTERFACE_COMPILE_DEFINITIONS) 属性， `PRIVATE and PUBLIC` 会传播 `target` 的 [COMPILE_DEFINITIONS ](https://cmake.org/cmake/help/v3.0/prop_tgt/COMPILE_DEFINITIONS.html#prop_tgt:COMPILE_DEFINITIONS)属性。

####  Set Deafult C++ Flags

默认的CMAKE_CXX_FLAGS为空或包含适用于构建类型的标志。 要设置其他默认编译标志，如下使用:

```cmake
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DEX2" CACHE STRING "Set C++ Compiler Flags" FORCE)
```

`CACHE STRING "Set C++ Compiler Flags" FORCE`命令是为了强制将CMAKE_CXX_FLAGS变量 放到CMakeCache.txt文件中 

`"${CMAKE_CXX_FLAGS} -DEX2" `这个字符串可以保留原有的CMAKE_CXX_FLAGS中的参数，额外添加了一个EX2参数。注意写法：空格，并且参数前加了 `-D`

类似设置CMAKE_CXX_FLAGS，还可以设置其他选项：

- 设置C编译标志： CMAKE_C_FLAGS
- 设置链接标志：CMAKE_LINKER_FLAGS.

#### Set CMake Flags

设置编译标志:

```cmake
cmake .. -DCMAKE_CXX_FLAGS="-DEX3"
```

