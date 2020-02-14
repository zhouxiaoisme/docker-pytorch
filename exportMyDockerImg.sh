#!/bin/bash
# Please run this script under you host env! not docker-internal env!

#===================================
# zx @ 2020-02-13
#===================================
if [ X$1 = X ]; then
echo "Please specify your anibali/pytorch container ID! You can find it by command: docker ps"
echo "Example:"
echo "zx@zx-desktop:/zx2/work/tool/docker-pytorch$ docker ps"
echo "CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS              PORTS               NAMES"
echo "338c2836e05e        anibali/pytorch:cuda-10.1   \"/bin/sh -c /bin/bash\"   About an hour ago   Up About an hour                        musing_bell"
echo 
echo "You can use this command to export anibali/pytorch:cuda-10.1 docker image to a tar file:"
echo "./exportMyDockerImg.sh 338c2836e05e"
echo 
exit
fi

CONTAINER_ID=$1
docker export -o /zx2/work/sjtuTrafficEventDeployModel/zxExport_ubuntu16.04_pytorch_cuda10.1_v0.tar $CONTAINER_ID

