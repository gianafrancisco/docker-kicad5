FROM ubuntu:18.04

LABEL maintainer="Francisco Giana <gianafrancisco@gmail.com>"

ARG U_ID=1000
ARG G_ID=1000

RUN groupadd -g $G_ID -r appuser
RUN useradd -r -m -u $U_ID -g appuser appuser

RUN 	apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository --yes ppa:js-reynaud/kicad-5.1 && \
	apt update && \
	apt install -y kicad

USER appuser
WORKDIR /home/appuser

CMD ["kicad"]
