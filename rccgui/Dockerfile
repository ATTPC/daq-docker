FROM attpc/daq
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

EXPOSE 4000

USER attpc

WORKDIR /daq/ACQ_HOST/latest/RCC_GUI

ENTRYPOINT ["/bin/bash", "-c"]

CMD ["sleep 5 && java -jar IHMRC.jar"]
