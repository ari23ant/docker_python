FROM ubuntu:20.04

ENV DEBCONF_NOWARNINGS=yes

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# dokcerではapt-get推奨
RUN apt-get update && apt-get -y upgrade

RUN apt-get update && apt-get install -y \
        less \
        x11-apps

COPY ./etc/root/ /root/
