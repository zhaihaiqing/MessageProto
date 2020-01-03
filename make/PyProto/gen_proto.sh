#gRPC客户端和服务端接口代码
#python -m grpc_tools.protoc -I=$SRC_DIR --python_out=$DST_DIR --grpc_python_out=$DST_DIR $SRC_DIR/helloworld.proto
python -m grpc_tools.protoc -I../.. --python_out=. --grpc_python_out=. ../../EventEngine.proto

#protobuf文件编译
#protoc -I=$SRC_DIR --python_out=$DST_DIR $SRC_DIR/addressbook.proto
protoc -I ../../ ../../GroupedMessage.proto --python_out=$PWD