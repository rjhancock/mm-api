# Base image so we don't have to rebuild it each time.
FROM ruby:2.3.4
MAINTAINER Richard Hancock <rjhancock@tapenvy.us>

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN wget -q -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list
RUN apt-get update -yqqq
RUN apt-get install -y apt-transport-https build-essential nodejs cmake software-properties-common yarn google-chrome-stable
