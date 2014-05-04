FROM ubuntu

RUN apt-get -qy install wget
RUN mkdir /btsync && \
	cd btsync && \
	wget -O - http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable | tar xzf -

RUN apt-get -qy install python-pelican

VOLUME ["/btsync/data"]
ADD bin /btsync/bin
ENV PATH /btsync/bin:$PATH
WORKDIR /btsync
