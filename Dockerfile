FROM centos:centos7
LABEL Vendor="CentOS"

RUN yum -y install vim

ADD /install.sh /root/install.sh
#ADD https://github.kdc.capitalone.com/raw/AndrewHayes/dotfiles/master/install.sh /root/install.sh
RUN sh /root/install.sh

# add vim
#ADD	./ /root/dotfiles



# im thinking we could add an onbuild instruction to add the current directory
# where the command is ran into the build as the /workdir/ directory. need to
# test it out to see if when i call the shell script if things still pass
# seemlessly through to the docker file. will the ./ instruction still refer to
# the directory where i called dev.sh from or will the ./ refer to the location
# of dev.sh?
#ONBUILD ARG argname=argnameDefaultValue
#ONBUILD ENV $argname
#ONBUILD ADD . /workdir
#ONBUILD ADD some sort of dotfiles thing? maybe call an installer? or does onbuild have acces to --build-arg's?
#ONBUILD RUN /usr/local/bin/python-build --dir /app/src

