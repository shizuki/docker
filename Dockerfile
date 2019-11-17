FROM amazonlinux:2
LABEL maintainer="Jun Kaneda <j.kaneda@tatsuno-system.co.jp>"
RUN yum -y install sudo shadow-utils procps
RUN groupadd -g 1000 ec2-user && useradd -u 1000 -g 1000 -d /home/ec2-user ec2-user
RUN echo "ec2-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ec2-user
COPY files/packages.txt /root/packages.txt
RUN yum -y install $(cat /root/packages.txt)

CMD "/sbin/init"
