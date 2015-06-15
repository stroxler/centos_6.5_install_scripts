set -x

# Installs thrift dependencies
#   - in the interests of thoroughness I am including the 'optional' parts,
#     but if you are impations I *believe* you can skip the boost upgrade,
#     which is pretty time-consuming.
#   - you may need to run something like pre_thrift.sh first, because the
#     automake update fails if the automake build script finds multiple
#     versions of automake installed.
#   - does *not* build a C++ client. To get this, you need boost, and I
#     was unable to get boost to compile on centos.
#   - It detects the dependencies in ./configure, so you need to already
#     have things set up in each language you want.
#      - for C++, you need updated boost libraries. I had trouble getting
#        these in centos, so I gave up
#      - for java, you need a JDK installed and you need JAVA_HOME set
#        correctly.
#      - for go, you need the correct google library. It failed on my
#        dev container because of this; I'm pretty sure this is trivial to
#        solve for people who actually know go.

yum -y update
yum -y groupinstall "Development Tools"
yum install -y wget
sudo yum -y install libevent-devel zlib-devel openssl-devel

# need to create a bunch of stuff from source
mkdir -p $HOME/build
cd $HOME/build

# upgratde autoconf
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
tar xvf autoconf-2.69.tar.gz
cd autoconf-2.69
./configure --prefix /usr
make
make install
cd ..

# upgrade automake
wget http://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
tar xvf automake-1.14.tar.gz
cd automake-1.14
./configure --prefix=/usr
make
sudo make install
cd ..

# upgrade bison
wget http://ftp.gnu.org/gnu/bison/bison-2.5.1.tar.gz
tar xvf bison-2.5.1.tar.gz
cd bison-2.5.1
./configure --prefix=/usr
make
sudo make install
cd ..

# install boost
#   warning: this may not work. I had trouble the first time I tried it,
#            it worked the second time.
wget http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.gz
tar xvf boost_1_55_0.tar.gz
cd boost_1_55_0
./bootstrap.sh
sudo ./b2 -j 32 install

# build and install thrift
git clone https://git-wip-us.apache.org/repos/asf/thrift.git
cd thrift
./bootstrap.sh
./configure --with-lua=no
make
sudo make install
