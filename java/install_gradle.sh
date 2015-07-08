#!/bin/bash

set -e
set -x

INSTALL_LOCATION=/usr/local

cd $INSTALL_LOCATION
wget https://services.gradle.org/distributions/gradle-2.4-all.zip
unzip gradle-2.4-all.zip
RESULT_FOLDER=gradle-2.4
ln -s $INSTALL_LOCATION/$RESULT_FOLDER/bin/gradle bin/gradle
rm gradle-2.4-all.zip

cd /etc/profile.d
echo "export GRADLE_HOME=$INSTALL_LOCATION/$RESULT_FOLDER" >> gradle.sh
