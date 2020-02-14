FROM nvidia/cuda:10.1-base-ubuntu16.04

# --------------- [ ZX ADD START ] -------------------
# RUN echo "deb http://mirrors.163.com/ubuntu/ precise main universerestricted multiverse"     >> /etc/apt/sources.list 
# RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse"     >> /etc/apt/sources.list 

RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse"     >> /etc/apt/sources.list 
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse"     >> /etc/apt/sources.list 
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse"     >> /etc/apt/sources.list 
RUN echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse"     >> /etc/apt/sources.list 
# --------------- [ ZX ADD END  ] -------------------

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    vim \
 && rm -rf /var/lib/apt/lists/*

# Create a working directory
RUN mkdir /app
WORKDIR /app

# Create a non-root user and switch to it
RUN adduser --disabled-password --gecos '' --shell /bin/bash user \
 && chown -R user:user /app
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# --------------- [ ZX ADD START ] -------------------
ENV LANG C.UTF-8
# --------------- [ ZX ADD END   ] -------------------

# All users can use /home/user as their home directory
ENV HOME=/home/user
RUN chmod 777 /home/user

# Install Miniconda
RUN curl -so ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-4.5.11-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh
ENV PATH=/home/user/miniconda/bin:$PATH
ENV CONDA_AUTO_UPDATE_CONDA=false


# --------------- [ ZX ADD START ] -------------------
# RUN echo -e "channels: " > ~/.condarc
# RUN echo -e "  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/" >> ~/.condarc
# RUN echo -e "  - defaults" >> ~/.condarc
# RUN echo -e "show_channel_urls: yes" >> ~/.condarc

RUN /home/user/miniconda/bin/conda config --remove channels defaults
# RUN /home/user/miniconda/bin/conda config --add channels https://pypi.mirrors.ustc.edu.cn/simple/
# RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.aliyun.com/pypi/
# RUN /home/user/miniconda/bin/conda config --add channels https://pypi.doubanio.com/simple/
# RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/main/
# RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/
# RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/conda-forge/
# RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/msys2/	
# RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/bioconda/
# RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.ustc.edu.cn/anaconda/cloud/menpo/
RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
RUN /home/user/miniconda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
RUN /home/user/miniconda/bin/conda config --set show_channel_urls yes
# --------------- [ ZX ADD END   ] -------------------

# Create a Python 3.6 environment
RUN /home/user/miniconda/bin/conda create -y --name py36 python=3.6.9 \
 && /home/user/miniconda/bin/conda clean -ya
RUN /home/user/miniconda/bin/conda info
ENV CONDA_DEFAULT_ENV=py36
ENV CONDA_PREFIX=/home/user/miniconda/envs/$CONDA_DEFAULT_ENV
ENV PATH=$CONDA_PREFIX/bin:$PATH
RUN /home/user/miniconda/bin/conda install conda-build=3.18.9=py36_3 \
 && /home/user/miniconda/bin/conda clean -ya

# --------------- [ ZX MOD START ] -------------------
# CUDA 10.1-specific steps
# RUN conda install -y -c pytorch \
#     cudatoolkit=10.1 \
#     "pytorch=1.4.0=py3.6_cuda10.1.243_cudnn7.6.3_0" \
#     "torchvision=0.5.0=py36_cu101" \
#  && conda clean -ya
RUN conda install -y \
    cudatoolkit=10.1 \
    "pytorch=1.4.0=py3.6_cuda10.1.243_cudnn7.6.3_0" \
    "torchvision=0.5.0=py36_cu101" \
 && conda clean -ya
# --------------- [ ZX MOD END  ] -------------------

# Install HDF5 Python bindings
RUN conda install -y h5py=2.8.0 \
 && conda clean -ya
RUN pip install h5py-cache==1.0  -i https://pypi.tuna.tsinghua.edu.cn/simple

# Install Torchnet, a high-level framework for PyTorch
RUN pip install torchnet==0.0.4  -i https://pypi.tuna.tsinghua.edu.cn/simple

# --------------- [ ZX ADD START ] -------------------
# Install common python ML & DL package
RUN pip install matplotlib -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install torchsummary -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install certifi==2019.9.11 -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install numpy==1.17.2 -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install Pillow==6.2.0 -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install six==1.12.0 -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install tqdm==4.36.1 -i https://pypi.tuna.tsinghua.edu.cn/simple
# --------------- [ ZX ADD END  ] -------------------

# Install Requests, a Python library for making HTTP requests
RUN conda install -y requests=2.19.1 \
 && conda clean -ya

# Install Graphviz
RUN conda install -y graphviz=2.40.1 python-graphviz=0.8.4 \
 && conda clean -ya

# --------------- [ ZX ADD START ] -------------------
# RUN sudo echo "deb http://mirrors.163.com/ubuntu/ precise main universerestricted multiverse"     >> /etc/apt/sources.list 
# RUN sudo echo "deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN sudo echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN sudo echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN sudo echo "deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse"     >> /etc/apt/sources.list 

# RUN sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse"     >> /etc/apt/sources.list 
# RUN sudo echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse"     >> /etc/apt/sources.list 
# --------------- [ ZX ADD END  ] -------------------

# --------------- [ ZX ADD START ] -------------------
# RUN sudo apt-get update && sudo apt-get install -y \
#     vim \
# && sudo rm -rf /var/lib/apt/lists/*
# --------------- [ ZX ADD END  ] -------------------


# Install OpenCV3 Python bindings
RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    libgtk2.0-0 \
    libcanberra-gtk-module \
 && sudo rm -rf /var/lib/apt/lists/*

# --------------- [ ZX MOD START ] -------------------
# RUN conda install -y -c menpo opencv3=3.1.0 \
# && conda clean -ya
RUN conda install -y -c https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/menpo opencv3=3.1.0 \
 && conda clean -ya
# --------------- [ ZX MOD END  ] -------------------

# --------------- [ ZX MOD START ] -------------------
# Set the default command to python3
# CMD ["python3"]
# --------------- [ ZX MOD END ] -------------------
CMD echo "Enter docker .... sucecess!"
CMD /bin/bash
