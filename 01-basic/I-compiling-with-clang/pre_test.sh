dir=`pwd`
#路径存在则为真
if [ -d "$dir/build.clang" ]; then
    echo "deleting $dir/build.clang"
    rm -r $dir/build.clang
fi
