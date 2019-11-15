FROM amazonlinux:2
LABEL maintainer="Jun Kaneda <j.kaneda@tatsuno-system.co.jp>"
RUN yum -y install curl git sudo shadow-utils procps
RUN amazon-linux-extras install -y epel php7.3 httpd_modules
RUN groupadd -g 1000 ec2-user && useradd -u 1000 -g 1000 -d /home/ec2-user ec2-user
RUN echo "ec2-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ec2-user
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
COPY files/packages.txt /root/packages.txt
RUN yum -y install $(cat /root/packages.txt)
RUN mkdir -p -m 777 /var/www/html && chown ec2-user: /var/www/html
RUN mkdir -p -m 777 /var/movie

EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd","-DFOREGROUND"]
