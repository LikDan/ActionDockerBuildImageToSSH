#!/bin/sh -l

cd "$2" || exit

docker build -f "$3"/Dockerfile -t $1 .
docker save --output container.tar container:latest

echo "$5" >> 'key.pem'
chmod 400 'key.pem'

cat 'key.pem'

scp -i 'key.pem' -o 'StrictHostKeyChecking no' container.tar "$4":container.tar
ssh -i "key.pem" -o 'StrictHostKeyChecking no' -t "$4" "sudo docker load --input container.tar && rm container.tar"
