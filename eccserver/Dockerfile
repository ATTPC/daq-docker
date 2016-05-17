FROM attpc/get
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

RUN groupadd -r ecc && useradd -r -g ecc ecc
USER ecc

EXPOSE 8083

CMD /daq/GET/latest/bin/getEccSoapServer
