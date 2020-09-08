FROM ruby:2.7-alpine

RUN apk update && apk upgrade

RUN apk add --no-cache \
  build-base \
  nodejs \
  npm \
  yarn \
  postgresql-dev

RUN mkdir /opt/video-app
WORKDIR /opt/video-app

ADD Gemfile /opt/video-app
ADD Gemfile.lock /opt/video-app

RUN gem install bundler
RUN bundle install
