# Copyright 2018 Grabtaxi Holdings PTE LTE (GRAB), All rights reserved.
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file

FROM ruby:2.4.2-jessie

RUN mkdir /myapp

WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN bundle install --path vendor/bundle

COPY . /myapp
