### 概念

#### Checking Compile flags

CMake支持传递一个变量给函数CMAKE_CXX_COMPILER_FLAG来编译程序。 然后将结果存储在您传递的变量中。

```cmake
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FALG("-std=c++11" COMPILER_SUPPORTS_CXX11)
```

这个例子将flag “-std=c11”传递给变量COMPILER_SUPPORTS_CXX11;想使用这个函数，必须使用include(CheckCXXCompilerFlag)包含这个函数

####  Adding the flag

确定编译器是否支持标志后，即可使用标准cmake方法将此标志添加到目标。 在此示例中，我们使CMAKE_CXX_FLAGS将标志（c++标准）传播给所有目标。

```cmake
if(COMPILER_SUPPORTS_CXX11)#
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)#
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

```

