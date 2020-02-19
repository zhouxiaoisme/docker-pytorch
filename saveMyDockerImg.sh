#!/bin/bash
# Please run this script under you host env! not docker-internal env!

#===================================
# zx @ 2020-02-13
#===================================
if [ X$1 = "X-h" ]; then
echo "Example:"
echo "./saveMyDockerImg.sh"
echo "You can use this command to save anibali/pytorch:cuda-10.1 docker image to a tar file."
echo
echo "Tips:"
echo "Please check whether there is anibali/pytorch:cuda-10.1 docker image in your current env before executing this command!"
echo "You can use below commands to check:"
echo "$ docker images"
echo "REPOSITORY          TAG                     IMAGE ID            CREATED             SIZE"
echo "anibali/pytorch     cuda-10.1               886f83d47440        40 minutes ago      4.28GB"
echo "hello-world         latest                  fce289e99eb9        13 months ago       1.84kB"
echo
exit
fi

echo docker save -o /zx2/work/sjtuTrafficEventDeployModel/zxSave_ubuntu16.04_pytorch_cuda10.1_v0.tar anibali/pytorch:cuda-10.1
docker save -o /zx2/work/sjtuTrafficEventDeployModel/zxSave_ubuntu16.04_pytorch_cuda10.1_v0.tar anibali/pytorch:cuda-10.1

