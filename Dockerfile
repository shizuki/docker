FROM shizuki/amazonlinux2-php-apache:ec2-apache24
LABEL maintainer="Jun Kaneda <j.kaneda@tatsuno-system.co.jp>"
RUN amazon-linux-extras install -y php7.3
COPY files/packages.txt /root/packages.txt
RUN yum -y install $(cat /root/packages.txt)
RUN pecl install xdebug
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd","-DFOREGROUND"]
