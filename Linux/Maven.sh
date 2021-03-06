#!/usr/bin/env bash
# Maven installation
yum install java-11-openjdk # If needed
java -version
cd <folder for maven>
wget https://www-eu.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
sudo tar xzf apache-maven-3.6.3-bin.tar.gz
sudo ln -s apache-maven-3.6.3 maven
sudo vi /etc/profile.d/maven.sh
# and add the following content.
#export M2_HOME=/<folder for maven>/maven
#export PATH=${M2_HOME}/bin:${PATH}
source /etc/profile.d/maven.sh
mvn -version
# Add the folder where maven will build projects
# edit file /home/ec2-user/maven/apache-maven-3.6.3/conf/settings.xml
# Add the end of the section
#  <!-- localRepository
#   | The path to the local repository maven will use to store artifacts.
#   |
#   | Default: ${user.home}/.m2/repository
#  <localRepository>/path/to/local/repo</localRepository>
#  -->
# Copy  <localRepository>/path/to/local/repo</localRepository> modify it with real path and insert blow the "-->"
# Example
#  <localRepository>/home/ec2-user/maven/</localRepository>
