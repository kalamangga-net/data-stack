FROM kalamangga/hadoop-hive:3.1.3
ARG WORKDIR=/opt/bigdata
ENV DATADIR=$WORKDIR/data
RUN mkdir -p $WORKDIR/data
VOLUME $WORKDIR/data
COPY run.sh /usr/local/sbin/run.sh
RUN sudo chmod a+x /usr/local/sbin/run.sh
CMD ["run.sh"]
