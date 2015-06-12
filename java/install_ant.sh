set -x

mkdir -p $HOME/build
cd $HOME/build
wget http://apache.arvixe.com//ant/binaries/apache-ant-1.9.5-bin.tar.gz
tar -xzf apache-ant-1.9.5-bin.tar.gz -C /usr/local

cd /usr/local
ln -s apache-ant-1.9.5 ant

cd /etc/profile.d
echo 'export ANT_HOME=/usr/local/ant' >> ant.sh
echo 'export PATH=${ANT_HOME}/bin:${PATH}' >> ant.sh

