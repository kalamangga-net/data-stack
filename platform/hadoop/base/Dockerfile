FROM kalamangga/debian:bullseye
RUN apt-get install -y gnupg procps coreutils libc6-dev && apt-get clean
RUN apt-get install -y openjdk-11-jdk && apt-get clean
RUN apt-get install -y python3 python3-pip python-is-python3 && \
    rm -rf /var/lib/apt/lists/*
ARG USERNAME=hdfs
ARG GROUPNAME=hdfs
ARG UID=1001
ARG GID=1001
ARG WORKDIR=/opt/bigdata

RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
 && chmod 0440 /etc/sudoers.d/$USERNAME \
 && groupadd -g $GID $GROUPNAME \
 && useradd -m -s /bin/bash -u $UID -g $GID $USERNAME \
 && mkdir $WORKDIR && chown $USERNAME:$GROUPNAME $WORKDIR

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Hadoop
ARG HADOOP_VER=3.3.6
ARG HADOOP_URL=https://repo.kalamangga.net/apache/hadoop/hadoop-$HADOOP_VER.tar.gz
ENV HADOOP_HOME=$WORKDIR/hadoop-$HADOOP_VER

COPY hadoop-3.3.6.tar.gz /opt/bigdata
WORKDIR $WORKDIR
RUN set -x && tar -xf hadoop-$HADOOP_VER.tar.gz && mkdir $HADOOP_HOME/logs && rm $WORKDIR/hadoop*.gz \
 && chown $USERNAME:$GROUPNAME -R $HADOOP_HOME

ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV PATH=$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native

# Config
COPY --chown=$USERNAME:$GROUPNAME core-site.xml $HADOOP_CONF_DIR/
COPY --chown=$USERNAME:$GROUPNAME hdfs-site.xml $HADOOP_CONF_DIR/
COPY --chown=$USERNAME:$GROUPNAME yarn-site.xml $HADOOP_CONF_DIR/
COPY --chown=$USERNAME:$GROUPNAME mapred-site.xml $HADOOP_CONF_DIR/

# Entry point
COPY entrypoint.sh /usr/local/sbin/entrypoint.sh
RUN sudo chmod a+x /usr/local/sbin/entrypoint.sh
WORKDIR /home/$USERNAME
USER $USERNAME
ENTRYPOINT ["entrypoint.sh"]
