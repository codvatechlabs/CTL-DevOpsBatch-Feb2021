Maven Setup
Ref Link : https://gist.github.com/sebsto/19b99f1fa1f32cae5d00

sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install -y apache-maven
mvn --version

https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.45/src/apache-tomcat-9.0.45-src.tar.gz