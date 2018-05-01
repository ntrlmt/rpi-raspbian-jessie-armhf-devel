FROM resin/rpi-raspbian:jessie

MAINTAINER ntrlmt

#Development Tools
RUN apt-get update && \
    apt-get install -y tmux \
                       wget zip unzip curl \
                       bash-completion git \
                       software-properties-common \
                       build-essential \
                       cmake
# Vim
RUN apt-get install -y  vim-nox && \
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh -o /tmp/install.sh
WORKDIR /tmp
RUN /bin/bash -c "sh ./install.sh" && \
    git clone https://github.com/tomasr/molokai && \
    mkdir -p ~/.vim/colors && \
    cp ./molokai/colors/molokai.vim ~/.vim/colors/
COPY .vimrc /root/.vimrc

# Tmux
WORKDIR /tmp
COPY .tmux.conf /root/.tmux.conf


WORKDIR /root
CMD ["/bin/bash"]
