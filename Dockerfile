FROM ubuntu:18.04
MAINTAINER Francisco Giana <gianafrancisco@gmail.com>
RUN 	apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository --yes ppa:js-reynaud/kicad-5 && \
	apt update && \
	apt install -y kicad

CMD ["kicad"]
