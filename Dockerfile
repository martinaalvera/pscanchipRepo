FROM centos:7

#install apache
RUN yum install httpd httpd-tools -y

#install wget
RUN yum install wget -y

#install EPEL repo 
RUN yum install epel-release -y
RUN yum install autoconf libtool re2c bison libxml2-devel bzip2-devel libcurl-devel libpng-devel libicu-devel gcc-c++ libmcrypt-devel \
        libwebp-devel libjpeg-devel openssl-devel -y

#install php
RUN yum install php php-gd php-mysql php-mcrypt -y

#Update Apache Configuration
RUN sed -E -i -e '/<Directory "\/var\/www\/html">/,/<\/Directory>/s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf
RUN sed -E -i -e 's/DirectoryIndex (.*)$/DirectoryIndex index.php \1/g' /etc/httpd/conf/httpd.conf
RUN sed -i 's/var\/www\/html/var\/www\/pscan_chip_dev/g' /etc/httpd/conf/httpd.conf

#add pscan chip
COPY ./pscan_chip_dev /var/www/pscan_chip_dev

#install gsl
RUN yum install gsl.x86_64 -y
RUN yum install gsl-devel -y

#install gd library
RUN yum install gd.i686 gd-devel.i686 gd-devel.x86_64 gd-progs.x86_64 -y

#installa ghostscript
RUN yum install ghostscript -y

#install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py

#install seqlog
RUN pip install seqlog

#change user
RUN chown -R apache /var/www > Dockerfile

EXPOSE 80

#run apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
