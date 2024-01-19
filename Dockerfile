FROM ruby:3.2.2
ENV LANG C.UTF-8

RUN apt-get update -qq && \
    apt-get install -y \
      curl \
      procps \
      net-tools \
      git \
      vim \
      sqlite3 \      
      libsqlite3-dev \
      software-properties-common \
      && rm -rf /var/lib/apt/lists/*

RUN curl https://deb.nodesource.com/setup_20.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

WORKDIR /app
COPY . /app 

RUN apt-get update && apt-get install nodejs

RUN npm install
RUN bundle install
RUN sh -c "bundle exec rails db:setup RAILS_ENV=development"

# Start a bash shell when the container runs
CMD ["/bin/bash"]