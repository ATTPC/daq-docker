FROM attpc/daq
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

COPY launch_naming.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/launch_naming.sh

EXPOSE 2809

USER attpc

CMD ["/usr/local/bin/launch_naming.sh"]
