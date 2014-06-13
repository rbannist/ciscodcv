##################
# Cisco DCV Demo #
##################

FROM ubuntu

MAINTAINER rbannist

RUN apt-get update

RUN apt-get install -y make libcairo2-dev libpng12-dev freerdp-x11 libssh2-1 libvncserver-dev libfreerdp-dev libvorbis-dev libssl0.9.8 gcc libssh-dev libpulse-dev tomcat7 tomcat7-admin tomcat7-docs libpango-1.0-0 libssh2-1-dev supervisor

RUN mkdir /etc/guacamole

#ADD ./guacamole-server/guacamole-server.tar.gz /etc/guacamole/
#ADD ./guacamole-client/guacamole.war /etc/guacamole/
#ADD ./guacamole-config/guacamole.properties /etc/guacamole/
#ADD ./guacamole-config/user-mapping.xml /etc/guacamole/

#RUN cd /etc/guacamole && \
# mv ./guacamole-server-0.9.1 ./guacamole-server && \
# cd guacamole-server/ && \
# ./configure --with-init-dir=/etc/init.d && \
# make && \
# make install && \
# update-rc.d guacd defaults && \
# ldconfig

RUN mkdir /usr/share/tomcat7/.guacamole
RUN ln -s /etc/guacamole/guacamole.properties /usr/share/tomcat7/.guacamole
RUN cp /etc/guacamole/guacamole.war /var/lib/tomcat7/webapps/guacamole.war


# Add supervisor files
#ADD ./supervisor/supervisor.conf /etc/supervisor/supervisor.conf
#ADD ./supervisor/guacamole.sv.conf /etc/supervisor/conf.d/

EXPOSE 8080 

# Activate guacd service and start tomcat under supervisor so the Docker container is persisted
#CMD ["supervisord", "-c", "/etc/supervisor/supervisor.conf"]

