FROM ruby:2.4.2-jessie

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install --path vendor/bundle

COPY . /myapp
