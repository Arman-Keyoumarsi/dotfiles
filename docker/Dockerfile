# syntax=docker/dockerfile:1
FROM ubuntu:20.04

#Define variables
ARG user=rmaan

#RUN apt update && apt install sudo -y software-properties-common #to make add-apt-repository work
RUN apt update && apt install sudo -y openssh-server
#RUN add-apt-repository -y ppa:jonathonf/vim
RUN apt install build-essential sudo -y
#RUN apt install git sudo -y
RUN apt install sudo -y vim keychain ripgrep tree zip curl wget git
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN apt install nodejs sudo -y
#Configure User
RUN useradd -rm -d /home/${user} -s /bin/bash -g root -G sudo -u 1000 ${user}
RUN usermod -aG sudo ${user}
#Passwordless Sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#RUN service ssh start
#RUN  echo 'rmaan:rmaan' | chpasswd
#EXPOSE 22
#CMD ["/usr/sbin/sshd","-D"]
WORKDIR /home/rmaan
USER rmaan
#Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || true
RUN ~/.fzf/install --all
#RUN mkdir workspace && cd workspace && echo "the first run" > ReadMe.md
RUN git clone https://github.com/Arman-Keyoumarsi/dotfiles.git
RUN cd dotfiles && make all
#RUN echo "pwd"  > /home/rmaan/logs

