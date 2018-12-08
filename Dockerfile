FROM ubuntu:18.04
# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    groff

RUN pip3 install awscli --upgrade
ADD src $HOME/src
WORKDIR $HOME/src
ENV PATH="/src:${PATH}"
