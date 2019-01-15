FROM ubuntu:18.04
# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    groff \
    wget \
    postgresql-client-10

RUN pip3 install awscli --upgrade
RUN pip3 install virtualenv
RUN wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update
RUN apt-get install cf-cli
ADD src $HOME/src
WORKDIR $HOME/src
ENV PATH="/src:${PATH}"
