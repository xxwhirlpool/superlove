FROM ruby:3.4.6

# Install additional packages
RUN apt-get update             && \
    apt-get install -y            \
        calibre                   \
        default-mysql-client      \
        libvips                   \
        shared-mime-info          \
        zip                       \
        nodejs

# CARLY SMALLBIRD ADDITIONS - i'm not married to any particular runtime ftr
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
RUN source ~/.bashrc | bash
RUN nvm install 25 | bash
RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
RUN source ~/.bashrc | bash

# Clean and mount repository at /otwa
RUN rm -rf /otwa && mkdir -p /otwa
WORKDIR /otwa
VOLUME /otwa

# Install ruby packages
COPY Gemfile .
COPY Gemfile.lock .
RUN gem install bundler -v 2.6.9 && bundle install

# Default command to run in a new container
EXPOSE 3500
CMD bundle exec rails s -p 3500
