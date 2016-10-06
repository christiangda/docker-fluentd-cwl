FROM fedora:24

MAINTAINER Christian González <christiangda@gmail.com>

LABEL Description="Fluentd cloudwatch docker image" Vendor="Christian González" Version="1.0.0"
LABEL Build docker build --no-cache --rm --tag christiangda/fluentd-cwl:1.0.0 --tag christiangda/fluentd-cwl:latest .

ENV container docker

# Update and install base packages
#RUN dnf update -y --setopt=tsflags=nodocs --setopt=deltarpm=0 && \
RUN dnf install -y --setopt=tsflags=nodocs --setopt=deltarpm=0 \
    procps-ng \
    ruby-devel \
    ruby \
    ruby-libs \
    ruby-irb \
    rubygem-bundler \
    net-tools \
    iproute \
    libyaml-devel \
    glibc-headers \
    gcc \
    make \
    redhat-rpm-config && \
  gem update --no-ri --no-rdoc && \
  gem install --no-ri --no-rdoc \
    oj \
    json_pure \
    fluentd:0.14.6 \
    fluent-plugin-record-reformer \
    fluent-plugin-loggly \
    fluent-plugin-grep \
    fluent-plugin-secure-forward \
    fluent-plugin-cloudwatch-logs && \
  dnf -y remove \
    ruby-devel \
    libyaml-devel \
    glibc-devel \
    glibc-headers \
    gcc \
    make \
    redhat-rpm-config && \
  dnf clean all && \
  rm -rf /tmp/* /var/tmp/* /var/cache/dnf/* /var/log/anaconda/* /var/log/dnf.*

# Create data dir for fluentd file
RUN mkdir -p /var/log/fluend-cwl

# Copy default fluent.conf file when build image
COPY fluent.conf /etc/fluent/fluent.conf

# set important environment variables
ENV AWS_REGION="" AWS_ACCESS_KEY_ID="" AWS_SECRET_ACCESS_KEY=""

# Mount volumne from host
VOLUME ["/var/log/"]

# expose ports
EXPOSE 24224 9880

# run container service
CMD ["-c", "/etc/fluent/fluent.conf"]
ENTRYPOINT ["/usr/local/bin/fluentd"]
