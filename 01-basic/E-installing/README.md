### 概念

#### Installing

CMake 提供了添加 make install 目标以允许用户安装二进制文件、库和其他文件的能力。 基本安装位置由变量 CMAKE_INSTALL_PREFIX 控制，该变量可以使用 ccmake 或使用 cmake 调用 cmake .. -DCMAKE_INSTALL_PREFIX=/install/location

文件的安装位置通过`install()`函数来控制;

安装从目标`cmake_examples_inst_bin`生成的二进制文件到指定目录`${CMAKE_INSTALL_PREFIX}/bin`

```cmake
X}install (TARGETS cmake_examples_inst_bin
    DESTINATION bin)
```

安装从目标`cmake_examples_inst_bin`生成的共享库到指定目录`${CMAKE_INSTALL_PREFIX}/lib`

```cmake
install (TARGETS cmake_examples_inst
    LIBRARY DESTINATION lib)
```

将用于针对 cmake_examples_inst 库进行开发的头文件安装到 `${CMAKE_INSTALL_PREFIX}/include` 目录中。

```cmake
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include/
    DESTINATION include)
```

将配置文件安装到目标 `${CMAKE_INSTALL_PREFIX}/etc`

```cmake
install (FILES cmake-examples.conf
    DESTINATION etc)
```

运行 make install 后，CMake 会生成一个 install_manifest.txt 文件，其中包含所有已安装文件的详细信息 

### 额外说明

#### 覆盖默认安装路径

如前所述，默认安装位置是从 `CMAKE_INSTALL_PREFIX` 设置的，默认为 `/usr/local/`

如果要更改所有用户的默认位置，可以在添加任何二进制文件或库之前将以下代码添加到顶级 CMakeLists.txt。

```cmake
if( CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT )
  message(STATUS "Setting default CMAKE_INSTALL_PREFIX path to ${CMAKE_BINARY_DIR}/install")
  set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE STRING "The path to use for make install" FORCE)
endif()
```

上述代码将默认安装位置设置为您的构建目录下。

#### DESTDIR

如果您希望分阶段安装以确认包含所有文件，则 make install 目标支持 DESTDIR 参数。

```cmake
make install DESTDIR=/tmp/stage
```

这将为您的所有安装文件创建安装路径 `${DESTDIR}/${CMAKE_INSTALL_PREFIX}`。 在此示例中，它將把所有文件安装在`/tmp/stage/usr/local`目录下

```cmake
$ tree /tmp/stage
/tmp/stage
└── usr
    └── local
        ├── bin
        │   └── cmake_examples_inst_bin
        ├── etc
        │   └── cmake-examples.conf
        └── lib
            └── libcmake_examples_inst.so
```

