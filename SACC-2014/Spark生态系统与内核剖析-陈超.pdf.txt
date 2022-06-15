Spark Ecosystem & Internals
  @CrazyJvm

outline
· basis & internals · ecosystem

Current Major Release
· Just released Spark 1.1

Spark : What & Why
· Apache Spark is a fast and general engine for large-scale data processing.
· Speed · Ease of Use · Generality · Integrated with Hadoop

BDAS

one stack to rule them all

Key Concept-RDD
· A list of partitions · A function for computing each split · A list of dependencies on other RDDs · Optionally, a Partitioner for key-value RDDs · Optionally, a list of preferred locations to
compute each split on

Key Concept-Lineage
unroll partition safely when caching

Key Concept-Dependency

Key Concept-ClusterManager
· Local · Standalone · Yarn · Mesos

Cluster Overview

schedule

Executor

Shuffle
Sort-based shuffle supported

Shuffle
· Pull-based (not push-based) · Write intermediate files to disk · Build hash map within each partition · Can spill across keys · A single key-value pair must fit in memory

Better Metrics System
· Previously: only collect after task completed · Now : report when task is still running

outline
· basis & internals · ecosystem

Spark Streaming
· Mini-batch

MLlib
· Spark implementation of some common machine learning algorithms and utilities
· classification · regression · clustering · collaborative filtering · dimensionality reduction
feature extraction supported: Word2Vec , TF-IDF

GraphX

GraphX

Spark SQL

Spark SQL
· Data Sources · RDDs/Parquet Files/JSON Datasets/Hive Table · DSL · JDBC Server
Programmatically Specifying the Schema

Shark
· Development in Shark has been ended and subsumed by Spark SQL
· Mission completed !!!

Tachyon

Tachyon

SparkR

BlinkDB
· Queries with Bounded Errors and Bounded Response Times on Very Large Data

contact me
weibo:@CrazyJvm wechat public account : ChinaScala

Q&A

