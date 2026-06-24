HADOOP_VERSION ?= 3.4.3
HIVE_VERSION ?= 4.0.1
all: build tag push

build:
	docker build --build-arg HADOOP_VERSION=$(HADOOP_VERSION) --build-arg HIVE_VERSION=$(HIVE_VERSION) -t kalamangga/hadoop-worker:latest --rm .
tag:
	docker tag kalamangga/hadoop-worker:latest kalamangga/hadoop-worker:hadoop$(HADOOP_VERSION)-hive$(HIVE_VERSION)
push:
	docker push kalamangga/hadoop-worker:latest
	docker push kalamangga/hadoop-worker:hadoop$(HADOOP_VERSION)-hive$(HIVE_VERSION)
