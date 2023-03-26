#Importing base image Ubuntu
FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive

#Updating and Upgrading Ubuntu
RUN apt-get -y update \
&& apt-get -y upgrade
#Installing Basic Packages & Utilities in Ubuntu
RUN apt-get -y install software-properties-common git gnupg sudo nano vim wget curl zip unzip build-essential libtool autoconf uuid-dev pkg-config libsodium-dev lynx-common tcl inetutils-ping net-tools ssh openssh-server openssh-client openssl letsencrypt apt-transport-https telnet locales gdebi lsb-release
#Clear cache
RUN apt-get clean
#Jenkins installation
#Download & add repository key
RUN sudo apt install curl -y
RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#Getting binary file into /etc/apt/sources.list.d
RUN sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
#Updating packages
RUN sudo apt-get update
#Installing Jenkins
RUN sudo apt-get install fontconfig openjdk-11-jre -y
RUN sudo apt-get -y install jenkins
#Start jenkins
RUN sudo service jenkins start
#Expose port 8080
EXPOSE 8080