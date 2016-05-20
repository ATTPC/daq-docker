FROM attpc/daq
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

COPY launch_rcc.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/launch_rcc.sh

EXPOSE 6911 6913

USER attpc

CMD ["launch_rcc.sh"]
