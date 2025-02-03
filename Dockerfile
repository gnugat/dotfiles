FROM ubuntu:24.04

# Installing:
# * `git` to be able to clone the dotfiles repository
# * `sudo` to be able to run `sudo apt install` commands
#
# Allowing sudoer `ubuntu` to be passwordless
RUN apt update \
    && apt install -y --no-install-recommends \
        git \
        sudo \
    && rm -rf /var/lib/apt/lists \
    && echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ubuntu
WORKDIR /home/ubuntu

CMD ["bash"]
