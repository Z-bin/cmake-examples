### 概念

#### Using target_compile_features

在目标上调用 `target_compile_features` 函数将查看传入的功能并确定要用于目标的正确编译器标志。

```cmake
target_compile_features(hello_cpp11 PUBLIC cxx_auto_type)
```

可以从 CMAKE_CXX_COMPILE_FEATURES 变量中找到可用功能的列表。 您可以使用以下代码获取可用功能的列表：

```cmake
message("List of compile features: ${CMAKE_CXX_COMPILE_FEATURES}")
```

