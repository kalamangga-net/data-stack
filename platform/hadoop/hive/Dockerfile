ARG HADOOP_VERSION=3.4.3
FROM kalamangga/hadoop-base:${HADOOP_VERSION}

ARG USERNAME=hdfs
ARG GROUPNAME=hdfs
ARG UID=1001
ARG GID=1001
ARG WORKDIR=/opt/bigdata

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Hive
ARG HIVE_VERSION
ENV HIVE_HOME=/opt/bigdata/apache-hive-$HIVE_VERSION-bin

COPY --chown=$USERNAME:$GROUPNAME apache-hive-$HIVE_VERSION-bin.tar.gz $WORKDIR
WORKDIR $WORKDIR
RUN set -x \
 && tar -xf apache-hive-$HIVE_VERSION-bin.tar.gz && rm $WORKDIR/apache-hive*.gz \
 && chown $USERNAME:$GROUPNAME $HIVE_HOME

RUN sudo rm $HIVE_HOME/lib/guava-*.jar \
 && sudo cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-*.jar $HIVE_HOME/lib/

ENV HIVE_CONF_DIR=$HIVE_HOME/conf
ENV PATH=$HIVE_HOME/sbin:$HIVE_HOME/bin:$PATH
COPY --chown=$USERNAME:$GROUPNAME postgresql-42.7.10.jar $HIVE_HOME/lib/
COPY --chown=$USERNAME:$GROUPNAME hive-site.xml $HIVE_CONF_DIR/
