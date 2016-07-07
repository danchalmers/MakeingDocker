# Minimal common baseline

FROM debian:jessie
MAINTAINER dan@danchalmers.me.uk

RUN apt-get update
RUN apt-get clean

VOLUME ["/project"]
# If this gets changed in dependent images, needs reset in that image
WORKDIR /project

