FROM tomcat:8

ENV JAVA_OPTS=-Xmx2000m
COPY tomcat-users.xml /usr/local/tomcat/conf
COPY manager-context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

RUN ln -s /dspace/webapps/solr /usr/local/tomcat/webapps/solr
RUN ln -s /dspace/webapps/xmlui /usr/local/tomcat/webapps/xmlui
