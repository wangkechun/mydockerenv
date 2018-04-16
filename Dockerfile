FROM nvidia/cuda:8.0-cudnn6-devel

ADD ./resolv.conf /etc/resolv.conf
RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/" /etc/apt/sources.list && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y autojump build-essential curl git htop httpie iftop nload tmux trash-cli tree vim zsh python-dev python-pip python3-dev python3-pip supervisor wget unzip vim aria2 cmake

ADD pip/pip.conf /root/.pip/pip.conf
RUN pip3 install --upgrade pip mxnet-cu80 tensorflow-gpu==1.4.1 jupyter matplotlib sklearn pandas scipy h5py keras fire

#zsh
ADD oh-my-zsh/ /root/
RUN chsh -s /bin/zsh

RUN wget -O /tmp/PRC-tz http://devtools.dl.atlab.ai/docker/PRC-tz && mv /tmp/PRC-tz /etc/localtime
ENV LC_ALL=C.UTF-8

#shell
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zplugin/master/doc/install.sh) "


RUN zsh -c "source ~/.zshrc"
RUN zsh -c "echo download zplugin... " 
WORKDIR /src

ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]

