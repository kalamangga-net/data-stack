FROM kalamangga/hadoop-base:3.3.6

ARG USERNAME=hdfs
ARG GROUPNAME=hdfs
ARG UID=1001
ARG GID=1001
ARG WORKDIR=/opt/bigdata

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Hive
ARG HIVE_VERSION=3.1.3
ARG HIVE_URL=https://repo.kalamangga.net/apache/hive/apache-hive-$HIVE_VERSION-bin.tar.gz
ENV HIVE_HOME=/opt/bigdata/apache-hive-3.1.3-bin

COPY --chown=$USERNAME:$GROUPNAME apache-hive-3.1.3-bin.tar.gz $WORKDIR
WORKDIR $WORKDIR
RUN set -x \
 && tar -xf apache-hive-3.1.3-bin.tar.gz && rm $WORKDIR/apache-hive*.gz \
 && chown $USERNAME:$GROUPNAME $HIVE_HOME

RUN sudo rm $HIVE_HOME/lib/guava-*.jar \
 && sudo cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-*.jar $HIVE_HOME/lib/
#RUN mv /opt/hive/lib/log4j-slf4j-impl-2.6.2.jar /opt/hive/lib/log4j-slf4j-impl-2.6.2.jar.bak

ENV HIVE_CONF_DIR=$HIVE_HOME/conf
ENV PATH=$HIVE_HOME/sbin:$HIVE_HOME/bin:$PATH

COPY --chown=$USERNAME:$GROUPNAME hive-site.xml $HIVE_CONF_DIR/
