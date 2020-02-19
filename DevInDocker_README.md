# 在本项目setup的pytoch docker中 使用 sjtuTrafficEvent 的 procedure
## 一.  docker环境准备
### 1.  build pytorch for cuda10.1 docker（可选）
在你的本地console环境中执行如下命令：
>$ chmod a+x ./buildMyDockerImg.sh

然后执行
>$ ./buildMyDockerImg.sh

以上命令用来在本地build一个pytorch for cuda10.1 docker。如果命令执行成功，将在本地的docker image repo中生成一个anibali/pytorch:cuda-10.1 docker image。你可以透过如下命令查看是否已经生成的image:
>$ docker images

如:
>zx@zx-desktop:/zx2/work/tool/docker-pytorch$ docker images
><br> REPOSITORY          TAG                    IMAGE ID            CREATED             SIZE
><br>anibali/pytorch     cuda-10.1               9d5db51cd8a6        4 days ago          4.16GB

### 2.  download and load prebuilt docker（可选）
**由于步骤1中，build docker过程视网络链接可能运行较长，因此，步骤1可以跳过不做，而是直接使用zxDocker_README.md文件中给出的url获取prebuild 好的docker image, 如：zxSave_ubuntu16.04_pytorch_cuda10.1_v0.tar***

2.1) 从URL中将其下载到你本地某个位置，比如：/zx2/work/sjtuTrafficEventDeployModel/目录下
2.2) 下载完成之后，执行如下命令load prebuilt docker image tar file到docker image repo：
>$ chmod a+x ./loadMyDockerImg.sh

如:
>zx@zx-desktop:/zx2/work/tool/docker-pytorch$ ./loadMyDockerImg.sh 
><br>sudo docker import /zx2/work/sjtuTrafficEventDeployModel/zxSave_ubuntu16.04_pytorch_cuda10.1_v0.tar zhouxiao/pytorch:cuda-10.1
><br>[sudo] password for zx: 
><br>sha256:1efd809221e2b6beec6059d3ef214fd98d91c27e678da4f5f76905db1f4fc624
><br>Now docker image anibali/pytorch:cuda-10.1 has been loaded!
><br>Please run ./runMyDocker.sh to load this image and enter container ...


**TIPS**

**如果下载位置不是上述描述，请修改loadMyDockerImg.sh文件中load的docker文件路径**

### 3.  run pytorch for cuda10.1 docker
在你的本地console环境中执行如下命令：
><br>$ chmod a+x ./runMyDocker.sh
><br>$ ./runMyDocker.sh

如:
><br>zx@zx-desktop:/zx2/work/tool/docker-pytorch$ ./runMyDocker.sh 
><br>user@825d90a0e576:/app$ 

这将进入这个docker环境中，之后你就可以在这个docker环境中工作了，比如：对Pytorch模型进行训练或推理。

## 二.  pytorch模型推理演示
### 1.  在docker环境中使用python调用$sjtuTrafficEvent/src/下的pyInfer.py脚本，这个是road object detector的推理过程演示脚本：
如：
>user@825d90a0e576:/zx2/work/sjtuTrafficEvent/src$ python pyInfer.py
><br>Now init model roadmonitor_yolov3 with weights >/zx2/work/sjtuTrafficEventDeployModel/models/pytorch/v2.1/yolov3_best.pt.clean ...
><br>===================== Model bias online adjust info [START] =====================
><br>Model Bias Summary (per output layer):</br>
><br>regression: -0.00+/-0.02   objectness: -5.00+/-0.00   classification: -5.00+/-0.02 
><br>regression:  0.00+/-0.03   objectness: -5.00+/-0.02   classification: -5.00+/-0.03 
><br>regression:  0.00+/-0.03   objectness: -5.00+/-0.02   classification: -5.00+/-0.03 
><br>regression: -0.01+/-0.04   objectness: -5.00+/-0.05   classification: -5.00+/-0.03 
><br>===================== Model bias online adjust info [END]   =====================
><br>Now init model roadmonitor_yolov3 with weights /zx2/work/sjtuTrafficEventDeployModel/models/pytorch/v2.1/yolov3_best.pt.clean ... ok!
><br>Loading roadmonitor time:  4.114747047424316
><br>===================== ===========================
><br>RoadMonitor - Detector YOLOv3 's state_dict:</br>
><br>===================== ===========================
>
>module_list.0.Conv2d.weight 	 torch.Size([32, 3, 3, 3])
>module_list.0.BatchNorm2d.weight 	 torch.Size([32])
>module_list.0.BatchNorm2d.bias 	 torch.Size([32])
>module_list.0.BatchNorm2d.running_mean 	 torch.Size([32])
>    ....
>module_list.112.Conv2d.weight 	 torch.Size([30, 256, 1, 1])
>module_list.112.Conv2d.bias 	 torch.Size([30])
>
><br>===================== ===========================
><br>RoadMonitor - Detector YOLOv3 's arch:
><br>NetInImgShape (3, 416, 416)
><br>===================== ===========================
>
>      Layer (type)               Output Shape         Param #
>===================== ===========================
>
>            Conv2d-1         [-1, 32, 416, 416]             864
>       BatchNorm2d-2         [-1, 32, 416, 416]              64
>         LeakyReLU-3         [-1, 32, 416, 416]               0
>            Conv2d-4         [-1, 64, 208, 208]          18,432
>       ......
>     BatchNorm2d-137         [-1, 1024, 13, 13]           2,048
>       LeakyReLU-138         [-1, 1024, 13, 13]               0

>----------
>
><br>batchsize: 5 workers: 5
><br>image_path = /zx2/work/sjtuTrafficEventTstImgs/detect use_json = False use_detect = True debug = False

><br>[RoadDataset] Now process img /zx2/work/sjtuTrafficEventTstImgs/detect/construction_2189_c3.jpg ...
><br>[RoadDataset] Now process img /zx2/work/sjtuTrafficEventTstImgs/detect/construction_2189_c0.jpg ...
><br>[RoadDataset] Now process img /zx2/work/sjtuTrafficEventTstImgs/detect/construction_2189_c4.jpg ...
><br>[RoadDataset] Now process img /zx2/work/sjtuTrafficEventTstImgs/detect/construction_2189_c2.jpg ...
><br>[RoadDataset] Now process img /zx2/work/sjtuTrafficEventTstImgs/detect/construction_2189_c1.jpg ...
><br>416x416 8 conebuckets, 1 potholes, Done.
><br>416x416 8 conebuckets, 1 potholes, Done.
><br>416x416 8 conebuckets, 1 potholes, Done.
><br>416x416 8 conebuckets, 1 potholes, Done.
><br>416x416 8 conebuckets, 1 potholes, Done.
>
><br>=================== detect_batch output torch.Size([5, 9]) ========================
><br>5 images inferenced in 0.4725 seconds
><br>Avg time:  1.4241036162318954 ms
>
><br>user@825d90a0e576:/zx2/work/sjtuTrafficEvent/src$ 

### 2.  请根据《算法交付接口要求.pdf 》接口要求，编写相关python软件包以及python测试历程， 如jlte_deliver_package_main.py。然后在docker环境下，执行：
>user@825d90a0e576:/zx2/work/sjtuTrafficEvent/src$ python jlte_deliver_package_main.py testroutine1

