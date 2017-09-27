FROM ubuntu:16.04

ADD ./resolv.conf /etc/resolv.conf

RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/" /etc/apt/sources.list && apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y autojump build-essential curl git htop httpie iftop nload tmux trash-cli tree vim zsh
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev python-pip python3-dev python3-pip supervisor 

ADD pip/pip.conf /root/.pip/pip.conf

RUN apt-get -y install openssh-server

#golang
ADD http://q.hi-hi.cn/go1.7.1.linux-amd64.tar.gz /root/local/

#zsh
ADD oh-my-zsh/ /root/
RUN chsh -s /bin/zsh
CMD /bin/zsh

#shell
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zplugin/master/doc/install.sh) "

RUN zsh -c "echo download zplugin..." 

#nvm
RUN zsh -c "source ~/.zshrc && nvm install node && nvm alias default node && nvm use node && npm config set registry http://registry.npm.taobao.org/ "


CMD zsh

