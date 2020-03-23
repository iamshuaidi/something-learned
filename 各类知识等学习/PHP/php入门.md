[TOC]

# 环境搭建

其实Mac 中自带了 PHP 的运行环境，例如 PHP7.1 和 Apache2，不过如果要在 idea 中配置 PHP 运行环境，如果用系统自带的则会出现找不到 php-cgi 的情况，搞了好久都没觉得，最后是自己另行下载了 php5.6（用 brew 下载其他版本，好像会自动下载很多其他东西，而且经常下载到最后失败了），所以如果要在 idea 中配置 PHP，只需要两个步骤



1、在 idea 的插件中搜索 php 并下载

2、用 curl -s http://php-osx.liip.ch/install.sh | bash -s 5.6 下载 PHP5.6

3、在 idea 中的语言那里把 PHP 配置上，即可

# 基础学习



### 语法

```php+HTML
<?php
// PHP 代码
?>
```

PHP 文件的默认文件扩展名是 ".php"。

PHP 文件通常包含 HTML 标签和一些 PHP 脚本代码。

```php+HTML
<!DOCTYPE html>
<html>
<body>

<h1>My first PHP page</h1>

<?php
echo "Hello World!";
?>

</body>
</html>
```

### 变量

与其他语言不同的书

PHP的变量以 $ 符号开始，后面跟着变量的名称，例如

```java
<?php

$txt="Hello world!";
$x=5;
$y=10.5;

echo $x + $y
?>
```

**注意点**

1、在函数外定义的全局变量，在函数里面上无法直接引用的

2、如果要引用，需要才能来 global 来引入

```php
<?php
$x=5; // 全局变量

function myTest()
{
    global $x; // 需要加 global 才能引用全局变量
    $y=10 + $x; // 局部变量
    echo "测试函数内变量:";
    echo "x = $x         ";
    echo "y = $y";

}

myTest();

?>
```

**本质**：PHP 将所有全局变量存储在一个名为 $GLOBALS[*index*] 的数组中。 *index* 保存变量的名称。这个数组可以在函数内部访问，也可以直接用来更新全局变量。

#### static

如果想要函数运行之后，变量不被删除，则可以使用 static

```java
<?php
function myTest()
{
    static $x=0;
    echo $x;
    $x++;
    echo PHP_EOL;    // 换行符
}

myTest();
myTest();
myTest();
?>
```

### EOF

PHP EOF(heredoc)是一种在命令行shell（如sh、csh、ksh、bash、PowerShell和zsh）和程序语言（像Perl、PHP、Python和Ruby）里定义一个字符串的方法。

```java
$name = "runoob";
$a = <<<EOF
        "abc"$name
        "123"
EOF;
// 结束需要独立一行且前后不能空格
echo $a;
```

### 数据类型

```php
<?php 
$x = 10.365;
var_dump($x);
echo "<br>"; 
$x = 2.4e3;
var_dump($x);
echo "<br>"; 
$x = 8E-5;
var_dump($x);
?>
```

#### 数组

```php
<?php 
$cars=array("Volvo","BMW","Toyota");
var_dump($cars);
?>
```

#### 对象

对象必须需要用 class 来声明

```PHP
<?php
class Car
{
    var $color;
    function __construct($color="green") {
        $this->color = $color;
    }
    function what_color() {
        return $this->color;
    }
}

function print_vars($obj) {
    foreach (get_object_vars($obj) as $prop => $val) {
        echo "\t$prop = $val\n";
    }
}

// 实例一个对象
$herbie = new Car("white");

// 显示 herbie 属性
echo "\therbie: Properties\n";
print_vars($herbie);
?>
```

#### 类型比较

- 松散比较：使用两个等号 **==** 比较，只比较值，不比较类型。
- 严格比较：用三个等号 **===** 比较，除了比较值，也比较类型。

#### 常量

设置常量，使用 define() 函数，函数语法如下：

```php
bool define ( string $name , mixed $value [, bool $case_insensitive = false ] )
```

该函数有三个参数:

- **name：**必选参数，常量名称，即标志符。
- **value：**必选参数，常量的值。
- **case_insensitive** ：可选参数，如果设置为 TRUE，该常量则大小写不敏感。默认是大小写敏感的。



### 字符串详解

#### "." 运算符链接两个字符串

```PHP
<?php
$txt1="Hello world!";
$txt2="What a nice day!";
$t = $txt1 . $txt2;
echo $t;
?>
```

#### PHP strlen() 函数

有时知道字符串值的长度是很有用的。

strlen() 函数返回字符串的长度（字节数）。

#### PHP strpos() 函数

strpos() 函数用于在字符串内查找一个字符或一段指定的文本。

如果在字符串中找到匹配，该函数会返回第一个匹配的字符位置。如果未找到匹配，则返回 FALSE。



### 运算符

#### 数组运算符

![image-20200306185812784](/Users/shuaidi/Library/Application Support/typora-user-images/image-20200306185812784.png)

#### 组合比较符(PHP7+)

\```

```
$c = $a <=> $b;
```

解析如下：

- 如果 **$a > $b**, 则 **$c** 的值为 **1**。
- 如果 **$a == $b**, 则 **$c** 的值为 **0**。
- 如果 **$a < $b**, 则 **$c** 的值为 **-1**。



### 循环与条件语句

#### if…else

```php 
<?php
$t=date("H");
if ($t<"10")
{
    echo "Have a good morning!";
}
elseif ($t<"20")// 也可以说是 else if
{
    echo "Have a good day!";
}
else
{
    echo "Have a good night!";
}
?>
```

#### switch

```php
<?php
$favcolor="red";
switch ($favcolor)
{
    case "red":
        echo "你喜欢的颜色是红色!";
      break;
    case "blue":
        echo "你喜欢的颜色是蓝色!";
        break;
    case "green":
        echo "你喜欢的颜色是绿色!";
        break;
    default:
        echo "你喜欢的颜色不是 红, 蓝, 或绿色!";
}
?>
```

### 数组

在 PHP 中，有三种类型的数组：

- **数值数组** - 带有数字 ID 键的数组
- **关联数组** - 带有指定的键的数组，每个键关联一个值
- **多维数组** - 包含一个或多个数组的数组



#### 数值数组

##### 创建

```php
<?php
$cars=array("Volvo","BMW","Toyota");

// 或者
$cars[0]="Volvo";
$cars[1]="BMW";
$cars[2]="Toyota";

echo "I like " . $cars[0] . ", " . $cars[1] . " and " . $cars[2] . ".";
?>
```

#####遍历

```php
<?php
$cars=array("Volvo","BMW","Toyota");
$arrlength=count($cars);

for($x=0;$x<$arrlength;$x++)
{
    echo $cars[$x];
    echo "<br>";
}
?>
```



#### 关联数组

##### 创建

```php
<?php
$age=array("Peter"=>"35","Ben"=>"37","Joe"=>"43");
echo "Peter is " . $age['Peter'] . " years old.";
?>
```

##### 遍历

```PHP
<?php
$age=array("Peter"=>"35","Ben"=>"37","Joe"=>"43");

foreach($age as $key=>$value)
{
    echo "Key=" . $key . ", Value=" . $value;
    echo PHP_EOL;
}
?>
```



#### 多维数组

```php
<?php
$sites = array
(

    "google"=>array
    (
        "Google 搜索",
        "http://www.google.com"
    ),
    "taobao"=>array
    (
        "淘宝",
        "http://www.taobao.com"
    )
);

$cars = array
(
    array(100,96),
    array("BMW",60,59),
    array("Toyota",110,100)
);


print("<pre>"); // 格式化输出数组
print_r($sites);
print("</pre>");

print("<pre>"); // 格式化输出数组
print_r($cars);
print("</pre>");
?>
```

#### 数组排序



在本章中，我们将一一介绍下列 PHP 数组排序函数：

- sort() - 对数组进行升序排列
- rsort() - 对数组进行降序排列
- asort() - 根据关联数组的值，对数组进行升序排列
- ksort() - 根据关联数组的键，对数组进行升序排列
- arsort() - 根据关联数组的值，对数组进行降序排列
- krsort() - 根据关联数组的键，对数组进行降序排列

### PHP 超级全局变量

PHP中预定义了几个超级全局变量（superglobals） ，这意味着它们在一个脚本的全部作用域中都可用。 你不需要特别说明，就可以在函数及类中使用。

PHP 超级全局变量列表:

- $GLOBALS
- $_SERVER
- $_REQUEST
- $_POST
- $_GET
- $_FILES
- $_ENV
- $_COOKIE
- $_SESSION

详情用法可看这里：https://www.runoob.com/php/php-superglobals.html

### 循环

**while循环**

```php
<?php
$i=1;
while($i<=5)
{
    echo "The number is " . $i . "<br>";
    $i++;
}
?>
```

**do…while**

```php
$i=1;
do
{
    $i++;
    echo "The number is " . $i . "<br>";
}
while ($i<=5);
?>
```

**for循环**

```php
<?php
for ($i=1; $i<=5; $i++)
{
    echo "The number is " . $i . "<br>";
}
?>
```

**foreach**

```php
<?php
$x=array("one","two","three");
foreach ($x as $value)
{
    echo $value . "<br>";
}
?>
```



### 函数

```php
<?php
function add($x,$y)
{
    $total=$x+$y;
    return $total;
}
 
echo "1 + 16 = " . add(1,16);
?>
```



### 魔术常量

```php
<?php
// 魔术变量，也就是说会随着运行环境而更改的常量
echo '这是第 " '  . __LINE__ . ' " 行';echo PHP_EOL;

echo '该文件位于 " '  . __FILE__ . ' " ';echo PHP_EOL;


echo '该文件位于 " ' . __DIR__ . ' " ';

function test1() {
    echo  '函数名为：' . __FUNCTION__ ;
}
test1();

?>
```



### 命名空间

可以把非限定名称类比为文件名（例如 comment.php）、.限定名称类比为相对路径名（例如 ./article/comment.php）、完全限定名称类比为绝对路径名（例如 /blog/article/comment.php）

```php
<?php
//创建空间Blog
namespace Blog;
class Comment {
    public function say(){
        echo "hello shuaidi,i am from Blog\n";
    }
}
//非限定名称，表示当前Blog空间
//这个调用将被解析成 Blog\Comment();
$blog_comment = new Comment();
$blog_comment->say();
//限定名称，表示相对于Blog空间
//这个调用将被解析成 Blog\Article\Comment();
$article_comment = new Article\Comment(); //类前面没有反斜杆\
$article_comment->say();
//完全限定名称，表示绝对于Blog空间
//这个调用将被解析成 Blog\Comment();
$article_comment = new \Blog\Comment(); //类前面有反斜杆\
$article_comment->say();
//完全限定名称，表示绝对于Blog空间
//这个调用将被解析成 Blog\Article\Comment();
$article_comment = new \Blog\Article\Comment(); //类前面有反斜杆\
$article_comment->say();
//创建Blog的子空间Article
namespace Blog\Article;
class Comment {
    public function say(){
        echo "hello shuaidi\n";
    }
}
?>
```

输出

```
hello shuaidi,i am from Blog
hello shuaidi
hello shuaidi,i am from Blog
hello shuaidi
```



将全局的非命名空间中的代码与命名空间中的代码组合在一起，只能使用大括号形式的语法。全局代码必须用一个不带名称的 namespace 语句加上大括号括起来

```php
<?php
namespace MyProject {

const CONNECT_OK = 1;
class Connection { /* ... */ }
function connect() { /* ... */  }
}

namespace { // 全局代码
session_start();
$a = MyProject\connect();
echo MyProject\Connection::start();
}
?>
```

##### use 别名

```php
<?php
namespace foo;
use My\Full\Classname as Another;

// 下面的例子与 use My\Full\NSname as NSname 相同
use My\Full\NSname;

// 导入一个全局类
use \ArrayObject;

$obj = new namespace\Another; // 实例化 foo\Another 对象
$obj = new Another; // 实例化 My\Full\Classname　对象
NSname\subns\func(); // 调用函数 My\Full\NSname\subns\func
$a = new ArrayObject(array(1)); // 实例化 ArrayObject 对象
// 如果不使用 "use \ArrayObject" ，则实例化一个 foo\ArrayObject 对象
?>
```

##### 动态导入与别名

导入操作是在编译执行的，但动态的类名称、函数名称或常量名称则不是。

```php
<?php
use My\Full\Classname as Another, My\Full\NSname;

$obj = new Another; // 实例化一个 My\Full\Classname 对象
$a = 'Another';
$obj = new $a;      // 实际化一个 Another 对象
?>
```



### 面向对象与类

```php
<?php
class phpClass {
  var $var1;
  var $var2 = "constant string";
  // 构造函数
  function __construct( $par1, $par2 ) {
   $this->url = $par1;
   $this->title = $par2;
}
  // 析构函数，对象销毁前使用
     function __destruct() {
       print "销毁 " . $this->name . "\n";
   }
  
  function myfunc ($arg1, $arg2) {
     dosomething();
  }
 
}
?>
```



##### 抽像

此外，子类方法可以包含父类抽象方法中不存在的可选参数。

例如，子类定义了一个可选参数，而父类抽象方法的声明里没有，则也是可以正常运行的。

```php
<?php
abstract class AbstractClass
{
    // 我们的抽象方法仅需要定义需要的参数
    abstract protected function prefixName($name);

}

class ConcreteClass extends AbstractClass
{

    // 我们的子类可以定义父类签名中不存在的可选参数
    public function prefixName($name, $separator = ".") {
        if ($name == "Pacman") {
            $prefix = "Mr";
        } elseif ($name == "Pacwoman") {
            $prefix = "Mrs";
        } else {
            $prefix = "";
        }
        return "{$prefix}{$separator} {$name}";
    }
}

$class = new ConcreteClass;
echo $class->prefixName("Pacman"), "\n";
echo $class->prefixName("Pacwoman"), "\n";
?>
```

##### 子类调用父类的构造方法

```php
<?php
class BaseClass {
    function __construct() {
        print "BaseClass 类中构造方法" . PHP_EOL;
    }
}
class SubClass extends BaseClass {
    function __construct() {
        parent::__construct();  // 子类构造方法不能自动调用父类的构造方法
        print "SubClass 类中构造方法" . PHP_EOL;
    }
}
class OtherSubClass extends BaseClass {
    // 继承 BaseClass 的构造方法
}

// 调用 BaseClass 构造方法
$obj = new BaseClass();

// 调用 BaseClass、SubClass 构造方法
$obj = new SubClass();

// 调用 BaseClass 构造方法
$obj = new OtherSubClass();
?>
```



# 表单

### 表单提交

action 可以指定哪个脚步来执行，如果为空，则表示当前文件内的PHP

```php
<?php
$q = isset($_GET['q'])? htmlspecialchars($_GET['q']) : '';
if($q) {
    if($q =='RUNOOB') {
        echo '菜鸟教程<br>http://www.runoob.com';
    } else if($q =='GOOGLE') {
        echo 'Google 搜索<br>http://www.google.com';
    } else if($q =='TAOBAO') {
        echo '淘宝<br>http://www.taobao.com';
    }
} else {
    ?>
    <form action="" method="get">
      // 如果是数组，则可以用 q[]
        <select name="q">
            <option value="">选择一个站点:</option>
            <option value="RUNOOB">Runoob</option>
            <option value="GOOGLE">Google</option>
            <option value="TAOBAO">Taobao</option>
        </select>
        <input type="submit" value="提交">
    </form>
    <?php
}
?>
```



# 进阶

### 日期

```php
<?php
echo date("Y/m/d") . "<br>";
echo date("Y.m.d") . "<br>";
echo date("Y-m-d");
?>
```



### include 与 require

**include 和 require 除了处理错误的方式不同之外，在其他方面都是相同的：**

- require 生成一个致命错误（E_COMPILE_ERROR），在错误发生后脚本会停止执行。
- include 生成一个警告（E_WARNING），在错误发生后脚本会继续执行。

```php
include 'filename';

或者

require 'filename';
```



### 文件

##### 文件处理

```php
<?php
// open
$file=fopen("welcome.txt","r");

// 读取文件每一行，直到文件结尾
while(!feof($file))
{
    echo fgets($file). "<br>";
}
// 逐字符读取文件
while (!feof($file))
{
    echo fgetc($file);
}
// close
fclose($file);
// 检测文件末尾（EOF）
if (feof($file)) echo "文件结尾";
?>

```

![image-20200309160557356](/Users/shuaidi/Library/Application Support/typora-user-images/image-20200309160557356.png)



##### 文件上传

**表单文件 form.html**

```php
<html>
<head>
<meta charset="utf-8">
<title>菜鸟教程(runoob.com)</title>
</head>
<body>

<form action="upload_file.php" method="post" enctype="multipart/form-data">
    <label for="file">文件名：</label>
    <input type="file" name="file" id="file"><br>
    <input type="submit" name="submit" value="提交">
</form>

</body>
</html>
```

**保存被上传到文件**

```php
<?php
// 允许上传的图片后缀
$allowedExts = array("gif", "jpeg", "jpg", "png");
$temp = explode(".", $_FILES["file"]["name"]);
echo $_FILES["file"]["size"];
$extension = end($temp);     // 获取文件后缀名
if ((($_FILES["file"]["type"] == "image/gif")
|| ($_FILES["file"]["type"] == "image/jpeg")
|| ($_FILES["file"]["type"] == "image/jpg")
|| ($_FILES["file"]["type"] == "image/pjpeg")
|| ($_FILES["file"]["type"] == "image/x-png")
|| ($_FILES["file"]["type"] == "image/png"))
&& ($_FILES["file"]["size"] < 204800)   // 小于 200 kb
&& in_array($extension, $allowedExts))
{
    if ($_FILES["file"]["error"] > 0)
    {
        echo "错误：: " . $_FILES["file"]["error"] . "<br>";
    }
    else
    {
        echo "上传文件名: " . $_FILES["file"]["name"] . "<br>";
        echo "文件类型: " . $_FILES["file"]["type"] . "<br>";
        echo "文件大小: " . ($_FILES["file"]["size"] / 1024) . " kB<br>";
        echo "文件临时存储的位置: " . $_FILES["file"]["tmp_name"] . "<br>";
        
        // 判断当期目录下的 upload 目录是否存在该文件
        // 如果没有 upload 目录，你需要创建它，upload 目录权限为 777
        if (file_exists("upload/" . $_FILES["file"]["name"]))
        {
            echo $_FILES["file"]["name"] . " 文件已经存在。 ";
        }
        else
        {
            // 如果 upload 目录不存在该文件则将文件上传到 upload 目录下
            move_uploaded_file($_FILES["file"]["tmp_name"], "upload/" . $_FILES["file"]["name"]);
            echo "文件存储在: " . "upload/" . $_FILES["file"]["name"];
        }
    }
}
else
{
    echo "非法的文件格式";
}
?>
```



### 错误处理

**简单处理**：die()

```php
<?php
if(!file_exists("welcome.txt"))
{
    die("文件不存在");
}
else
{
    $file=fopen("welcome.txt","r");
}
?>
```

**自定义处理**

```php
<?php

// 错误处理函数
function customError($errno, $errstr)
{
    echo "<b>Error:</b> [$errno] $errstr";
}

// 设置错误处理函数
set_error_handler("customError");

// 触发错误
echo($test);

?>
```

对应的语法如下

![image-20200310180333394](/Users/shuaidi/Library/Application Support/typora-user-images/image-20200310180333394.png)



### 处理异常

**普通处理方法**：直接抛出

```php
<?php
// 创建一个有异常处理的函数
function checkNum($number)
{
    if($number>1)
    {
        throw new Exception("Value must be 1 or below");
    }
    return true;
}

// 触发异常
checkNum(2);
?>
```

**通过 try-catch处理**

```php
<?php
// 创建一个有异常处理的函数
function checkNum($number)
{
    if($number>1)
    {
        throw new Exception("变量值必须小于等于 1");
    }
    return true;
}

// 在 try 块 触发异常
try
{
    checkNum(2);
    // 如果抛出异常，以下文本不会输出
    echo '如果输出该内容，说明 $number 变量';
}
// 捕获异常
catch(Exception $e)
{
    echo 'Message: ' .$e->getMessage();
}
?>
```

**自动有异常处理**

```php
<?php
class customException extends Exception
{
    public function errorMessage()
    {
        // 错误信息
        $errorMsg = '错误行号 '.$this->getLine().' in '.$this->getFile()
        .': <b>'.$this->getMessage().'</b> 不是一个合法的 E-Mail 地址';
        return $errorMsg;
    }
}
 
$email = "someone@example.com";
 
try
{
    // 检测邮箱
    if(filter_var($email, FILTER_VALIDATE_EMAIL) === FALSE)
    {
        // 如果是个不合法的邮箱地址，抛出异常
        throw new customException($email);
    }
    // 检测 "example" 是否在邮箱地址中
    if(strpos($email, "example") !== FALSE)
    {
        throw new Exception("$email 是 example 邮箱");
    }
}
catch (customException $e)
{
    echo $e->errorMessage();
}
catch(Exception $e)
{
    echo $e->getMessage();
}
?>
```

**设置顶层异常处理器**

set_exception_handler() 函数可设置处理所有未捕获异常的用户定义函数

```php
<?php
function myException($exception)
{
    echo "<b>Exception:</b> " , $exception->getMessage();
}
 
set_exception_handler('myException');
 
throw new Exception('Uncaught Exception occurred');
?>
```



### 过滤器

如需过滤变量，请使用下面的过滤器函数之一：

- filter_var() - 通过一个指定的过滤器来过滤单一的变量
- filter_var_array() - 通过相同的或不同的过滤器来过滤多个变量
- filter_input - 获取一个输入变量，并对它进行过滤
- filter_input_array - 获取多个输入变量，并通过相同的或不同的过滤器对它们进行过滤

```php
<?php
$int = 123;
 
if(!filter_var($int, FILTER_VALIDATE_INT))
{
    echo("不是一个合法的整数");
}
else
{
    echo("是个合法的整数");
}
?>
```

**自定义过滤器**：必须包含options

```php
<?php
function convertSpace($string)
{
    return str_replace("_", ".", $string);
}

$string = "www_runoob_com!";

echo filter_var($string, FILTER_CALLBACK,
    array("options"=>"convertSpace"));
?>
```



**多个关键词过滤**：选项必须放入一个名为 "options" 的相关数组中。如果使用标志，则不需在数组内。

```php
<?php
$filters = array
(
    "name" => array
    (
        "filter"=>FILTER_SANITIZE_STRING
    ),
    "age" => array
    (
        "filter"=>FILTER_VALIDATE_INT,
        "options"=>array
        (
            "min_range"=>1,
            "max_range"=>120
        )
    ),
    "email"=> FILTER_VALIDATE_EMAIL
);

$result = filter_input_array(INPUT_GET, $filters);

if (!$result["age"])
{
    echo("年龄必须在 1 到 120 之间。<br>");
}
elseif(!$result["email"])
{
    echo("E-Mail 不合法<br>");
}
else
{
    echo("输入正确");
}
?>
```

**更多过滤器相关可以看这里**： https://www.runoob.com/php/php-filter-advanced.html

### JSON转换

数组或者对象转JSON

```php
<?php
   $arr = array('a' => 1, 'b' => 2, 'c' => 3, 'd' => 4, 'e' => 5);
   echo json_encode($arr);
?>
```

JSON转对象或者数组

```php
<?php
   $json = '{"a":1,"b":2,"c":3,"d":4,"e":5}';
   var_dump(json_decode($json));
   //当该参数为 TRUE 时，将返回数组，FALSE 时返回对象。
   var_dump(json_decode($json, true));
?>
```





# MySQL

**链接**

```php
<?php
$servername = "localhost";
$username = "root";
$password = "123456";

// 创建连接
$conn = new mysqli($servername, $username, $password);

// 检测连接
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
}
echo "连接成功";
?>
```

 

# XML

### PHP XML Expat 解析器

```php
<?php
//Initialize the XML parser
$parser=xml_parser_create();

//Function to use at the start of an element
function start($parser,$element_name,$element_attrs)
{
    switch($element_name)
    {
        case "NOTE":
            echo "-- Note --<br>";
            break;
        case "TO":
            echo "To: ";
            break;
        case "FROM":
            echo "From: ";
            break;
        case "HEADING":
            echo "Heading: ";
            break;
        case "BODY":
            echo "Message: ";
    }
}

//Function to use at the end of an element
function stop($parser,$element_name)
{
    echo "<br>";
}

//Function to use when finding character data
function char($parser,$data)
{
    echo $data;
}

//Specify element handler
xml_set_element_handler($parser,"start","stop");

//Specify data handler
xml_set_character_data_handler($parser,"char");

//Open XML file
$fp=fopen("test.xml","r");

//Read data
while ($data=fread($fp,4096))
{
    xml_parse($parser,$data,feof($fp)) or
    die (sprintf("XML Error: %s at line %d",
        xml_error_string(xml_get_error_code($parser)),
        xml_get_current_line_number($parser)));
}

//Free the XML parser
xml_parser_free($parser);
?>
```



### PHP XML DOM

DOM 解析器是基于树的解析器。

请看下面的 XML 文档片段：

```php
<?xml version="1.0" encoding="ISO-8859-1"?>
<from>Jani</from>
```

XML DOM 把上面的 XML 视为一个树形结构：

- Level 1: XML 文档
- Level 2: 根元素： <from>
- Level 3: 文本元素： "Jani"

```php
<?php
$xmlDoc = new DOMDocument();
$xmlDoc->load("note.xml");

// 直接输入文本
print $xmlDoc->saveXML();
// 遍历输出
$x = $xmlDoc->documentElement;
foreach ($x->childNodes AS $item)
{
    print $item->nodeName . " = " . $item->nodeValue . "<br>";
}
?>
?>
```

