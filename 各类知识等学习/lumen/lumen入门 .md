### 安装

```php
composer global require "laravel/installer"
```



### 启动流程分析

##### 启动命令

```php
php -S localhost:8000 -t public
```











### 配置相关

Lumen 框架的所有配置项都放置在了 .env 文件。

##### 访问配置值
通过使用全局的辅助函数 config，可以很容易在应用程序的任何地方访问配置项的值。 访问配置项的值可以使用「点」语法，其中包含了要访问的文件和选项的名称。还可以指定默认值，当访问的配置项不存在的时候，将会返回给定的默认值。

```
$value = config('app.locale');
```

以数组的方式作为参数传递给 config 辅助函数，可以动态的设置配置项的值。

```
config(['app.locale' => 'en']);
```


在配置文件生效之前，你首先应该使用 configure 方法将它加载到自己的应用程序中。这个加载过程可以在 bootstrap/app.php 文件中完成。

```
$app->configure('app');
```



### 缓存配置

Laravel 为各种缓存系统提供了统一的 API。缓存配置位于 .env 文件中。在该文件中你可以指定应用默认使用哪个缓存驱动。 Laravel 支持当前流行的后端缓存，例如 Memcached 和 Redis 。

> 注意: 在使用 Cache Facade 之前，请确保在 bootstrap/app.php 文件中没有注释掉 $app->withFacades() 方法的调用。

##### Redis 支持
在使用 Lumen 的 Redis 缓存之前，你需要通过 Composer 安装 illuminate/redis 包。然后，你需要在 bootstrap/app.php 文件中注册 Illuminate\Redis\RedisServiceProvider。

```
$app->register(Illuminate\Redis\RedisServiceProvider::class);
```

如果你没有在 bootstrap/app.php 文件中调用 $app->withEloquent()，那么你应该在 bootstrap/app.php 文件中调用 $app->configure('database'); 以确保正确加载 Redis 数据库配置。



### 数据库

##### 操作

例如，在不启用 Facades 时，你可以通过 app 辅助函数连接数据库：

```
$results = app('db')->select("SELECT * FROM users");
```

或者，在启用 Facades 后，你可以通过 DB Facade 来连接数据库：

```
$results = DB::select("SELECT * FROM users");
```







