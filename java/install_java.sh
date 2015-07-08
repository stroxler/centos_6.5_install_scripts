#!/bin/bash

set -e
set -x

echo "192.168.4.254 localhn" >> /etc/hosts

yum update -y
yum install -y unzip

cd /opt

NAME=jdk-8u45-linux-x64
JAVANAME=jdk1.8.0_45
wget --no-cookies --no-check-certificate --header \
  "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/$NAME.tar.gz"

tar xvf $NAME.tar.gz
chown -R root: $JAVANAME
alternatives --install /usr/bin/java java /opt/$JAVANAME/bin/java 20000
alternatives --install /usr/bin/javac javac /opt/$JAVANAME/bin/javac 20000
rm $NAME.tar.gz

echo "export JAVA_HOME=/usr/java/$JAVANAME/" >> /etc/profile.d/java_home.sh
