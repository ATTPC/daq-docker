FROM centos:6.7

RUN yum -y install epel-release

RUN yum -y install \
    gcc-c++ \
    boost-devel \
    readline-devel \
    ncurses-devel \
    subversion \
    automake \
    autoconf \
    libtool \
    pkgconfig \
    qt-devel \
    qwt-devel \
    qwtplot3d-qt4-devel \
    log4cxx-devel \
    gsoap-devel \
    # root-gui-qt \
    # root-physics \
    wget

RUN wget -P /etc/yum.repos.d http://download.zeroc.com/Ice/3.5/el6/zeroc-ice-el6.repo && \
    yum -y install ice-c++-devel ice-servers mcpp-devel

CMD /bin/bash
