# get R up and running
yum install -y R

# get Rstudio going
yum install -y openssl098e # Required only for RedHat/CentOS 6 and 7
cd rpms
wget http://download2.rstudio.org/rstudio-server-0.98.1102-x86_64.rpm
yum install -y --nogpgcheck rstudio-server-0.98.1102-x86_64.rpm
cd ~
