### 安装

##### Linux下通过 yum 来安装(RHEL/CentOS)

1、create the file named `/etc/yum.repos.d/nginx.repo` with the following contents:

```
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
```

2、By default, the repository for stable nginx packages is used. If you would like to use mainline nginx packages, run the following command:

```
sudo yum-config-manager --enable nginx-mainline
```

3、To install nginx, run the following command:

```
sudo yum install nginx
```



