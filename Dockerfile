FROM ubuntu:16.04
MAINTAINER Brasco <brasco@thebrascode.com>

# set up character encoding
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# install dependencies
RUN apt-get update -y\
  && apt-get upgrade -y\
  && apt-get install -y\
    sudo\
    git\
    wget

# install Elixir
RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb\
  && dpkg -i erlang-solutions_1.0_all.deb\
  && apt-get update\
  && apt-get install -y\
    elixir\
    erlang-dev\
    erlang-parsetools\
  && apt-get clean\
  && rm erlang-solutions_1.0_all.deb\
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install Hex package manager
RUN mix local.hex --force && mix local.rebar --force
