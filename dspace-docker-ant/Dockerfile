
FROM openjdk
EXPOSE 4403 8000 8080 9876 22


ENV ANT_VERSION 1.10.2
ENV ANT_HOME /opt/ant-$ANT_VERSION
ENV PATH $ANT_HOME/bin:$PATH


RUN mkdir $ANT_HOME && \
    wget -qO- "https://www.apache.org/dist/ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz" | tar -zx --strip-components=1 -C $ANT_HOME


RUN mkdir /dspace
RUN mkdir /dspace/upload
