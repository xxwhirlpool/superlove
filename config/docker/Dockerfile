FROM debian:latest

# Install additional packages
RUN apt-get update             && \
    apt-get install -y            \
        calibre                   \
        default-mysql-client      \
        libvips                   \
        shared-mime-info          \
        zip                       \
        curl                      \
        tar                       \
        gzip                      \
        wget                      \
        xz-utils                  \
        git                       \
        make                      \
        gcc                       \
        libmariadb-dev            \
        libyaml-dev

# Install ruby packages
COPY Gemfile .
COPY Gemfile.lock .

SHELL ["/bin/bash", "-c"]
RUN cd /home && wget https://github.com/spinel-coop/rv/releases/download/v0.5.3/rv-aarch64-unknown-linux-gnu.tar.xz && tar xf /home/rv-aarch64-unknown-linux-gnu.tar.xz && ls -la /home/rv-aarch64-unknown-linux-gnu && cp /home/rv-aarch64-unknown-linux-gnu/rv /usr/local/bin && cp /home/rv-aarch64-unknown-linux-gnu/rvx /usr/local/bin
# RUN curl -LsSf https://rv.dev/install | sh && which rv
RUN rv ruby install 3.4.6
RUN cd / && rv tool install bundler && rvx bundle install && rv clean-install

# Clean and mount repository at /otwa
RUN rm -rf /otwa && mkdir -p /otwa
WORKDIR /otwa
VOLUME /otwa

# Default command to run in a new container
EXPOSE 3500
RUN rvx rails s -p 3500
