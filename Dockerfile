FROM ruby:latest

RUN gem install sinatra mysql2 rackup

COPY . /app
WORKDIR /app
RUN bundle install

CMD [ "ruby", "app.rb" ]