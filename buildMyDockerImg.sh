#!/bin/bash

#===================================
# zx @ 2020-02-13
#===================================
echo "Now build docker image from dockerfile ./docker-pytorch/cuda-10.1/dockerfile..."
sudo docker build -t anibali/pytorch:cuda-10.1 ./cuda-10.1/
echo "Now build docker image from dockerfile ./docker-pytorch/cuda-10.1/dockerfile... Finished!"
echo "Please run command: docker images to check anibali/pytorch:cuda-10.1 image!"
echo 


