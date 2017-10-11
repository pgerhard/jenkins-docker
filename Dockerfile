FROM jenkins/jenkins:lts

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Default user and password
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Create default user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# Install docker CLI
USER root

RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-17.09.0-ce.tgz \
  && tar xzvf docker-17.09.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.09.0-ce.tgz

# Adding docker group with the same guid as the mounted volume
# Otherwise you get the message /var/run/docker.sock: connect: permission denied
ARG docker_gid
RUN addgroup --gid ${docker_gid} docker && addgroup --system jenkins docker

USER jenkins

