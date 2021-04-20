FROM ubuntu:bionic

LABEL name="oscarapi test docker image" \
      vendor="Django Oscar API" \
      maintainer="martijn@devopsconsulting.nl" \
      build-date="20191213"

RUN apt-get update
RUN apt-get -yq install sqlite3 python3 python3-pip
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1


########################################################################


########################################################################


# pull official image
FROM python:3.8.0


# set work directory
WORKDIR /usr/src/app

# set environment variables
# Prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1
# Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# install mysql dependencies
RUN apk update \
    && apk add mariadb-dev gcc python3-dev musl-dev

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt ./
RUN pip install -r requirements.txt

# copy project
COPY  . .