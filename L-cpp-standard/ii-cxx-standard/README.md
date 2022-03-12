### 概念

#### Using CXX_STANDARD property

设置 `CMAKE_CXX_STANDARD` 变量会让所有目标具有 `CXX_STANDARD` 属性。 这会让 CMake 在编译时设置适当的标志。

> CMAKE_CXX_STANDARD 变量回退到最接近的适当标准而不会失败。 例如，如果你请求 -std=gnu11`，你最终可能会得到 `-std=gnu0x。
>
> 这可能会导致编译时出现意外故障。

