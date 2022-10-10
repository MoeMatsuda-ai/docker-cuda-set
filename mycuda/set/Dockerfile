FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04
# FROM nvidia/cuda:11.3.1-base-ubuntu20.04

USER root
# COPY ./requirements.txt /tmp
# COPY ./bin/setting.sh /tmp
COPY ./set/requirements.txt /tmp
COPY ./set/bin/setting.sh /tmp
WORKDIR /workspace

ENV https_proxy "<proxy:port>"
ENV https_proxy "<proxy:port>"

RUN echo 'Acquire::http::proxy "<proxy:port>"; \
Acquire::https::proxy "<proxy:port>";' > /etc/apt/apt.conf
RUN echo "cd /workspacealias" >> /root/.bashrc
RUN echo "dirs='dirs -v'" >> /root/.bashrc
RUN echo "export PS1='\[\e[36m\]\h@\u\[\e[0m\]:\[\e[32m\]\W\[\e[0m\]\$ '" >> /root/.bashrc

RUN bash /tmp/setting.sh
