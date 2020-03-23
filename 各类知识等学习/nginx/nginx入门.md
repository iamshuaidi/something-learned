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

### 操作

```php
 /usr/local/webserver/nginx/sbin/nginx  // 启动
/usr/local/webserver/nginx/sbin/nginx -s reload            # 重新载入配置文件
/usr/local/webserver/nginx/sbin/nginx -s reopen            # 重启 Nginx
/usr/local/webserver/nginx/sbin/nginx -s stop              # 停止 Nginx
```

### 配置lumen项目

把 nginx.conf 文件改成这样即可：

```

#user  nobody;
worker_processes 2;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  300;

    #gzip  on;

    server {
        listen       80;
        server_name  localhost;
# 配置 lumen 项目

		set $root_path '/Users/shuaidi/PhpstormProjects/new_dnspod/public';  
		root $root_path;  
	  
		index index.php index.html index.htm;  
	  
		try_files $uri $uri/ @rewrite;  
	  
		location @rewrite {  
			rewrite ^/(.*)$ /index.php?_url=/$1;  
		}  
	  
		location ~ \.php {  
	  
			fastcgi_pass 127.0.0.1:9000;  
			fastcgi_index /index.php;  
	  
			fastcgi_split_path_info       ^(.+\.php)(/.+)$;  
			fastcgi_param PATH_INFO       $fastcgi_path_info;  
			fastcgi_param PATH_TRANSLATED $document_root$fastcgi_path_info;  
			fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;  
			include fastcgi_params;
		}  
	  
		location ~* ^/(css|img|js|flv|swf|download)/(.+)$ {  
			root $root_path;  
		}  
	  
		location ~ /\.ht {  
			deny all;  
		}  
# 结速
        #charset koi8-r;

        #access_log  logs/host.access.log  main;

#        location / {
#            root   html;
#            index  index.html index.htm;
#        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
#        error_page   500 502 503 504  /50x.html;
#        location = /50x.html {
#            root   html;
#        }

        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #    root           html;
        #    fastcgi_pass   127.0.0.1:9000;
        #    fastcgi_index  index.php;
        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        #    include        fastcgi_params;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }


    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}


    # HTTPS server
    #
    #server {
    #    listen       443 ssl;
    #    server_name  localhost;

    #    ssl_certificate      cert.pem;
    #    ssl_certificate_key  cert.key;

    #    ssl_session_cache    shared:SSL:1m;
    #    ssl_session_timeout  5m;

    #    ssl_ciphers  HIGH:!aNULL:!MD5;
    #    ssl_prefer_server_ciphers  on;

    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}
    include servers/*;
}

```

