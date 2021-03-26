# get the image from official docker
FROM ubuntu:groovy
# log in as Root user
USER root
# update official image with latest updates
RUN apt-get update
RUN apt-get upgrade -y 
RUN apt-get update -y --fix-missing
RUN apt-get dist-upgrade -y
# Install wget to download file
RUN apt-get install wget -y
# Install xvfb - fake environment
RUN apt-get install xvfb -y
# Install latest google chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
RUN apt install ./google-chrome-stable_current_amd64.deb -y
# Install openJDK-8 Java Development Kit
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install openjdk-11-jdk -y
# Install python3.9 and PIP
RUN apt-get install python3.9 python3-pip -y
# remove redundant packages
RUN apt-get autoremove -y
# Install and upgrade latest PIP
RUN python3 -m pip install --upgrade "pip < 21.0"
# Install robotframework
RUN python3 -m pip install robotframework
# Install robotframework library
RUN python3 -m pip install --upgrade robotframework-seleniumlibrary
RUN python3 -m pip install robotframework-soaplibrary
RUN python3 -m pip install --upgrade RESTinstance
RUN python3 -m pip install --upgrade robotframework-appiumlibrary
RUN python3 -m pip install robotframework-SikuliLibrary
RUN python3 -m pip install robotframework-browser
RUN python3 -m pip install robotframework-faker
# Download and install latest webdriver for Google Chrome and Firefox
RUN python3 -m pip install webdrivermanager
RUN python3 -m webdrivermanager firefox chrome --linkpath /usr/local/bin