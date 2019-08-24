# 使用

# 手动操作

## 准备

1. Docker安装

```
- sudo apt install docker.io
- sudo service docker restart
```

2. 在宿主机建立运行目录

```
- 宿主机任意目录拉取wsn-data项目，并切换分支到master分支
- 宿主机wsn-data平级目录拉取MessageProto项目
- 拷贝run.sh到该目录下(run.sh可到ifile对应目录下载或者到git项目的make目录下获取)
```

## 开始

- 更改wsn-data或者MessageProto目录下的内容，即修改proto的消息定义和解析树json的定义
- 在run.sh所在目录执行指令
    ```
    备注：run.sh脚本中的docker镜像版本需要和从仓库拉取镜像的版本一致
    sudo ./run.sh
    ```

- 可在终端看到执行结果，如果成功，可以看到success字样。生成的protobuf文件自动替换至MessageProto项目对应位置。如果执行失败可去隐藏 文件夹.output查看中间文件排查问题
- 此时将wsn-data,MessageProto的更新push即可
