### 概念

### 介绍

如先前在第三方库中所述，较新版本的CMake允许您使用导入的ALIAS[imported](https://cmake.org/cmake/help/v3.6/prop_tgt/IMPORTED.html#prop_tgt:IMPORTED)目标链接第三方库。

#### 导入目标

Imported targets是FindXXX模块导出的只读目标。

在CMake命令中包含boost这个库：

```cmake
  target_link_libraries( imported_targets
      PRIVATE
          Boost::filesystem
  )
```

