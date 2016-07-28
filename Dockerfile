FROM ruby:2.3.1-alpine

RUN apk update && apk upgrade && \
    apk add --update nodejs git build-base libxml2 libxml2-dev libxml2-utils libxslt-dev tzdata && \
    rm -rf /var/cache/apk/*

ENV HOME /rails
ENV RAILS_ENV production
# TODO move this to static file server, e.g. nginx
ENV RAILS_SERVE_STATIC_FILES true
ENV SECRET_KEY_BASE abcdefgh12345678
ENV DB_HOST mongo:27017

WORKDIR $HOME

# Install gems
ADD Gemfile* $HOME/
RUN gem update bundler
RUN bundle install --deployment --without development test

# Add the app code
ADD . $HOME

# Default command
CMD ["bundle", "exec", "rails", "server"]
