FROM ruby:3.2.2-bullseye

# RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -

# RUN apt-get update -qq && \
#     apt-get install -y build-essential curl gnupg nodejs 

# RUN npm install -g yarn 

WORKDIR /app

# COPY . /app
# ADD . .
# RUN yarn install 
# RUN bundle install

#RUN rails db:setup