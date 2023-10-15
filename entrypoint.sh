#!/bin/sh -l

cd "$2" || exit

docker build -f "$3"/Dockerfile -t $1 .
docker save --output container.tar container:latest

echo "$5" >> 'key.pem'

scp -i 'key.pem' container.tar "$4":container.tar
ssh -i "key.pem" -t "$4" "sudo docker load --input container.tar && rm container.tar"
