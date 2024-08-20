FROM kalamangga/hadoop-hive:3.1.3
ENV NAMEDIR=/opt/bigdata/hadoop-3.3.6/dfs/name
RUN mkdir -p /opt/bigdata/hadoop-3.3.6/dfs/name
VOLUME /opt/bigdata/hadoop-3.3.6/dfs/name
COPY run.sh /usr/local/sbin/run.sh
RUN sudo chmod a+x /usr/local/sbin/run.sh
CMD ["run.sh"]
