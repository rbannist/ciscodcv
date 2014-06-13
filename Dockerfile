##################
# Cisco DCV Demo #
##################

FROM ubuntu

MAINTAINER rbannist

RUN apt-get update

RUN mkdir /exampledir

EXPOSE 8080
