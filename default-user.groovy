import jenkins.model.*
import hudson.security.*

def env = System.getenv()
def jenkins = Jenkins.getInstance()

println "--> creating local user '" + env.JENKINS_USER + "'"

def securityRealm = new HudsonPrivateSecurityRealm(false)
securityRealm.createAccount(env.JENKINS_USER, env.JENKINS_PASS )

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)

jenkins.setSecurityRealm(securityRealm)
jenkins.setAuthorizationStrategy(strategy)
jenkins.save()
