HADOOP_VERSION ?= 3.4.3
HIVE_VERSION ?= 4.0.1

all: build tag push

build:
	docker build --build-arg HIVE_VERSION=$(HIVE_VERSION) -t kalamangga/hadoop-master:latest --rm .
tag:
	docker tag kalamangga/hadoop-master:latest kalamangga/hadoop-master:hadoop$(HADOOP_VERSION)-hive$(HIVE_VERSION)
push:
	docker push kalamangga/hadoop-master:latest
	docker push kalamangga/hadoop-master:hadoop$(HADOOP_VERSION)-hive$(HIVE_VERSION)
