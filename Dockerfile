FROM ubuntu:18.04
LABEL maintainer="v0rt"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y software-properties-common ca-certificates apt-transport-https wget
RUN add-apt-repository -y ppa:gnuradio/gnuradio-releases-3.7
RUN apt-get update


RUN apt-get install -y gir1.2-gtk-3.0 gnuradio gnuradio-dev cmake git libboost-all-dev libcppunit-dev liblog4cpp5-dev swig liborc-dev uhd-host
RUN /usr/lib/uhd/utils/uhd_images_downloader.py


# RUN wget https://download.sublimetext.com/sublimehq-pub.gpg -O /tmp/key
# RUN apt-key add /tmp/key && rm /tmp/key
# RUN echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list
# RUN apt-get update
RUN apt-get install -y netcat nano net-tools


RUN apt-get install -y openssh-server 
RUN sed -i 's/prohibit-password/yes/' /etc/ssh/sshd_config
RUN echo "StrictHostKeyChecking=no" >> /etc/ssh/ssh_config

EXPOSE 22
CMD service ssh start
RUN service ssh start

RUN apt-get install -y sudo
RUN useradd --create-home --shell /bin/bash -g root -G sudo -u 1000 user
RUN echo 'user:pass' | chpasswd

USER user
WORKDIR /home/user
ENV PYTHONPATH "${PYTHONPATH}:/usr/local/lib/python3/dist-packages"

CMD bash
