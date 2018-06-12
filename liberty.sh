#!/bin/bash

script_dir="$(pwd)"
git clone git@github.com:OpenLiberty/ci.docker.git

pushd $script_dir/ci.docker/release/kernel/java8/openj9
`sed -ie 's/FROM adoptopenjdk\/openjdk8-openj9/FROM adoptopenjdk\/openjdk8-openj9\:nightly/g' Dockerfile`
docker build -t liberty-openjdk8-openj9 .
[ "$?" != "0" ] && echo "Docker build of liberty failed."
popd

rm -rf ci.docker

docker build -t helloworld-openjdk8-mxbean .
