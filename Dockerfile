FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN apt-get update -y && \
    apt-get install -y python-software-properties && \
    apt-get install -y software-properties-common

RUN add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update -y && \
    apt-get install -y python3.6 && \
    apt-get install -y python3-pip

RUN apt-get install vim -y
RUN apt-get install gcc python3.6-dev libffi-dev -y

ENV pip "python3.6 -m pip "
RUN $pip install --upgrade setuptools pip
RUN $pip install pipenv

WORKDIR /app
COPY Pipfile* /app/

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN cd /app && pipenv install --dev
