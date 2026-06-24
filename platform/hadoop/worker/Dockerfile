ARG HIVE_VERSION=4.0.1
FROM kalamangga/hadoop-hive:${HIVE_VERSION}
ARG WORKDIR=/opt/bigdata
ENV DATADIR=$WORKDIR/data
RUN mkdir -p $WORKDIR/data
VOLUME $WORKDIR/data
COPY run.sh /usr/local/sbin/run.sh
RUN chmod a+x /usr/local/sbin/run.sh
CMD ["run.sh"]
