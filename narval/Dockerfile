FROM attpc/daq
MAINTAINER Josh Bradt <bradt@nscl.msu.edu>

RUN yum -y install epel-release
RUN yum -y install openssh-clients openssh-server supervisor sudo
    
COPY launch_*.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/launch_*.sh

#COPY supervisord.conf /etc/supervisord.conf
#RUN mkdir -p /var/log/supervisor

COPY setenv_daq.sh /root/
RUN chmod a+x /root/setenv_daq.sh && \
    echo "source ~/setenv_daq.sh" >> /root/.bashrc

EXPOSE 2809 6080 

#USER attpc

RUN yes '' | ssh-keygen && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys && \
    printf "Host *\n    StrictHostKeyChecking no" >> /root/.ssh/config

CMD ["/usr/local/bin/launch_narval.sh"]
#CMD ["/usr/bin/supervisord", "-n"]
