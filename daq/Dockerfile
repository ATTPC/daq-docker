FROM attpc/daqbase
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

# Add the compiled DAQ packages
ADD RCLOG-20150516.tar.gz /daq/Packages
ADD RCCGUI-20151020.tar.gz /daq/Packages
ADD RCC-20151020.tar.gz /daq/Packages
ADD Narval-20151020.tar.gz /daq/Packages
ADD Scripts-20151020.tar.gz /daq/Packages

# Add some utilities for networking and GUI testing
RUN yum -y install nc xeyes

# Install Oracle Java
COPY jre-*.rpm /tmp/
RUN yum -y install /tmp/jre*.rpm && rm /tmp/jre*.rpm

# Set up ACQ_HOST directories
RUN mkdir -p /daq/ACQ_HOST/2015-10-20 && \
    cd /daq/ACQ_HOST/2015-10-20 && \
    ln -s /daq/Packages/install_narval_7.3.0w_static/rev-1.14.3 Narval && \
    ln -s /daq/Packages/RCC-20151020 RCC && \
    ln -s /daq/Packages/RCCGUI-20151020 RCC_GUI && \
    ln -s /daq/Packages/RCLOG-20150516 RCLOG && \
    ln -s /daq/Packages/Ganil_Scripts-v7.0.4 Scripts && \
    ln -s /daq/ACQ_HOST/2015-10-20 /daq/ACQ_HOST/latest

# Set up user
ENV DAQUSER=attpc
RUN groupadd -g 1000 ${DAQUSER} && useradd -u 1000 -g ${DAQUSER} ${DAQUSER}

# Set up daq config folder
ENV CFG_DIR=/daq/config
RUN mkdir ${CFG_DIR} && chown ${DAQUSER}:${DAQUSER} ${CFG_DIR}

# Set up the environment for Narval
ENV NARVAL_INSTALL=/daq/ACQ_HOST/latest/Narval \
    NARVAL_CONFIG=/daq/.narval

RUN mkdir ${NARVAL_CONFIG} && chown ${DAQUSER}:${DAQUSER} ${NARVAL_CONFIG}

ENV POLYORB_CONF=${NARVAL_CONFIG}/narval.conf \
    AWS_PORT=6080 \
    PATH=$PATH:${NARVAL_INSTALL}/x86_64/bin \
    LD_LIBRARY_PATH=${NARVAL_INSTALL}/x86_64/adalib:${NARVAL_INSTALL}/x86_64/lib:${LD_LIBRARY_PATH}

# Set up the environment for RCC
ENV EXP_DIR=/exp \
    RCC_CONFIG=/daq/.rcc

RUN mkdir ${RCC_CONFIG} && chown ${DAQUSER}:${DAQUSER} ${RCC_CONFIG}

ENV RCC_EXE=/daq/ACQ_HOST/latest/RCC/Linux-x86_64 \
    RCC_PROPERTIES=${RCC_CONFIG}/rcc.properties \
    RCC_HOST=rcc \
    RCC_PORT=6911 \
    ALARM_PROPERTIES=${RCC_CONFIG}/alarm.properties \
    ALARM_PORT=6913

ENV RCLOG_EXE=/daq/ACQ_HOST/latest/RCLOG \
    RCLOG_PROPERTIES=${RCC_CONFIG}/rclog.properties \
    RCLOG_HOST=rclog \
    RCLOG_PORT=6912

ENV RCC_GUI_PROPERTIES=${RCC_CONFIG}/rcc_gui.properties

ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${RCC_EXE} \
    PATH=${PATH}:${RCC_EXE}

# Install configs for RCC, RCLOG, and RCCGUI
COPY *.properties ${RCC_CONFIG}/
