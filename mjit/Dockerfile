FROM ubuntu:latest
LABEL author="Mikhail Bortnyk"

RUN apt-get update
RUN apt-get install -y curl

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev
RUN apt-get install -y sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev autoconf libbison-dev
RUN apt-get install -y ruby

WORKDIR /usr/local/src
RUN git clone https://github.com/k0kubun/yarv-mjit.git
WORKDIR /usr/local/src/yarv-mjit
RUN autoconf
RUN ./configure
RUN make
RUN make install
RUN apt-get purge -y ruby
RUN gem install benchmark-ips
ADD ./test.rb .
ADD ./script.sh .
ADD ./test2.rb .
CMD ["/bin/bash", "./script.sh"]
