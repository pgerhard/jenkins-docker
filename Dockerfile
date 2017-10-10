FROM jenkins/jenkins:lts-alpine

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

