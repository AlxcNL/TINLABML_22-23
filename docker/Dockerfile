ARG BASE_CONTAINER=continuumio/miniconda3:23.3.1-0-alpine

FROM $BASE_CONTAINER

# ENV DEBIAN_FRONTEND="noninteractive"

LABEL MAINTAINER="Jeroen Boogaard <j.a.boogaard@hr.nl>"

RUN apk update \
    && apk upgrade \
    && apk add bash

# # Set Timezone
RUN apk add tzdata \
    && cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime \
    && echo "Europe/Amsterdam" >  /etc/timezone \
    && apk del tzdata

ENTRYPOINT ["bash"]