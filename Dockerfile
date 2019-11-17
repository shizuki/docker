FROM shizuki/amazonlinux2-php-apache:pure-ec2
LABEL maintainer="Jun Kaneda <j.kaneda@tatsuno-system.co.jp>"
RUN amazon-linux-extras install -y epel httpd_modules
COPY files/packages.txt /root/packages.txt
RUN yum -y install $(cat /root/packages.txt)
RUN mkdir -p -m 777 /var/www/html && chown ec2-user: /var/www/html

EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd","-DFOREGROUND"]
