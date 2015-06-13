set -e
set -x

cd $HOME/build
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm
rpm -Uvh jdk-8u45-linux-x64.rpm

echo 'JAVA_HOME=/usr/java/jdk1.8.0_45/' >> /etc/profile.d/java_home.sh
