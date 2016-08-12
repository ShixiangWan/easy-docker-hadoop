# easy-docker-hadoop
基于Docker快速搭建Hadoop容器集群

##一. 搭建三节点Hadoop容器群

####1. 拉取docker镜像
```
sudo docker pull shixiang/hadoop:1.0
```

####2. 克隆Github仓库
```
git clone https://github.com/ShixiangWan/easy-docker-hadoop
```

####3. 创建Hadoop集群通信网络
```
sudo docker network create --driver=bridge hadoop
```

####4. 启动容器
```
cd easy-docker-hadoop
sudo ./start-container.sh
```
```
# 示例输出
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
root@hadoop-master:~# 
```
* 容器默认包含1个主节点，2个从节点
* 容器操作目录位于主节点/root路径下

####5. 启动Hadoop
```
./start-hadoop.sh
```

####6. 运行wordcount
```
./run-wordcount.sh
```
```
# 示例输出
input file1.txt:
Hello Hadoop

input file2.txt:
Hello Docker

wordcount output:
Docker    1
Hadoop    1
Hello    2
```

##二. 搭建任意节点Hadoop容器群

####1. 拉取镜像+克隆Github仓库+创建Hadoop集群通信网络

与上面步骤相同

####2. 重建Docker镜像
```
sudo ./resize-cluster.sh 5
```
* 数量可任意指定一整数
* 脚本使用不同的从节点文件重建Hadoop镜像，并指定从节点名称

####3. 启动容器
```
sudo ./start-container.sh 5
```

####4. 启动Hadoop+运行wordcount
与上面步骤相同

