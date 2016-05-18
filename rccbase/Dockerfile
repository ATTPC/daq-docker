FROM attpc/daq
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

ENV RCC_EXE /daq/ACQ_HOST/latest/RCC/Linux-x86_64
ENV RCC_PROPERTIES /home/attpc/rcc.properties
ENV RCC_HOST rcc
ENV RCC_PORT 6911

ENV RCLOG_EXE /daq/ACQ_HOST/latest/RCLOG
ENV RCLOG_PROPERTIES /home/attpc/rclog.properties
ENV RCLOG_HOST rclog
ENV RCLOG_PORT 6912

ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${RCC_EXE}

COPY *.properties /home/attpc/

CMD tcsh
