### 概念

#### CMakeLists.txt

CMakeLists.txt是用来组织构建你工程的文件,当`cmake`命令在工程目录下执行时候,它将会寻找CMakeLists.txt文件,找不到则报错

#### Minimum CMake version

当使用CMake创建一个工程时候,你将会用此命令指定CMake的最小版本

```cmake
cmake_minimum_required(VERSION 3.5)
```

#### Projects

使用CMake构建时候包含一个项目名称,当使用多个项目时候,引用变量会变得更加容易

```cmake
project(hello_cmake)
```

比如生成了:PROJECT_NAME这个变量,PROJECT_NAME是变量名,${PROJECT_NAME}是变量值,为hello_cmake

### Creating an Executable

`add_executable`命令用于指定从一个特定的源文件生成一个可执行文件,本例中为`main.cpp`,	`add_executable()`函数的第一个参数是可执行文件名，第二个参数是要编译的源文件列表。

```cmake
add_executable(hello_cmake main.cpp)
```

#### Tips

大部分人的使用方式是使项目名称和可执行文件名称相同

```cmake
cmake_minimum_required(VERSION 2.6)
project (hello_cmake)
add_executable(${PROJECT_NAME} main.cpp)
```

上述代码中,`project()`函数将会创建一个变量`${PROJECT_NAME}`值为hello_cmake.这能够把值`${PROJECT_NAME}`传递给函数`add_executable()`,然后生成可执行文件hello_cmake

#### Binary Directory

运行cmake命令的根文件夹称为CMAKE_BINARY_DIR，所有二进制文件就在这个文件夹里面

##### In-place Build

就地构建会在与源代码相同的目录结构中生成所有临时构建文件。 这意味着所有生成的Makefile和目标文件都分散在你的源代码目录中,比较杂乱。 

##### Out-of-Source Build

外部构建: 你可以创建一个可以位于文件系统上任何位置的构建文件夹。 所有临时构建和目标文件都位于此目录中，以保持源代码目录的整洁,如下:

```shell
mkdir build
cd build/
cmake ..
```

