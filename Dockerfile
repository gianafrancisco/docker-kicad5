FROM ubuntu:20.04

MAINTAINER Francisco Giana <gianafrancisco@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt-get update && apt-get install -y pgp &&\
    gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv 83FBAD2D910F124E &&\
    gpg --export --armor 83FBAD2D910F124E | apt-key add -

COPY repo.list /etc/apt/sources.list.d/js-reynaud-ubuntu-kicad-5_1-focal.list
# RUN apt-get install -y software-properties-common
# RUN add-apt-repository --yes ppa:js-reynaud/kicad-5.1
# RUN apt-get update
RUN apt-get update
RUN apt-get install -y kicad
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get clean
CMD ["kicad"]
