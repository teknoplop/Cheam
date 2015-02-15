docker rm $(docker ps -aq -f status=exited)
docker rmi $(docker images -f "dangling=true" -q)
