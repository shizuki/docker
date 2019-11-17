FROM shizuki/amazonlinux2-php-apache:EC2-Apache24-PHP73-Node12
LABEL maintainer="Jun Kaneda <j.kaneda@tatsuno-system.co.jp>"
COPY files/packages.txt /root/packages.txt
RUN yum -y install $(cat /root/packages.txt)
RUN mkdir -p -m 777 /var/www/html && chown ec2-user: /var/www/html
RUN mkdir -p -m 777 /var/movie

EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd","-DFOREGROUND"]
