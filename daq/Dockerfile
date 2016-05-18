FROM attpc/daqbase
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

ADD RCLOG-20150516.tar.gz /daq/Packages
ADD RCCGUI-20151020.tar.gz /daq/Packages
ADD RCC-20151020.tar.gz /daq/Packages
ADD Narval-20151020.tar.gz /daq/Packages
ADD Scripts-20151020.tar.gz /daq/Packages

# Set up ACQ_HOST directories
RUN mkdir -p /daq/ACQ_HOST/2015-10-20 && \
    cd /daq/ACQ_HOST/2015-10-20 && \
    ln -s /daq/Packages/install_narval_7.3.0w_static/rev-1.14.3 Narval && \
    ln -s /daq/Packages/RCC-20151020 RCC && \
    ln -s /daq/Packages/RCCGUI-20151020 RCC_GUI && \
    ln -s /daq/Packages/RCLOG-20150516 RCLOG && \
    ln -s /daq/Packages/Ganil_Scripts-v7.0.4 Scripts && \
    ln -s /daq/ACQ_HOST/2015-10-20 /daq/ACQ_HOST/latest

RUN groupadd -g 1000 attpc && useradd -u 1000 -g attpc attpc
USER attpc

RUN touch /home/attpc/.tcshrc && \ 
    echo source /daq/ACQ_HOST/latest/Scripts/SetEnvACQ_ATTPC >> /home/attpc/.tcshrc

ENTRYPOINT ["/bin/tcsh", "-c"]

CMD ["tcsh"]
