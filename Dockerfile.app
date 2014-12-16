FROM ruby:2.1.5

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/

RUN bundle install --deployment

COPY . /usr/src/app/

ENV RAILS_ENV production

EXPOSE 8080

CMD ["/usr/src/app/bin/rails", "server", "-p", "8080"]
