# A base image with Python 3.4

FROM deb_base
MAINTAINER dan@danchalmers.me.uk

RUN apt-get install -y build-essential python3.4 python3-pip python3.4-dev
RUN apt-get clean

RUN pip3 install -U pip
ADD requirements.txt /root
RUN pip3 install -r /root/requirements.txt

ENV PYTHONPATH ./src
