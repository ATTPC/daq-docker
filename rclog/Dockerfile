FROM attpc/daq
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

EXPOSE 6912

ENTRYPOINT ["bash", "-c"]

CMD ["java -cp ${RCLOG_EXE}:${RCLOG_EXE}/log4j-1.3alpha-7.jar:${RCLOG_EXE}/log4j-xml-1.3alpha-7.jar RCLOG"]
