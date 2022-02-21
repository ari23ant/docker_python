FROM ubuntu:20.04

ENV DEBCONF_NOWARNINGS=yes

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# dokcerではapt-get推奨
RUN apt-get update && apt-get -y upgrade

RUN apt-get update && apt-get install -y \
        less \
        x11-apps \
        python3.8 \
        python3-pip \
        python3-tk

COPY ./etc/root/ /root/

RUN pip3 install --upgrade pip && pip3 install -r /root/requirements.txt
