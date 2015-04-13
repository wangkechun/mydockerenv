FROM rastasheep/ubuntu-sshd
CP ./sources.list /etc/apt/source.list
RUN apt-get update
RUN apt-get install apache2 apache2-dev apache2-utils aria2 atop autojump autossh axel bison build-essential byobu clang cmake convmv ctags curl cython cython3 dos2unix dstat emacs enca fish git git-gui git-svn gitg Graphviz htop httpie iftop libffi-dev libxml2 libxml2-dev libxslt1-dev libxslt1.1 libzmq-dev libzmqpp3 mercurial mongodb mosh network-manager-vpnc nginx nload nmap nmon npm p7zip-full pandoc php-pear php5-dev phpmyadmin polipo protobuf-compiler proxychains pypy python-cffi python-dev python-pip python-scipy python3-dev python3-pip redis-server redis-tools ruby-dev sshfs supervisor tasksel tmux trash-cli tree vim virtualbox zsh

CMD /bin/zsh
