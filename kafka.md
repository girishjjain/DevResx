# Kafka

### Kafka Topics
* Kafka Topics - a particular stream of data (similar to table in database, though there is no data verification)
* A Kafka topic is identified by its name
* You cannot query topics, instead use Kafka producers to send data and Kafka consumers to read data

### Partitions and offsets
* Topics are split in partitions
  * Messages within each partition are ordered, order is guaranteed only within a partition (not across partitions)
  * Each message within a partition gets an incremental if, called offset. Note that offsets are scoped to a partition i.e. offsets only have meaning for a partition. Two different partitions under a topic with the same offset do not represent the same data.
* Kakfa topics are immutable i.e. once data is written to a partition, it cannot be changed. You cannot delete or update.
* Data is kept in Kafka for a limited time, default is a week - configurable
* Data is assigned randomly to a partition, unless a key is provided

### Producers
* Producers write data to Kafka topics (which are made of partitions)
* Prodicers know (and decide) in advance which partition to write to
* Producers can choose to send a key with the message
  * If key=null, data is sent round robin fashion to partitions
  * If key!=null, then all messages for that key will always go to the same partition (hashing)
  * A key is typically sent if you need message ordering for a specific field

### Kafka Message Anatomy
```
+-----------------------------------------------------------+
|                    Key - binary                           |
|                     (Can be null)                         |
+-----------------------------------------------------------+
|                   Value - binary                          |
|                     (Can be null)                         |
+-----------------------------------------------------------+
|                  Compression Type                         |
|     (none, gzip, snappy, lz4, zstd)                       |
+-----------------------------------------------------------+
|                   Headers (optional)                      |
|  +-------------------+-------------------+                |
|  |       Key         |       Value       |                |
|  +-------------------+-------------------+                |
|  |       Key         |       Value       |                |
|  +-------------------+-------------------+                |
+-----------------------------------------------------------+
|                 Partition + Offset                        |
+-----------------------------------------------------------+
|         Timestamp (system or user set)                    |
+-----------------------------------------------------------+
```

### Kafka Message Serializer
* Kafka only accepts bytes as an input from producers and send bytes out as an output to consumers
* Serializer is only used on the value and the key


### Consumers
* Consumers read data from a topic (identified by name) - pull model
* All the consumers in an application read data as a consumer group
* Each consumer within a group reads from exclusive partitions, it's not 1:1 mapping so a consumer within a consumer group can exclusively read from multiple partitions
* You can have multiple "consumer groups" reading from the same topic (but within a consumer group, only one consumer will be assigned to a partition)


### Consumer Offsets
* Kafka stores the offsets at which a consumer group has been reading
* The offsets committed are in Kafka topic named `__consumer_offsets` (internal Kafka topic)


### Kafka Brokers
* A Kafka cluster is composed of multiple brokers 
* Each broker is identified with its ID
* Each broker contains certain topic partitions
* After connecting to any broker (called a bootstrap broker), you will be connected to the entire cluster
* A good number to get started is 3 brokers, but some big clusters have over 100 brokers
* Every Kafka broker is also called a "bootstrap server"

### Topic Replication
* Topics should have a replication factor > 1 (usually between 2 and 3)
* Leader of a partition - An any time only one broker can be a leader for a given partition, other brokers will replicate the data
* Producers can only send data to the broker that is ledaer of a partition
* Therefore, each partition has one leader and multiple ISR (in-sync replica)
* Kafka producers can only write to the leader broker for a partition
* Kafka consumers by default will read from the leader broker for a partition

### Producer Acknowledgements
* Producers can choose to receive acknowledgements of data writes


### Zookeeper
* Zookeeper manager brokers
* Zookeeper helps in performing leader election for partitions
* Kafka 2.x can't work without Zookeeper
* Kafka 3.x can work withou Zookeeper - using Kafka Raft instead
* Kafka 4.x will not have Zookeeper
