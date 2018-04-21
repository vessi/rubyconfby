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
RUN git clone https://github.com/k0kubun/ruby.git
WORKDIR /usr/local/src/ruby
RUN git checkout llrb
RUN autoconf
RUN ./configure
RUN make
RUN make install
RUN apt-get purge -y ruby
RUN apt-get install -y llvm clang
RUN gem install llrb benchmark-ips
ADD ./test.rb test.rb
ADD ./test2.rb test2.rb
CMD ["ruby", "test.rb"]
