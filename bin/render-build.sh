#!/usr/bin/env bash
# Build script for Render deployment

set -o errexit # exit on error

bundle install

# Run database migrations
bundle exec rails db:migrate

# Precompile assets (if using asset pipeline)
bundle exec rails assets:precompile
