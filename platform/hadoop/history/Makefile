HADOOP_VERSION ?= 3.4.3
all: build tag push

build:
	docker build -t kalamangga/hadoop-history:latest --rm .
tag:
	docker tag kalamangga/hadoop-history:latest kalamangga/hadoop-history:$(HADOOP_VERSION)
push:
	docker push kalamangga/hadoop-history:latest
	docker push kalamangga/hadoop-history:$(HADOOP_VERSION)
