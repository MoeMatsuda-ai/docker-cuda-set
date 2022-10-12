FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04

# settings users (workerは作業用ユーザー)
RUN useradd -s /bin/bash -m worker
USER root

# settings file
COPY ./set/requirements.txt /tmp
COPY ./set/bin/setting.sh /tmp
# settings file for starting ssh-server
RUN mkdir /root/bin
COPY ./set/bin/sterter.sh /root/bin

# set working directory
WORKDIR /workspace

# settings proxy
ENV https_proxy "<proxy:port>"
ENV https_proxy "<proxy:port>"
RUN echo 'Acquire::http::proxy "<proxy:port>"; \
Acquire::https::proxy "<proxy:port>";' > /etc/apt/apt.conf

# settings
RUN echo "cd /workspacealias" >> /root/.bashrc
RUN echo "dirs='dirs -v'" >> /root/.bashrc
RUN echo "export PS1='\[\e[36m\]\h@\u\[\e[0m\]:\[\e[32m\]\W\[\e[0m\]\$ '" >> /root/.bashrc
# volumeの初回作成時は以下をコメントアウトし実行
# RUN echo "cd /workspace" >> /home/worker/.bashrc
# RUN echo "dirs='dirs -v'" >> /home/worker/.bashrc
# RUN echo "export PS1='\[\e[36m\]\h@\u\[\e[0m\]:\[\e[32m\]\W\[\e[0m\]\$ '" >> /home/worker/.bashrc
# RUN mkdir -p /home/.ssh

RUN bash /tmp/setting.sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
