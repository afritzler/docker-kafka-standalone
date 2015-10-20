#!/bin/bash

HOST=$(hostname)

RESPONSE=$(echo -e "GET /containers/"$HOST"/json HTTP/1.0\r\n" | nc -U /var/run/docker.sock)

PORT=$(echo $RESPONSE | grep -Po '"Ports":.*'| sed 's/'"SandboxKey"'/|/'| cut -d '|' -f1| grep -Po '"9092/tcp":.*' | grep -Po '"HostPort":.*' | cut -d : -f2 | cut -d '"' -f2 )


echo $PORT
