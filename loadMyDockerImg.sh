#!/bin/bash
# Please run this script under you host env! not docker-internal env!

#===================================
# zx @ 2020-02-13
#===================================
if [ X$1 = "X-h" ]; then
echo "Example:"
echo "./loadMyDockerImg.sh"
echo "You can use this command to load anibali/pytorch:cuda-10.1 docker image from a tar file."
echo
echo "Tips:"
echo "After executing this command, you can use below commands to check whether this image has been loaded:"
echo "$ docker images"
echo "REPOSITORY          TAG                     IMAGE ID            CREATED             SIZE"
echo "anibali/pytorch     cuda-10.1               886f83d47440        40 minutes ago      4.28GB"
echo "hello-world         latest                  fce289e99eb9        13 months ago       1.84kB"
echo
exit
fi

echo sudo docker load /zx2/work/sjtuTrafficEventDeployModel/zxSave_ubuntu16.04_pytorch_cuda10.1_v0.tar 
sudo docker load -i /zx2/work/sjtuTrafficEventDeployModel/zxSave_ubuntu16.04_pytorch_cuda10.1_v0.tar 
echo "Now docker image anibali/pytorch:cuda-10.1 has been loaded!"
echo "Please run ./runMyDocker.sh to load this image and enter container ..."
echo ""

