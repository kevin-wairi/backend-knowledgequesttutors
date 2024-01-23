#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
# clean
rm -rf public

bundle exec rake db:migrate
bundle exec rake db:seed