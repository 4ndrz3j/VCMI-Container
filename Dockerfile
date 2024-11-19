FROM ubuntu:latest
RUN apt update
RUN apt -y install software-properties-common
RUN add-apt-repository ppa:vcmi/vcmi-latest
RUN apt update
RUN apt -y install vcmi
# Installing Demo files

CMD /usr/games/vcmilauncher
