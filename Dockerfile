FROM jenkins/jenkins:alpine

# Install plugins
RUN /usr/local/bin/install-plugins.sh blueocean

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Default user and password
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Create default user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# Install Docker CLI
USER root

RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz \
  && tar xzvf docker-17.09.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.09.0-ce.tgz
