#gRPC客户端和服务端接口代码
#make
make

#protobuf文件编译
#protoc -I=$SRC_DIR --cpp_out=$DST_DIR $SRC_DIR/addressbook.proto
protoc -I ../../ ../../GroupedMessage.proto --cpp_out=$PWD