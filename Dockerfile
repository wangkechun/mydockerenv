FROM rastasheep/ubuntu-sshd
RUN echo
ADD ./sources_hnust.list /etc/apt/sources.list
# ADD ./resolv.conf /etc/resolv.conf
RUN apt-get update || echo
RUN apt-get install -y apache2 apache2-dev apache2-utils aria2 atop autojump autossh axel bison build-essential byobu clang cmake convmv ctags curl cython cython3 dos2unix dstat enca fish git git-svn htop httpie iftop libffi-dev libxml2 libxml2-dev libxslt1-dev libxslt1.1 libzmq-dev libzmqpp3 mercurial mongodb mosh network-manager-vpnc nginx nload nmap nmon npm p7zip-full pandoc php-pear php5-dev phpmyadmin polipo protobuf-compiler proxychains pypy python-cffi python-dev python-pip python-scipy python3-dev python3-pip redis-server redis-tools ruby-dev sshfs supervisor tasksel tmux trash-cli tree vim zsh
RUN cd ~
ADD oh-my-zsh/ /root/


#python




#nodejs




