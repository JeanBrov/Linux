#!/usr/bin/env bash
#Deploy Jenkins in RedHat
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl status jenkins
sudo yum install jenkins java-1.8.0-openjdk-devel
sudo systemctl daemon-reload
# Getting admin password after install
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#For integrate with github and compile java code a 'git' must be installed
sudo yum install git
# All jenkins jobs artefacts are saved here /var/lib/jenkins/workspace/<job-name>
#Configure Jenkins integration with github via pulls
# 1. run create a job
# 2. Select GitHub project cell in "General section"  and specify "Project url" from GitHub
# for example "https://github.com/JeanBrov/my-java/"
# 3. In the Source Code Management section, chose "Git" cell.
# Specify "Repository URL" from git, for example "https://github.com/JeanBrov/my-java.git"
# And add credentials for GIT. For example: username: ivan.kriskun@gmail.com, password: XXXXXX