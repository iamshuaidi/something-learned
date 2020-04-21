# [解决nginx FastCGI sent in stderr: “Primary script unknown”](https://www.cnblogs.com/smallrookie/p/7491514.html)

今天重启了mac,突然发现本地的 lnmp 服务不能用了，什么请求都返回了：

```
FastCGI sent ``in` `stderr: “Primary script unknown”
```

 这个就很尴尬了，可是我啥也没动啊，但是没有办法，出问题了就得查，google了一下，出这个问题一般有两个原因：

- ## 一是nginx的配置文件问题

   即 /usr/local/etc/nginx／nginx.conf (个人的，你们的路径不一定是这个)中的 fastcgi_param 参数配置问题，nginx默认配置为：

```
fastcgi_param SCRIPT_FILENAME ``/scripts``$fastcgi_script_name;
```

 　但是，如果你在nginx.conf 中设置了设置你本地的 root 目录（服务根目录），例如：

```
root      ``/var/www/console/frontend/www/``;
```

 　那么需要将 fastcgi_param 参数修改为：

```
fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
```

 　配置完成后，尝试重启 nginx 和 php-fpm, 看下服务是否恢复了，如果没有恢复，请接着往下看：

 

- ## 第二个原因是：php-fpm.conf 中设置了错误的用户和组别

　　默认的php-fpm.conf 中会 include 这个一个文件夹（可能会不同）：

```
include=``/usr/local/etc/php/7``.1``/php-fpm``.d/*.conf
```

　　 意思是把 php-fpm.d 文件夹下面的所有 .conf 结尾的文件都 include 进来，一般情况下，会在这些 .conf 文件中配置 user/group 

　　进行到这里，你可以执行一下下面这条命令，看下你目前的 php-fpm 是用什么身份运行的：

```
ps` `aux | ``grep` `-``v` `root | ``grep` `php-fpm | ``cut` `-d\ -f1 | ``sort` `| ``uniq
```

 　特别的，在OS X 系统下，用户应该是  :

```
user = [your username]``group = staff
```

 　如果发现用户不对，比如，你的身份是 admin ，但是上面命令的执行结果却是 nobody，那么你需要将 php-fpm.d 文件夹（或者其他文件夹，或者直接在 php-fpm.conf 中进行设置，视个人情况而定）下的 user 修改为你当前的身份，同样的，修改完成后重启 nginx 和 php-fpm 看下是否正常

如果还是不正常，那么请参考下其他的解决方案，不过大部分情况，上面两种case 应该都包含进去了