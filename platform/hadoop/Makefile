HADOOP_VERSION ?= 3.4.3
HIVE_VERSION ?= 4.0.1
all: 0base 1hive 2master 3worker

0base:
	cd base && $(MAKE) HADOOP_VERSION=$(HADOOP_VERSION)
1hive:
	cd hive && $(MAKE) HADOOP_VERSION=$(HADOOP_VERSION) HIVE_VERSION=$(HIVE_VERSION)
2master:
	cd master && $(MAKE) HADOOP_VERSION=$(HADOOP_VERSION)
3worker:
	cd worker && $(MAKE) HADOOP_VERSION=$(HADOOP_VERSION) HIVE_VERSION=$(HIVE_VERSION)
deploy:
	docker pull kalamangga/hadoop-master
	docker pull kalamangga/hadoop-worker
	docker compose up
	docker ps -a
