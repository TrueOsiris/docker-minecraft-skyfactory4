FROM java:8

MAINTAINER Tim Chaubet <tim@chaubet.be>

RUN apt-get install -y wget unzip
RUN addgroup --gid 1234 minecraft
RUN adduser --disabled-password --home=/data --uid 1234 --gid 1234 --gecos "minecraft user" minecraft

RUN mkdir /tmp/feed-the-beast && cd /tmp/feed-the-beast && \
## pull file redirected from https://www.curseforge.com/minecraft/modpacks/skyfactory-4/download/2787018/file 
 wget -c https://media.forgecdn.net/files/2787/18/SkyFactory_4_Server_4.1.0.zip -O SkyFactory_4_Server.zip && \
 unzip SkyFactory_4_Server.zip -d /tmp/feed-the-beast && \
 mv SkyFactory_4_Server_4.1.0/* . && \
 rmdir SkyFactory_4_Server_4.1.0 && \
 rm SkyFactory_4_Server.zip 
RUN bash -x Install.sh 
RUN chown -R minecraft /tmp/feed-the-beast

COPY start.sh /start.sh
RUN chmod +x /start.sh

USER minecraft

VOLUME /data
ADD server.properties /tmp/server.properties
WORKDIR /data

EXPOSE 25565

CMD ["/start.sh"]

ENV MOTD "A Minecraft (SkyFactory 4.1.0) Server Powered by Docker"
ENV LEVEL world
ENV JVM_OPTS "-Xms2048m -Xmx2048m"
