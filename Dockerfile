FROM shizuki/amazonlinux2-php-apache:EC2-Apache24-PHP73
LABEL maintainer="Jun Kaneda <j.kaneda@tatsuno-system.co.jp>"
RUN curl -sL https://rpm.nodesource.com/setup_12.x | bash -
RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
COPY files/packages.txt /root/packages.txt
RUN yum -y install $(cat /root/packages.txt)

EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd","-DFOREGROUND"]
