all: 0base 1hive 2master 3worker

0base:
	cd base && $(MAKE)
1hive:
	cd hive && $(MAKE)
2master:
	cd master && $(MAKE)
3worker:
	cd worker && $(MAKE)
deploy:
	docker pull kalamangga/hadoop-master
	docker pull kalamangga/hadoop-worker
	docker-compose up
	docker ps -a
