FROM kalamangga/debian:11
RUN apt -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install --no-install-recommends \
      sudo \
      openjdk-11-jdk \
      curl \
      gnupg \
      procps \
      python3 \
      python3-pip \
      python-is-python3 \
      coreutils \
      libc6-dev && \
    rm -rf /var/lib/apt/lists/*

ARG USERNAME=jupyter
ARG GROUPNAME=jupyter
ARG UID=1001
ARG GID=1001

RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME && \
    groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID $USERNAME

USER $USERNAME

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Hadoop
ARG HADOOP_VER=3.3.6
ARG HADOOP_URL=https://repo.kalamangga.net/apache/hadoop/hadoop-$HADOOP_VER.tar.gz
ENV HADOOP_HOME=/opt/hadoop

RUN set -x && \
    curl -fsSL https://archive.apache.org/dist/hadoop/common/KEYS -o /tmp/hadoop-KEYS && \
    gpg --import /tmp/hadoop-KEYS && sudo mkdir $HADOOP_HOME && \
    sudo chown $USERNAME:$GROUPNAME -R $HADOOP_HOME && \
    curl -fsSL $HADOOP_URL -o /tmp/hadoop.tar.gz && \
    curl -fsSL $HADOOP_URL.asc -o /tmp/hadoop.tar.gz.asc && \
    gpg --verify /tmp/hadoop.tar.gz.asc && \
    tar -xf /tmp/hadoop.tar.gz -C $HADOOP_HOME --strip-components 1 && \
    mkdir $HADOOP_HOME/logs && rm /tmp/hadoop*

ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV PATH=$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$PATH
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH

# Config
COPY --chown=$USERNAME:$GROUPNAME core-site.xml $HADOOP_CONF_DIR/
COPY --chown=$USERNAME:$GROUPNAME hdfs-site.xml $HADOOP_CONF_DIR/
COPY --chown=$USERNAME:$GROUPNAME yarn-site.xml $HADOOP_CONF_DIR/
COPY --chown=$USERNAME:$GROUPNAME mapred-site.xml $HADOOP_CONF_DIR/

# Entry point
COPY entrypoint.sh /usr/local/sbin/entrypoint.sh
RUN sudo chmod a+x /usr/local/sbin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
