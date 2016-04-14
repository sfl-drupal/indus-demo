# docker Drupal
# VERSION       0.3
FROM    savoirfairelinux/lampd
MAINTAINER Ernesto Rodriguez Ortiz <ernesto.rodriguezortiz@savoirfairelinuc.com>

# Create project root directory and copy the structure
RUN mkdir /opt/sfl
COPY . /opt/sfl

# Setup ssh keys to connect to conainter using ssh
RUN mv /opt/sfl/conf/id_rsa* /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/id_rsa*


#Copy vhost configuration and enable modules
RUN cp /opt/sfl/conf/vhost.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite vhost_alias
