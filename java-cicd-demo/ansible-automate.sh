# Artifactory location
server=https://codvatechlabs.jfrog.io/artifactory
repo=mavenkey
# Maven artifact location
name=LoginWebApp
artifact=com/javawebtutor/$name
path=$server/$repo/$artifact
echo $path
version=$(curl -u codvatechlabs@gmail.com:Devops@2021 -s $path/maven-metadata.xml | grep latest | sed "s/.*<latest>\([^<]*\)<\/latest>.*
/\1/")
build=$(curl -u codvatechlabs@gmail.com:Devops@2021 -s $path/$version/maven-metadata.xml | grep '<value>' | head -1 | sed "s/.*<value>\(
[^<]*\)<\/value>.*/\1/")
echo "Version ID"  $version
echo "Build ID" $build
jar=$name-$build.war
url=$path/$version/$jar
artifact_name=$name-$build.war
echo $artifact_name
# Download
echo $url
wget --user=codvatechlabs@gmail.com --password=Devops@2021 -q -N $url
#curl -u codvatechlabs@gmail.com:Devops@2021 -s $url
rm -rf /tmp/artifacts
mkdir /tmp/artifacts
mv $artifact_name LoginWebApp.war
cp LoginWebApp.war /tmp/artifacts
cp /tmp/artifacts/LoginWebApp.war /usr/share/tomcat/webapps
sudo systemctl stop tomcat
sudo systemctl start tomcat
