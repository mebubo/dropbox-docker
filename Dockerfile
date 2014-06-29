FROM ubuntu

VOLUME ["/dropbox"]

RUN apt-get -qy install wget python-minimal

ENV HOME /home/dropbox

RUN /usr/sbin/useradd --create-home --home-dir $HOME --shell /bin/bash --uid 1000 dropbox

USER dropbox

RUN cd $HOME && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -

RUN cd $HOME && ln -s /dropbox/.dropbox && ln -s /dropbox/.dropbox-master && ln -s /dropbox/Dropbox

CMD ["/home/dropbox/.dropbox-dist/dropboxd"]
