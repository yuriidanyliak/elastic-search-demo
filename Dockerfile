FROM ruby:2.7.6
WORKDIR /app
COPY . .

RUN gem install bundler
RUN apt-get update && apt-get install webp -y

WORKDIR /docker/app
COPY Gemfile* ./
RUN bundle install
ADD . /docker/app

ARG DEFAULT_PORT 3000
EXPOSE ${DEFAULT_PORT}
CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]