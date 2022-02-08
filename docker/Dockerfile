# syntax=docker/dockerfile:1
FROM ubuntu:20.04

#Define variables
ARG user=rmaan
ARG os=linux
ARG tf_ls_version=0.25.2
ARG cpu=arm64

RUN apt update && apt install sudo -y software-properties-common #to make add-apt-repository work
RUN apt update && apt install sudo -y openssh-server
#RUN add-apt-repository -y ppa:jonathonf/vim
RUN apt install build-essential sudo -y
#RUN apt install git sudo -y
RUN apt install sudo -y vim keychain ripgrep tree zip curl wget git
#Installing NodeJS for COC
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN apt install nodejs sudo -y
#Configuring terraform-ls
RUN wget -O "/opt/terraform-ls.zip" https://releases.hashicorp.com/terraform-ls/${tf_ls_version}/terraform-ls_${tf_ls_version}_${os}_${cpu}.zip 
RUN unzip -o /opt/terraform-ls.zip -d /opt/ && \
    ln -fs /opt/terraform-ls /usr/bin/terraform-ls
#Configure User
RUN useradd -rm -d /home/${user} -s /bin/bash -g root -G sudo -u 1000 ${user}
RUN usermod -aG sudo ${user}
#Passwordless Sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#Switching User
WORKDIR /home/${user}
USER ${user}
#Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf || true
RUN ~/.fzf/install --all
#Downloading and configuring dotfiles
RUN git clone https://github.com/Arman-Keyoumarsi/dotfiles.git
RUN cd dotfiles && make all


