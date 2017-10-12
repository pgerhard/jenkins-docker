# Jenkins Docker image

This is a fully functional Jenkins server 
[http://jenkins.io/](http://jenkins.io/) with pre installed "blueocean" plugin.

<img src="http://jenkins-ci.org/sites/default/files/jenkins_logo.png"/>

# Build

```
docker build --tag srempfer/jenkins jenkins-docker
```

# Usage

Linux
```
docker run \
  -p 8080:8080 \
  -e JENKINS_USER="admin" \
  -e JENKINS_PASS="admin" \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  srempfer/jenkins
```

Windows

```
docker run ^
  -p 8080:8080 ^
  -e JENKINS_USER="admin" ^
  -e JENKINS_PASS="admin" ^
  -v jenkins_home:/var/jenkins_home ^
  -v /var/run/docker.sock:/var/run/docker.sock ^
  srempfer/jenkins
```

See also https://github.com/jenkinsci/docker
