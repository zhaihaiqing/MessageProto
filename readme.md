[[TOC]]

# Proto版本

**请使用Proto3**

**SensorMessages/目录下的内容不允许修改**


# Proto命名规范

## Message和Field命名

大写驼峰命名消息名，使用小写下划线分割字段命名

```
message SongServerRequest {
  required string song_name = 1;
}
```

编译转换出来的内容如下：

```
C++:
  const string& song_name() { ... }
  void set_song_name(const string& x) { ... }

Java:
  public String getSongName() { ... }
  public Builder setSongName(String v) { ... }
```

## Enums

使用大写驼峰命名

```
enum Foo {
  FIRST_VALUE = 0;
  SECOND_VALUE = 1;
}
```

每个枚举值应该使用分号结束

## Services

服务名和RPC方法名都使用大写驼峰命名

```
service FooService {
  rpc GetSomething(FooRequest) returns (FooResponse);
}
```

# Proto编写技巧

## 字段编号

Message定义中的每个字段都有一个unique number，这个编号用来在消息的二进制格式中辨识你的字段，并且一旦使用了就不能再更改这个字段编号。注意1-15的字段编号会使用1个字节进行编码，16-2047的编号需要两个字节。所以，你应该为频繁出现的message元素保留1-15。请记住为将来可能频繁出现的元素保留空间。

字段编号最小为1，最大为2^29-1。你不能使用19000-19999的编号（FieldDescriptor::kFirstReservedNumber through FieldDescriptor::kLastReservedNumber）因为它们为protocol buffer的实现保留。如果你是用了保留的编号，编译.proto的时候，会报错，类似的，你不能使用任何之前保留的编号。

# 编译.proto文件

到MessageProto路径下操作：
```
protoc --proto_path=$PWD --cpp_out=$PWD/compiling $PWD/SensorUpRawData.proto $PWD/SensorPackets/SensorPackets.proto
```