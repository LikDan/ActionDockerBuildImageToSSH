#!/bin/sh -l

cd "$2" || exit

docker build -f "$3"/Dockerfile -t "$1" .
docker save --output container.tar "$1"

echo "$5" > 'key.pem'
chmod 600 'key.pem'

scp -i 'key.pem' -o 'StrictHostKeyChecking no' container.tar "$4":container.tar

cmd=$(printf '(sudo docker rmi -f %s || true) && sudo docker load --input container.tar && rm container.tar' "$1")
ssh -i "key.pem" -o 'StrictHostKeyChecking no' -t "$4" "$cmd"

rm container.tar
