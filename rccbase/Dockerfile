FROM attpc/daq
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

COPY jre-*.rpm /tmp/
RUN yum -y install /tmp/jre*.rpm && rm /tmp/jre*.rpm

ENV EXP_DIR=/exp

ENV RCC_EXE=/daq/ACQ_HOST/latest/RCC/Linux-x86_64 \
    RCC_PROPERTIES=${CFG_DIR}/rcc.properties \
    RCC_HOST=rcc \
    RCC_PORT=6911

ENV RCLOG_EXE=/daq/ACQ_HOST/latest/RCLOG \
    RCLOG_PROPERTIES=${CFG_DIR}/rclog.properties \
    RCLOG_HOST=rclog \
    RCLOG_PORT=6912

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${RCC_EXE} \
    PATH=${PATH}:${RCC_EXE}

COPY *.properties ${CFG_DIR}/
