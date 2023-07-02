ARG BASE_CONTAINER=continuumio/miniconda3:23.3.1-0

FROM $BASE_CONTAINER

ENV NB_USER="student"

LABEL MAINTAINER="Jeroen Boogaard <j.a.boogaard@hr.nl>"

# Root operations

RUN apt-get -y update \
    && apt-get -y upgrade

# Set Timezone
RUN apt-get install tzdata \
    && cp /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime \
    && echo "Europe/Amsterdam" >  /etc/timezone

# Add non-root user and add directory app
RUN useradd -m ${NB_USER} 

# Add Python requirements with conda
RUN conda install conda=23.3.1 \
    && conda update --all

RUN conda install -y -c conda-forge numpy \ 
    && conda install -y -c conda-forge pandas scikit-learn pypickle \
    && conda install -y -c esrf-bcu ptpython \
    && conda install -y -c pytorch pytorch

# Switch to non-root user
USER ${NB_USER}

# Non-root operations

# Add Python requirements with pip
RUN python -m pip install --upgrade pip tensorflow

ENTRYPOINT ["python"]