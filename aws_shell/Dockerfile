FROM attpc/daq
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

COPY launch_aws.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/launch_aws.sh

EXPOSE 6080

USER attpc

CMD ["launch_aws.sh"]
