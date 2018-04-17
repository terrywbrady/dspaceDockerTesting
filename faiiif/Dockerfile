FROM eclipse/x11_vnc

ENV JETTY_VER=9.4.9.v20180320
ENV CANTALOUPE_VER=3.4.2

ADD --chown=1000 "https://github.com/medusa-project/cantaloupe/releases/download/v${CANTALOUPE_VER}/Cantaloupe-${CANTALOUPE_VER}.zip" /tmp/cantaloupe.zip
ADD --chown=1000 "http://central.maven.org/maven2/org/eclipse/jetty/jetty-distribution/${JETTY_VER}/jetty-distribution-${JETTY_VER}.zip" /tmp/jetty.zip
ADD --chown=1000 "https://github.com/Georgetown-University-Libraries/uv-dist-custom/archive/v1.0.zip" /tmp/uv.zip

RUN unzip -d /home/user /tmp/cantaloupe.zip
RUN ln -s /home/user/Cantaloupe-${CANTALOUPE_VER} /home/user/cantaloupe
COPY cantaloupe.properties /home/user/cantaloupe
EXPOSE 8182

RUN unzip -d /home/user /tmp/jetty.zip
RUN ln -s /home/user/jetty-distribution-${JETTY_VER} /home/user/jetty
RUN mkdir /home/user/jetty/webapps/manifests
RUN unzip -d /home/user/jetty/webapps /tmp/uv.zip

EXPOSE 8080

COPY makeprop.sh /home/user/makeprop.sh
RUN chmod 755 /home/user/makeprop.sh