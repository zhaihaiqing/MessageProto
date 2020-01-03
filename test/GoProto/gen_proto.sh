#gRPC客户端和服务端接口代码
#protoc -I=$SRC_DIR $SRC_DIR/addressbook.proto --go_out=plugins=grpc:$DST_DIR
protoc -I ../../ --go_out=plugins=grpc:$PWD ../../EventEngine.proto

#protobuf文件编译
#protoc -I=$SRC_DIR --go_out=$DST_DIR $SRC_DIR/addressbook.proto
protoc -I ../../ ../../GroupedMessage.proto --go_out=$PWD