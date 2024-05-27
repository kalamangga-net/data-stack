FROM kalamangga/hadoop-base:3.3.6
HEALTHCHECK CMD curl -f http://localhost:8188/ || exit 1
ENV YARN_CONF_yarn_timeline___service_leveldb___timeline___store_path=/data/yarn/timeline
RUN sudo mkdir -p /data/yarn/timeline
VOLUME /data/yarn/timeline
ADD run.sh /run.sh
RUN sudo chmod a+x /run.sh
EXPOSE 8188
CMD ["/run.sh"]
