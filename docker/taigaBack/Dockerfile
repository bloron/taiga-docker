FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install libssl-dev build-essential binutils-doc autoconf flex bison libjpeg-dev libfreetype6-dev zlib1g-dev libzmq3-dev libgdbm-dev libncurses5-dev automake libtool libffi-dev curl git tmux gettext -y
RUN apt-get install python3 python3-pip python-dev python3-dev python-pip virtualenvwrapper libxml2-dev libxslt-dev -y

WORKDIR /apps
RUN mkdir -p logs

RUN git clone https://github.com/taigaio/taiga-back.git taiga-back

WORKDIR /apps/taiga-back

RUN git checkout stable


RUN pip3 install --upgrade setuptools
RUN pip3 install -r requirements.txt

COPY ./local.py ./settings/local.py
COPY ./initialization.sh .

EXPOSE 8000

ENTRYPOINT ["/bin/bash", "initialization.sh"]