FROM attpc/rccbase
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

ENV LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:${RCC_EXE}

EXPOSE 6911

CMD java -cp ${RCC_EXE}/..:${RCC_EXE}/../log4j-1.3alpha-7.jar RunControlServer 
