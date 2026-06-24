HIVE_VERSION ?= 4.0.1
HADOOP_VERSION ?= 3.4.3
HIVE_TARBALL=apache-hive-$(HIVE_VERSION)-bin.tar.gz
HIVE_URL=https://archive.apache.org/dist/hive/hive-$(HIVE_VERSION)/$(HIVE_TARBALL)

all: build tag push

build: download
	docker build --build-arg HIVE_VERSION=$(HIVE_VERSION) --build-arg HADOOP_VERSION=$(HADOOP_VERSION) -t kalamangga/hadoop-hive:latest --rm .

tag:
	docker tag kalamangga/hadoop-hive:latest kalamangga/hadoop-hive:$(HIVE_VERSION)-hadoop_$(HADOOP_VERSION)

push:
	docker push kalamangga/hadoop-hive:latest
	docker push kalamangga/hadoop-hive:$(HIVE_VERSION)-hadoop_$(HADOOP_VERSION)

download:
	@if [ ! -f $(HIVE_TARBALL) ]; then \
		echo "Downloading $(HIVE_TARBALL)..."; \
		wget -q $(HIVE_URL); \
	else \
		echo "$(HIVE_TARBALL) already exists."; \
	fi
