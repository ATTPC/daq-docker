FROM centos:6.7
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

RUN yum -y install epel-release

RUN yum -y install \
    apr \
    apr-devel \
    apr-util \
    apr-util-devel \
    cpan \
    gcc \
    graphviz \
    gsoap-2.7.16 \
    gsoap-devel-2.7.16 \
    libuuid-devel \
    monotone \
    nedit \
    svnkit \
    subversion \
    tar \
    tcsh \
    tinyxml-devel \
    uuid-devel \
    xerces-c-devel \
    xml-commons-apis

COPY log4cxx* /tmp/
RUN yum -y install \
    /tmp/log4cxx-0.10.0-16.el6.x86_64.rpm \
    /tmp/log4cxx-devel-0.10.0-16.el6.x86_64.rpm \
    && rm -f /tmp/log4cxx*

# Install Perl dependencies for Ganil Scripts
RUN yes yes | cpan -fi XML::SAX XML::Parser::Wrapper

CMD /bin/bash
