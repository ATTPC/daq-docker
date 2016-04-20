FROM attpc/daqbase
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

RUN yum -y install \
    vim \
    tar 

RUN yum -y groupinstall 'Development Tools'

RUN groupadd -g 1000 attpc && useradd -u 1000 -g attpc attpc
USER attpc

CMD /bin/bash
