Kafka in Docker
===

This repository provides everything you need to run Kafka in Docker.


Why?
---
The main hurdle of running Kafka in Docker is that it depends on Zookeeper.
Compared to other Kafka docker images, this one runs both Zookeeper and Kafka
in the same container. This means:

* No dependency on an external Zookeeper host, or linking to another container
* Zookeeper and Kafka are configured to work together out of the box

Run
---

```bash
docker run -p 2181:2181 -p 9092 --env ADVERTISED_HOST="<dockerHostIP>" -v /var/run/docker.sock:/var/run/docker.sock --name kafka -it kafka
```

```bash
export KAFKA=<dockerHostIP>:9092
kafka-console-producer.sh --broker-list $KAFKA --topic test
```

```bash
export ZOOKEEPER=<dockerHostIP>:2181
kafka-console-consumer.sh --zookeeper $ZOOKEEPER --topic test
```

