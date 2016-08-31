FROM debian:8

#MAINTAINER Peter Kleiweg <p.c.j.kleiweg@rug.nl>
#This is based on https://github.com/rug-compling/alpino-docker/blob/master/build/Dockerfile 
MAINTAINER Wei Qiu <wei@qiu.es>

RUN apt-get update && apt-get install -y \
  curl \
  libtcl8.5 \
  libtk8.5 \
  locales \
  man \
  make

RUN sed -e 's/^# en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen > /etc/locale.gen.tmp && \
    mv /etc/locale.gen.tmp /etc/locale.gen && \
    locale-gen

ENV PATH /Alpino/bin:/Alpino/Tokenization:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV ALPINO_HOME /Alpino
ENV LANG en_US.utf8
ENV LANGUAGE en_US.utf8
ENV LC_ALL en_US.utf8

# Downloading the index triggers a new download of Alpino when anything in the index has changed
ADD http://www.let.rug.nl/vannoord/alp/Alpino/versions/binary/ /index
RUN cd / && rm index && \
    curl -s http://www.let.rug.nl/vannoord/alp/Alpino/versions/binary/latest.tar.gz | tar vxzf -

# Remove incompatible libs
RUN rm -f /Alpino/create_bin/libtcl* /Alpino/create_bin/libtk*
RUN rm -rf /Alpino/create_bin/tcl8.5 /Alpino/create_bin/tk8.5

# Remove stale nfs files
RUN find /Alpino -name '.nfs*' | xargs rm -f

WORKDIR /Alpino

COPY libtok_breaks.so /Alpino/Tokenization/
COPY tokenize_server /Alpino/Tokenization/tokenize_server/
COPY start.sh /Alpino/
RUN chmod +x start.sh
EXPOSE 42424 42425
CMD ["./start.sh"]