#!/bin/bash

if find "/data" -mindepth 1 -print -quit | grep -q .; then
    echo "Already exists"
else
    echo "Not exists"
    cd /opt/
    tar -xf teamspeak3-server_linux-amd64-*.tar.gz --strip-components=1 -C /data/
fi

cd /data/

export LD_LIBRARY_PATH=/data

TS3ARGS=""
if [ -e /data/ts3server.ini ]; then
  TS3ARGS="inifile=/data/ts3server.ini"
else
  TS3ARGS="createinifile=1"
fi

exec ./ts3server_linux_amd64 $TS3ARGS
