FROM ubuntu:18.04

LABEL maintainer="Francisco Giana <gianafrancisco@gmail.com>"

ARG U_ID=1000
ARG G_ID=1000
ARG USERNAME=appuser

RUN groupadd -g $G_ID -r $USERNAME
RUN useradd -r -m -u $U_ID -g $USERNAME $USERNAME

RUN apt-get update && \
	apt-get install -y pgp software-properties-common && \
	add-apt-repository --yes ppa:kicad/kicad-5.1-releases && \
	apt update && \
	apt install -y --no-install-recommends kicad

USER $USERNAME
WORKDIR /home/$USERNAME

CMD ["kicad"]
