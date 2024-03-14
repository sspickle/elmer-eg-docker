FROM ubuntu:focal
# Set the working directory to /home
WORKDIR /home
# Create an apt configuration file to fix erroneous "hash sum mismatch" errors
RUN  DEBIAN_FRONTEND=noninteractive apt update -y -o Acquire::CompressionTypes::Order::=gz && apt upgrade -y

RUN  DEBIAN_FRONTEND=noninteractive apt install -y software-properties-common

RUN  DEBIAN_FRONTEND=noninteractive apt-add-repository -y ppa:elmer-csc-ubuntu/elmer-csc-ppa

RUN  DEBIAN_FRONTEND=noninteractive apt-get -y update

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y elmerfem-csc-eg

# helps to have an editor in the container
RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y emacs-nox 

# nice for testing X11 forwarding
RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y x11-apps

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-venv

RUN  DEBIAN_FRONTEND=noninteractive apt-get install -y qt5-default

RUN  python3 -m venv ~/venv

RUN  ~/venv/bin/pip install -U pip

RUN  ~/venv/bin/pip install pyelmer

RUN  ~/venv/bin/pip install elmer-circuitbuilder
