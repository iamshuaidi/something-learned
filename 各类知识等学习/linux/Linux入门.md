### 进程

##### 查看端口被占用

```
lsof -i tcp:端口号
```

##### Kill 杀死进程

```
kill -9 进程PID
```

##### 根据名称杀死进程

一般我们可以使用kill　-9 pid方式杀死一个进程，但是这样就需要先找到这个进程的进程id，实际上我们也可以直接根据名称杀死进程，例如：

```
$ killall hello
```

或者：

```
$ pkill hello
```

### yum 于 rpm 的使用

1、查看安装在哪里

```
rpm -ql name
```

```
yum [options] [command] [package ...]
```

- **options：**可选，选项包括-h（帮助），-y（当安装过程提示选择全部为"yes"），-q（不显示安装的过程）等等。
- **command：**要进行的操作。
- **package**操作的对象。

##### yum常用命令

- 1.列出所有可更新的软件清单命令：yum check-update
- 2.更新所有软件命令：yum update
- 3.仅安装指定的软件命令：yum install <package_name>
- 4.仅更新指定的软件命令：yum update <package_name>
- 5.列出所有可安裝的软件清单命令：yum list
- 6.删除软件包命令：yum remove <package_name>
- 7.查找软件包 命令：yum search <keyword>
- 8.清除缓存命令:
  - yum clean packages: 清除缓存目录下的软件包
  - yum clean headers: 清除缓存目录下的 headers
  - yum clean oldheaders: 清除缓存目录下旧的 headers
  - yum clean, yum clean all (= yum clean packages; yum clean oldheaders) :清除缓存目录下的软件包及旧的headers

### 网络

##### 检测端口的命令

Telnet ip port



##### netstat

最常用

```
netstat -anp
```

a：列出所有

n：不解析域名

p：查看是哪个进程



### 查找

##### find

```
find   path   -option   [   -print ]   [ -exec   -ok   command ]   {} \;
```

**参数**

-name name, -iname name : 文件名称符合 name 的文件。iname 会忽略大小写

-size n : 文件大小 是 n 单位，b 代表 512 位元组的区块，c 表示字元数，k 表示 kilo bytes，w 是二个位元组。-type c : 文件类型是 c 的文件。

**实例**

将目前目录及其子目录下所有延伸档名是 c 的文件列出来。

```
# find . -name "*.c"
```

将目前目录其其下子目录中所有一般文件列出

```
# find . -type f
```

将目前目录及其子目录下所有最近 20 天内更新过的文件列出

```
# find . -ctime -20
```

查找/var/log目录中更改时间在7日以前的普通文件，并在删除之前询问它们：

```
# find /var/log -type f -mtime +7 -ok rm {} \;
```

##### which

which命令会在PATH变量指定的路径中，搜索某个系统命令的位置

```c
which -a which  #查看命令which所在位置，-a参数表示找出所有
```

##### whereis

whereis命令用于搜索程序的二进制文件，源代码文件或帮助文档



### 查看

##### 实时查看日志

```
tail -f filename.log
```

##### 根据名称查找进程id

想快速直接查找进程id，可以使用：

```
$ pgrep hello
22692
```

