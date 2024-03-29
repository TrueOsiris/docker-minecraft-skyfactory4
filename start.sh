#!/bin/bash

set -e
forgejar="forge-1.12.2-14.23.5.2860.jar"

cd /data

if [ ! -f "$forgejar" ]; then
	cp -rf /tmp/feed-the-beast/* .
fi
echo "eula=true" > eula.txt

if [[ -n "$MOTD" ]]; then
    sed -i "/motd\s*=/ c motd=$MOTD" /data/server.properties
fi
if [[ -n "$LEVEL" ]]; then
    sed -i "/level-name\s*=/ c level-name=$LEVEL" /data/server.properties
fi
if [[ -n "$OPS" ]]; then
    echo $OPS | awk -v RS=, '{print}' >> ops.txt
fi

#java $JVM_OPTS -jar forge-*-universal.jar nogui
java $JVM_OPTS -jar $forgejar nogui
