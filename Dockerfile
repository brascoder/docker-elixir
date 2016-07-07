FROM ubuntu:16.04
MAINTAINER Brasco <brasco@thebrascode.com>

# set up character encoding
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# install dependencies
RUN apt-key adv --fetch-keys http://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc\
  && apt-get update -y\
  && apt-get install -y\
    sudo\
    git\
    wget\
    elixir\
  && apt-get clean\
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install Hex package manager
RUN mix local.hex --force
