set -e
set -x

mkdir -p $HOME/build
cd $HOME/build
wget http://mirror.cc.columbia.edu/pub/software/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
tar -xzf apache-maven-3.0.5-bin.tar.gz -C /usr/local

cd /usr/local
ln -s apache-maven-3.0.5 maven

cd /etc/profile.d
echo 'export M2_HOME=/usr/local/maven' >> maven.sh
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> maven.sh
