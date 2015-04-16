FROM rastasheep/ubuntu-sshd
RUN echo
ADD ./sources_hnust.list /etc/apt/sources.list
# ADD ./resolv.conf /etc/resolv.conf
RUN apt-get update || echo
RUN apt-get install -y apache2 apache2-dev apache2-utils aria2 atop autojump autossh axel bison build-essential byobu clang cmake convmv ctags curl cython cython3 dos2unix dstat enca fish git git-svn htop httpie iftop libffi-dev libxml2 libxml2-dev libxslt1-dev libxslt1.1 libzmq-dev libzmqpp3 mercurial mongodb mosh network-manager-vpnc nginx nload nmap nmon npm p7zip-full pandoc php-pear php5-dev phpmyadmin polipo protobuf-compiler proxychains pypy python-cffi python-dev python-pip python-scipy python3-dev python3-pip redis-server redis-tools ruby-dev sshfs supervisor tasksel tmux trash-cli tree vim zsh

RUN apt-get install -y  gfortran  libopenblas-dev  liblapack-dev  libzmq-dev  --no-install-recommends

ADD pip/pip.conf /root/.pip/pip.conf
RUN pip install -U numpy scipy pyzmq jinja2
RUN apt-get install -y python-matplotlib
RUN pip install -U pandas
RUN pip install -U tornado ipython

#golang
ADD golang/go1.4.2.linux-amd64.tar.gz /root/env/

RUN apt-get install nodejs npm

ADD oh-my-zsh/ /root/
RUN chsh -s /bin/zsh
CMD /bin/zsh

# mysql mongodb npm
