#!/bin/bash -ex

tag=ryanshaw/garlicoin-core-builder

docker build -t $tag .
docker run -it -v $(pwd)/output/:/output $tag