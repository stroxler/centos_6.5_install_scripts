set -e
set -x

# there's no easy way to get this in a scripted way. Go to this site:
# http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
# and download to your laptop. Then copy it over. There's probably a way to do it
# by looking at the auth token but it isn't worth the effort.
cd $HOME/build
rpm -Uvh jdk-8u45-linux-x64.rpm

echo 'JAVA_HOME=/usr/java/jdk1.8.0_45/' >> /etc/profile.d/java_home.sh
