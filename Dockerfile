FROM ubuntu:groovy-20210225

RUN mkdir /playbook
WORKDIR /playbook
RUN apt update -y && \
	apt install -y \
	libssl-dev python3-dev sshpass apt-transport-https jq moreutils \
	ca-certificates curl gnupg2 software-properties-common python3-pip rsync

ADD requirements.txt .

RUN /usr/bin/python3 -m pip install pip -U && /usr/bin/python3 -m pip install -r requirements.txt && python3 -m pip install -r requirements.txt && update-alternatives --install /usr/bin/python python /usr/bin/python3 1

COPY . .