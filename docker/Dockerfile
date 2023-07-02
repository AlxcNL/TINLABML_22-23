ARG BASE_CONTAINER=continuumio/miniconda3:23.3.1-0-alpine

FROM $BASE_CONTAINER

ENV NB_USER="student"

LABEL MAINTAINER="Jeroen Boogaard <j.a.boogaard@hr.nl>"

# Root operations

RUN apk update \
    && apk upgrade \
    && apk add bash

# Set Timezone
RUN apk add tzdata \
    && cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime \
    && echo "Europe/Amsterdam" >  /etc/timezone \
    && apk del tzdata

# Add non-root user and add directory app
RUN adduser -D ${NB_USER} 

# Add Python requirements with conda
RUN conda update --all \
    && conda install -c conda-forge numpy pandas pickle5 pymysql scikit-learn \
    && conda install -c pytorch pytorch \
    && conda install -y -c anaconda tensorflow 
    
# Switch to non-root user
USER ${NB_USER}

# Non-root operations

# Add Python requirements with pip
RUN pip install --upgrade pip ptpython

ENTRYPOINT ["python", "-m ptpython"]