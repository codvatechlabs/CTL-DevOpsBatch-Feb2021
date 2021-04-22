## Jenkins Installation Steps
- sudo yum -y update
- sudo yum install java-1.8.0
- sudo yum remove java-1.7.0-openjdk
- sudo wget -O /etc/yum.repos.d/jenkins.repo - - - -   -https://pkg.jenkins.io/redhat-stable/jenkins.repo
- sudo rpm --- import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
- sudo yum inst- all jenkins
- sudo service je- nkins start
- sudo chkconfig --- add jenkins
- http://{ec2-public-- dns}:8080

