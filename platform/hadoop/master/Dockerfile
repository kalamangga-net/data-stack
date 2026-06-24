ARG HIVE_VERSION=4.0.1
FROM kalamangga/hadoop-hive:${HIVE_VERSION}
ENV NAMEDIR=/opt/bigdata/hadoop-${HIVE_VERSION}/dfs/name
RUN mkdir -p /opt/bigdata/hadoop-${HIVE_VERSION}/dfs/name
VOLUME /opt/bigdata/hadoop-${HIVE_VERSION}/dfs/name
COPY run.sh /usr/local/sbin/run.sh
RUN sudo chmod a+x /usr/local/sbin/run.sh
CMD ["run.sh"]
