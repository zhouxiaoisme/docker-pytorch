#!/bin/bash

#===================================
# zx @ 2020-02-13
#===================================

MY_WORK_DIR="/zx2/work"
sudo docker run --rm -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --gpus all  --ipc=host --user="$(id -u):$(id -g)"   --volume="${MY_WORK_DIR}:${MY_WORK_DIR}" -e NVIDIA_VISIBLE_DEVICES=all -e NVIDIA_DRIVER_CAPABILITIES=compute,utility,video   -v /etc/localtime:/etc/localtime:ro   anibali/pytorch:cuda-10.1
