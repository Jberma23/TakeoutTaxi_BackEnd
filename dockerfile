# Base image
FROM ruby:2.4.2
ENV RUBY_MAJOR 2.5
ENV RUBY_VERSION 2.5.3
# Setup environment variables that will be available to the instance
ENV APP_HOME /produciton
# Installation of dependencies
RUN apt-get update -qq \
  && apt-get install -y \
  # Needed for certain gems
  build-essential \
  # Needed for postgres gem
  libpq-dev \
  # Needed for asset compilation
  nodejs \
  # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
  /var/lib/apt \
  /var/lib/dpkg \
  /var/lib/cache \
  /var/lib/log

# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Add our Gemfile
# and install gems

COPY Gemfile Gemfile.lock ./
ENV BUNDLER_VERSION 2.0.2
RUN gem install bundler && bundle install 

# Copy over our application code
ADD . $APP_HOME

# Run our app
CMD bundle exec rails s -p ${PORT} -b '0.0.0.0'
