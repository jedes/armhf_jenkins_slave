FROM ubuntu:16.04

RUN apt-get -y update && \
	apt-get install -y curl wget make \
	g++-arm-linux-gnueabihf \
	cccc cppcheck cmake \
	openjdk-8-jre-headless \
	git \
	bsdmainutils

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /home/jenkins
RUN groupadd -g 10000 jenkins
RUN useradd -c "Jenkins user" -d $HOME -u 10000 -g 10000 -m jenkins

USER jenkins
WORKDIR $HOME

