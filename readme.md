Collection of scripts and other resources to install tools
on centos.

# Scripts
 - `pre_thrift.sh` you may need to run this before installing
    thrift, if your system has a bunch of old automakes sitting around.
 - `thrift.sh` installs thrift. You need to have the environments
   for the target languages (e.g. python, java, node) already prepared
   before you do this. If it gives errors regarding `go`, do not worry
   too much. You need to fix those errors to generate go code, but
   it does not affect the other languages. It will not install a C++
   thrift generator unless you have an up-to-date boost library, which
   might be a struggle.
 - `java/install_java.sh` sets up a basic java dev environment, and
   sets up needed environment varialbes (via `/etc/profile.d`, so that
   other users will also have correct variables by default).
   It *will not work* unless you download the rpm to $HOME/build first,
   which is a manual step.
 - `java/install_maven.sh` installs maven to `/usr/local` and sets
   up the proper environment variables.
 - `java/install_ant.sh` installs ant to `/usr/local` and sets up
   the proper environment variables.

