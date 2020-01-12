
if [ -z "$1" ] || [ -z "$2" ]
then
    echo "请在项目根目录执行，并为执行脚本添加参数：目标路径,e.g. ./gen_proto.sh TrigerEvent smartbow.net/dp/g2p"
    exit 1
fi

#以下两项必须存在
OUT_DIR=${1}
MODULE=$2
mkdir -p ${OUT_DIR}
rm -rf ${OUT_DIR}/*
mkdir ${OUT_DIR}/SensorMessages

#gRPC客户端和服务端接口代码
#protoc -I=$SRC_DIR $SRC_DIR/addressbook.proto --go_out=plugins=grpc:$DST_DIR
#编译package:EventEngine
protoc -I $PWD/MessageProto --go_out=plugins=grpc,MGroupedMessage.proto=${MODULE}/${OUT_DIR}/GroupedMessage,MSensorUpMessage.proto=${MODULE}/${OUT_DIR}/SensorMessages:${OUT_DIR} $PWD/MessageProto/EventEngineAPI.proto $PWD/MessageProto/EventMessage.proto

#编译package:SensorMessages
protoc -I $PWD/MessageProto --go_out=plugins=grpc,MSensorDownMessage.proto=${MODULE}/${OUT_DIR}/SensorMessages,\
MSensorAckMessage.proto=${MODULE}/${OUT_DIR}/SensorMessages:${OUT_DIR}/SensorMessages $PWD/MessageProto/SensorGrpcProto.proto \
$PWD/MessageProto/SensorDownMessage.proto $PWD/MessageProto/SensorAckMessage.proto \
$PWD/MessageProto/SensorUpMessage.proto $PWD/MessageProto/SensorMessages/SensorMessages.proto
cp ${OUT_DIR}/SensorMessages/SensorMessages/* ${OUT_DIR}/SensorMessages/
rm -rf ${OUT_DIR}/SensorMessages/SensorMessages #删除多余目录

#编译GroupedMessage: GroupedMessage.proto
protoc -I $PWD/MessageProto --go_out=MSensorUpMessage.proto=${MODULE}/${OUT_DIR}/SensorMessages:${OUT_DIR} $PWD/MessageProto/GroupedMessage.proto
