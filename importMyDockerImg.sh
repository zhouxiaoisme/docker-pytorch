#!/bin/bash
# Please run this script under you host env! not docker-internal env!

#===================================
# zx @ 2020-02-13
#===================================
sudo docker import /zx2/work/sjtuTrafficEventDeployModel/zxExport_ubuntu16.04_pytorch_cuda10.1_v0.tar anibali/pytorch:cuda-10.1
echo "Now docker image anibali/pytorch:cuda-10.1 has been imported!"
echo "Please run ./runMyDocker.sh to load this image and enter container ..."
echo ""

