HADOOP_VERSION ?= 3.4.3
HADOOP_TARBALL=hadoop-$(HADOOP_VERSION).tar.gz
HADOOP_URL=https://archive.apache.org/dist/hadoop/common/hadoop-$(HADOOP_VERSION)/$(HADOOP_TARBALL)

all: pull build tag push

pull:
	docker pull kalamangga/debian:bullseye
build: download
	docker build -t kalamangga/hadoop-base:latest --build-arg HADOOP_VER=$(HADOOP_VERSION) --rm .
tag:
	docker tag kalamangga/hadoop-base:latest kalamangga/hadoop-base:$(HADOOP_VERSION)
push:
	docker push kalamangga/hadoop-base:latest
	docker push kalamangga/hadoop-base:$(HADOOP_VERSION)

download:
	@if [ ! -f $(HADOOP_TARBALL) ]; then \
		echo "Downloading $(HADOOP_TARBALL)..."; \
		wget -q $(HADOOP_URL); \
	else \
		echo "$(HADOOP_TARBALL) already exists."; \
	fi
