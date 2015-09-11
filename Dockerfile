# docker Drupal
# VERSION       0.3
FROM    savoirfairelinux/lampd
MAINTAINER Ernesto Rodriguez Ortiz <ernesto.rodriguezortiz@savoirfairelinuc.com>

# Create project root directory and copy the structure
RUN mkdir /opt/indus-demo
COPY . /opt/indus-demo

# Setup ssh keys to connect to conainter using ssh
RUN mv /opt/indus-demo/deploy/id_rsa* /root/.ssh/
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/id_rsa*
RUN exec ssh-agent /bin/bash && ssh-add /root/.ssh/id_rsa
RUN ssh-keyscan gitlab.savoirfairelinux.com >> /root/.ssh/known_hosts

#Copy vhost configuration and enable modules
RUN cp /opt/indus-demo/deploy/vhost.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite vhost_alias
