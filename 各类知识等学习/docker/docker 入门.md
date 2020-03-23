# docker 入门

### 安装

**Mac安装**

```
brew cask install docker
```

阿里云的mac版本的docker.dmg下载地址:[http://mirrors.aliyun.com/docker-toolbox/mac/docker-for-mac/

**Linux安装**

**ubuntu教程**：https://www.runoob.com/docker/ubuntu-docker-install.html

**Centos教程**

### 容器使用

```
docker run ubuntu:15.10 /bin/echo "Hello world"
```

各个参数解析：

- **docker:** Docker 的二进制执行文件。
- **run:** 与前面的 docker 组合来运行一个容器。
- **ubuntu:15.10** 指定要运行的镜像，Docker 首先从本地主机上查找镜像是否存在，如果不存在，Docker 就会从镜像仓库 Docker Hub 下载公共镜像。
- **/bin/echo "Hello world":** 在启动的容器里执行的命令

**运行交互式的容器*

我们通过 docker 的两个参数 -i -t，让 docker 运行的容器实现**"对话"**的能力：

```
runoob@runoob:~$ docker run -i -t ubuntu:15.10 /bin/bash
root@0123ce188bd8:/#
```

各个参数解析：

- **-t:** 在新容器内指定一个伪终端或终端。
- **-i:** 允许你对容器内的标准输入 (STDIN) 进行交互。

注意第二行 **root@0123ce188bd8:/#**，此时我们已进入一个 ubuntu15.10 系统的容器



##### 后台启动容器

```
docker run -d ubuntu:15.10 /bin/sh -c "while true; do echo hello world; sleep 1; done"
```

##### 停止容器

```
docker stop name/ID
```

##### 进入容器

在使用 **-d** 参数时，容器启动后会进入后台。此时想要进入容器，可以通过以下指令进入：

- **docker attach**
- **docker exec**：推荐大家使用 docker exec 命令，因为此退出容器终端，不会导致容器的停止。

```
docker exec -it 243c32535da7 /bin/bash
```

##### 查看所有的容器

查看所有的容器命令如下：

```
$ docker ps -a
```

### 导出和导入容器

##### 导出容器

如果要导出本地某个容器，可以使用 **docker export** 命令。

```
$ docker export 1e560fca3906 > ubuntu.tar
```

##### 导入容器快照

可以使用 docker import 从容器快照文件中再导入为镜像，以下实例将快照文件 ubuntu.tar 导入到镜像 test/ubuntu:v1:

```
$ cat docker/ubuntu.tar | docker import - test/ubuntu:v1
```

##### 删除容器

删除容器使用 **docker rm** 命令：

```
$ docker rm -f 1e560fca3906
```

##### 清理所以终止的容器

下面的命令可以清理掉所有处于终止状态的容器。

```
$ docker container prune
```

### 运行一个 web 应用

##### 使用 webapp 来运行

接下来让我们尝试使用 docker 构建一个 web 应用程序。

我们将在docker容器中运行一个 Python Flask 应用来运行一个web应用。

```
docker pull training/webapp  # 载入镜像
docker run -d -P training/webapp python app.py

```

参数说明:

- **-d:**让容器在后台运行。
- **-P:**将容器内部使用的网络端口映射到我们使用的主机上。

##### 查看 WEB 应用容器

使用 docker ps 来查看我们正在运行的容器

```shell
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                     NAMES
8fc3d90b692c        training/webapp     "python app.py"     18 seconds ago      Up 18 seconds       0.0.0.0:32768->5000/tcp   loving_fermat
```

这里多了端口信息。

```
PORTS
0.0.0.0:32769->5000/tcp
```

Docker 开放了 5000 端口（默认 Python Flask 端口）映射到主机端口 32769 上。

我们也可以通过 -p 参数来设置不一样的端口：

```
~$ docker run -d -p 5001:5000 training/webapp python app.py
```

表示把容器内部的 5000 端口映射到主机 5001 端口

##### 网络端口的快捷方式

通过 **docker ps** 命令可以查看到容器的端口映射，**docker** 还提供了另一个快捷方式 **docker port**，使用 **docker port** 可以查看指定 （ID 或者名字）容器的某个确定端口映射到宿主机的端口号。

上面我们创建的 web 应用容器 ID 为 **bf08b7f2cd89** 名字为 **wizardly_chandrasekhar**。

我可以使用 **docker port bf08b7f2cd89** 或 **docker port wizardly_chandrasekhar** 来查看容器端口的映射情况。

```
runoob@runoob:~$ docker port bf08b7f2cd89
5000/tcp -> 0.0.0.0:5000
```

##### 查看 WEB 应用程序日志

docker logs [ID或者名字] 可以查看容器内部的标准输出。

##### 查看WEB应用程序容器的进程

我们还可以使用 docker top 来查看容器内部运行的进程

```
runoob@runoob:~$ docker top wizardly_chandrasekhar
UID     PID         PPID          ...       TIME                CMD
root    23245       23228         ...       00:00:00            python app.py
```

##### 检查 WEB 应用程序

使用 **docker inspect** 来查看 Docker 的底层信息。它会返回一个 JSON 文件记录着 Docker 容器的配置和状态信息。

##### 停止 WEB 应用容器

```
docker stop name/ID  
```

##### 重启WEB应用容器

已经停止的容器，我们可以使用命令 docker start 来启动。

```
docker start name/ID
```

docker ps -l 查询最后一次创建的容器：

正在运行的容器，我们可以使用 **docker restart** 命令来重启。

##### 移除WEB应用容器

我们可以使用 docker rm 命令来删除不需要的容器

### 镜像使用

##### 列出镜像列表

我们可以使用 **docker images** 来列出本地主机上的镜像。同一仓库源可以有多个 TAG，代表这个仓库源的不同个版本，如 ubuntu 仓库源里，有 15.10、14.04 等多个不同的版本，我们使用 REPOSITORY:TAG 来定义不同的镜像。

##### 获取一个新的镜像

当我们在本地主机上使用一个不存在的镜像时 Docker 就会自动下载这个镜像。如果我们想预先下载这个镜像，我们可以使用 docker pull 命令来下载它。

##### 查找镜像

我们可以从 Docker Hub 网站来搜索镜像，Docker Hub 网址为： **https://hub.docker.com/**

我们也可以使用 docker search 命令来搜索镜像。比如我们需要一个 httpd 的镜像来作为我们的 web 服务。我们可以通过 docker search 命令搜索 httpd 来寻找适合我们的镜像。

##### 删除镜像

镜像删除使用 **docker rmi** 命令，比如我们删除 hello-world 镜像：

##### 构建镜像

我们使用命令 **docker build** ， 从零开始来创建一个新的镜像。为此，我们需要创建一个 Dockerfile 文件，其中包含一组指令来告诉 Docker 如何构建我们的镜像。

```
docker build -t runoob/centos:6.7 .
```

参数说明：

- **-t** ：指定要创建的目标镜像名
- **.** ：Dockerfile 文件所在目录，可以指定Dockerfile 的绝对路径

##### 设置镜像标签

我们可以使用 docker tag 命令，为镜像添加一个新的标签。

```
docker tag 860c279d2fec runoob/centos:dev
```



### 容器链接

##### 网络端口映射

```
docker run -d -p 5000:5000 training/webapp python app.py
```

- **-P :**是容器内部端口**随机**映射到主机的高端口。
- **-p :** 是容器内部端口绑定到**指定**的主机端口。

另外，我们可以指定容器绑定的网络地址，比如绑定 127.0.0.1。

```
docker run -d -p 127.0.0.1:5001:5000 training/webapp python app.py
```

这样我们就可以通过访问 127.0.0.1:5001 来访问容器的 5000 端口。

上面的例子中，默认都是绑定 tcp 端口，如果要绑定 UDP 端口，可以在端口后面加上 **/udp**。

### Docker 容器互联

##### 容器命名

当我们创建一个容器的时候，docker 会自动对它进行命名。另外，我们也可以使用 **--name** 标识来命名容器，例如：

```
docker run -d -P --name runoob training/webapp python app.py
```

##### 容器重命名

```
docker rename 原容器名称 新容器名称
```



##### 新建网络

下面先创建一个新的 Docker 网络。

```
$ docker network create -d bridge test-net
```

参数说明：

**-d**：参数指定 Docker 网络类型，有 bridge、overlay。

##### 连接容器

运行一个容器并连接到新建的 test-net 网络:

```
$ docker run -itd --name test1 --network test-net ubuntu /bin/bash
```

打开新的终端，再运行一个容器并加入到 test-net 网络:

```
$ docker run -itd --name test2 --network test-net ubuntu /bin/bash
```

可以通过如下命令进入后台容器

```
docker exec -it test1 /bin/bash
```

然后通过ping 来测试时候连通了,例如

```
// test1 ping test2
ping test2
```

##### 配置 DNS

我们可以在宿主机的 /etc/docker/daemon.json 文件中增加以下内容来设置全部容器的 DNS：

```
{
  "dns" : [
    "114.114.114.114",
    "8.8.8.8"
  ]
}
```

设置后，启动容器的 DNS 会自动配置为 114.114.114.114 和 8.8.8.8。

配置完，需要重启 docker 才能生效。

查看容器的 DNS 是否生效可以使用以下命令，它会输出容器的 DNS 信息：

```
$ docker run -it --rm ubuntu  cat etc/resolv.conf
```

**手动指定容器的配置**

如果只想在指定的容器设置 DNS，则可以使用以下命令：

```
$ docker run -it --rm -h host_ubuntu  --dns=114.114.114.114 --dns-search=test.com ubuntu
```

参数说明：

**-h HOSTNAME 或者 --hostname=HOSTNAME**： 设定容器的主机名，它会被写到容器内的 /etc/hostname 和 /etc/hosts。

**--dns=IP_ADDRESS**： 添加 DNS 服务器到容器的 /etc/resolv.conf 中，让容器用这个服务器来解析所有不在 /etc/hosts 中的主机名。

**--dns-search=DOMAIN**： 设定容器的搜索域，当设定搜索域为 .example.com 时，在搜索一个名为 host 的主机时，DNS 不仅搜索 host，还会搜索 host.example.com。

### Dockerfile 构建

##### 文件准备

**1、下面以定制一个 nginx 镜像（构建好的镜像内会有一个 /usr/share/nginx/html/index.html 文件）**

在一个空目录下，新建一个名为 Dockerfile 文件，并在文件内添加以下内容：

```
FROM nginx
RUN echo '这是一个本地构建的nginx镜像' > /usr/share/nginx/html/index.html
```

**2、FROM 和 RUN 指令的作用**

**FROM**：定制的镜像都是基于 FROM 的镜像，这里的 nginx 就是定制需要的基础镜像。后续的操作都是基于 nginx。

**RUN**：用于执行后面跟着的命令行命令。有以下俩种格式：

shell 格式：

```
RUN <命令行命令>
# <命令行命令> 等同于，在终端操作的 shell 命令。
```

exec 格式：

```
RUN ["可执行文件", "参数1", "参数2"]
# 例如：
# RUN ["./test.php", "dev", "offline"] 等价于 RUN ./test.php dev offline
```

##### 开始构建

```
docker build -t nginx:test .
```

