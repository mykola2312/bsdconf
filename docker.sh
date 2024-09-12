#!/usr/bin/env bash
# Tool to set docker remote TCP daemon

docker_port="2375"
docker_default="srv-master"

if [ -n "$1" ]; then
  export DOCKER_HOST="tcp://$1:$docker_port"
else
  export DOCKER_HOST="tcp://$docker_default:$docker_port"
fi

# enter shell with new environment variables

$SHELL
