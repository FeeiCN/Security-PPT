H ouse.M.D

@taobao.com
https://github.com/zhongl

  

  
...

System.out.println("debugging");

LOG.debug("debugging");

?  >  > , ?
?



BTrace
, !

Histogram

Profile

Context

Invocation Interception

JStack
Socket
JInfo

File
JMap

DTrace Memory

, 

ClassNotFoundException
https://gist.github.com/zhongl/5625338

StackOverflowError
https://gist.github.com/zhongl/5625366

IDE, ? , ?
, ?

HouseMD


$ housemd <jvm pid> INFO : Welcome to HouseMD 0.2.4 INFO : connection established on 54321 housemd> _

`trace TraceTarget.addOne`

`trace TraceTarget$C+`
trace sub class

`trace -d TraceTarget$C+`
get args and return

`trace -s TraceTarget$C+`
get invocation StackTrace

Demo

http://github.com/csug/housemd

Tips & Traps

`trace` with `-l -t`
limit < 100 timeout < 3

`trace` with `Xxx+`
trace unknown sub class instance

`trace` with `-p com.xxx`
SimpleName conflict

`last` for error ending
INFO: Ended by error

`loaded` for class info
class loaded by who from where

`housemd -p <port>`
port conflict

`Ctrl + r` for history search
Emacs edit mode, power by jline2

Linux mode in SecureCRT
Backspace do not work

No echo cause by privilege
chmod +w /tmp

More help !
housemd -h > help [command]
test cases issues

v0.3.x
Features

`trace Socket`
Support trace class from BootClassLoader

Represent object
`trace -r "$.getLocalSocketAddress" Socket`

TOP View

METHOD

AVG(ms) TIMES REPR

LOADER

Socket.connect

4 1 127.0.0.1:12306 BootClassLoader

Socket.getChannel

<1 4 127.0.0.1:12306 BootClassLoader

Press `esc` to break.

Upgrade Scala 2.1x
Akka actor and more functional

Contribute to HouseMD
https://github.com/CSUG/HouseMD/wiki/DevGuideCN

Intro CSUG

Thanks

