Scala
 2015.12


 Ali-tomcat  Scala bloghttp://hongjiang.info

1. 


· 
200
50
· 



· NginxTomcat Spring-mvc/Play · SpringbootDubboZookeeperSpringMybatis · MySqlCobarHbaseMongoRedis/Memcached · KafkaStorm · ZabbixELK
 Java/Scala, Go, C++, Python/Php


·  ­ Mongo ­ Memcached ­ python ­ 



  


 















...













...



App

Web









 






 



web Nginx


app
Nginx

Tomcat

Tomcat

Tomcat

Session

Cache

Dubbo/ Springboot

Dubbo/ Springboot

Dubbo/ Springboot

Tomcat
Dubbo/ Springboot

kafka

Cache

DB

Akka

 


 ha-proxy

cobar

cobar

mysql



n
Hbase

event


raw-data

listener akka

kafka classifier

assembler assembler

assembler akka

subscriber

distiller

distiller DB

distiller



mysql
binlog canal

kafka

Storm

codis

redis group

redis group

Hadoop/Spark

cobar

mysql

mysql

2. Scala


. ""  .Arc  ()  


Scala
 
: 1) hold 2)  3)  4) ScalaJava
­ Scala

Scala
 Scala
· 1singleton pattern ! object · 2visitor pattern ! pattern matching · 3) facotry pattern ! apply method · 4) builder pattern ! currying · 5) dependency inject ! cake pattern · 6) immutable pattern ! val · 7) value object ! case class · ......

Scala
  ! pimp my library(implicit ) Scala 2.10 Dynamic Types......
 C# using ! 
 // () cashflowBuf.groupBy(_.transactionNo).filter(_._2.size == 2).values // 1 scala> val timeList = List(1,2,3,5,7,8) scala> timeList.sliding(2,1).filter(e=>e(1)-e(0)<=1).foreach(println) List(1, 2) List(2, 3) List(7, 8)

Scala
· 
­ () ·  eta
­ () · (type class) · type lambda  · ScalaSKI calculus

Scala
·  ­  ­  ­  ­ 

Scala
· Scala ­ (akka)
· servlet · Spring

Scala
· Scala  Spring, MyBatis  ­  ­ @BeanProperty ­ case class var
· Akka  Spring ­ 
· ScalaDubbo ­  ­ API/Interface Java ­ ProviderScalajava Scala

Scala
· Jdk8, Scala2.11
· REPL( )
· mavensbtmaven (maven)
·  mvn spring-boot:run  mvn tomcat7:run 
·  -explaintypes -Yno-adapted-args -Ywarn-dead-code -Ywarn-unused -Ywarn-unused-import

3. Cobar/Kafka/Akka

Cobar
·  ·  · Hash sharding vs Range sharding

Kafka
·  ­  ­ 
·  ­ 
·  ­ 

Kafka

1)   cat file | grep content | awk `{print $1}' 

k a scriber f filter k a

processor

2) Journal System  

Kafka

JVM



http-proxy

Kafka

zk

zk

zk



offset redis

Kafka
· SimpleConsumer ­ offsetrediszookeeper ­ 
·  ­ 10~20% ­  topic

Kafka
·  1 2msgSize, replicaSizefetchSize  3) 

Akka
·  ·  · 






LB

Netty

Netty

Netty

Netty

Async

API http

Akka

Akka

Akka

Akka



Akka

Akka

Akka

Codis/Redis

Akka Service



Actor

pull

Kafka Receiver

Processor

response

Submit Async HttpInvoke

API-1

callback

APIInvoker

API-2

success exception

API-3

Storer

Recycler

Akka
·  ·  ·  · ForkJoin CPU

work-stealing 

top 
base


task

task

task

Work-stealing

LIFO Youngest-first

worker thread

worker thread

  stealing

Akka
· Kafka ­ 
· Akka  Spring  ­ /Actor  ­ Akka Extension

Akka
·  ­ Actor ­  ­ Supervisor ­ Push vs Pull ­ WaterMark ­ 

Akka
· (cameo pattern) ­ Pattern.ask 
· Extra pattern
· Circuit Breaker · WaterMark

()

()
GovernorTerminator

Master
master

user
watch

Governoractor governor
governor

Master""Governor governor

kafka receiver

processor

()
 GovernorActor
abstract class ContextManager(signal: Semaphore) extends Actor {
// actor protected def stopAll(kids: List[OrderedActorRef]): Future[Any] = {
kids match { case first :: Nil => gracefulStop(first.actor, stopTimeout).flatMap { _ => Future { AllDead } } case first :: rest => gracefulStop(first.actor, stopTimeout).flatMap { _ => stopAll(rest) } case Nil => Future { AllDead }
} } ...

()
 Governor Actor shutdownreceiverprocessorstorer
class Governor(signal: Semaphore) extends ContextManager(signal) { override def createActors() { val ext = SpringExtension(context.system) // 1) receiver val receiver = context.actorOf(props(ext, "serialConsumer"), "kafkaReceiver") setOrderNo(receiver, 0) // 2) processor val processor = context.actorOf(props(ext, "processor").withRouter(getProcessorRouter), "processor") setOrderNo(processor, 1) // 3) storer val storer = context.actorOf(props(ext, "storer").withRouter(getStorerRouter), "storer") setOrderNo(storer, 2) }
.... } (shutdownhook)master signalsignalakka

()

master ! PoisonPill
master

masterTerminatedgovernor

watch

governor

 actor signal

kafka receiver

processor





Akka in Production: our story by Evan Chan GearpumpAkkaby 

