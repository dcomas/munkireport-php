FROM tutum/apache-php:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y php5-sqlite git

WORKDIR /

RUN rm -fr /app && git clone https://github.com/munkireport/munkireport-php.git /app
RUN mkdir -p /data/munkireport/db && chmod -R 777 /data/munkireport
RUN cp /app/config_default.php /app/config.php && \
    echo "\$auth_config['admin'] = '\$P\$BDnkPOMPV0BMGL7YROrT9ITzwk3ZWz/';" >> /app/config.php

EXPOSE 80

RUN sed -i "s/array('munkireport');/array('ard','bluetooth','certificate','disk_report','displays_info','filevault_status','gsx','installhistory','inventory','localadmin','munkiinfo','munkireport','network','power','printer','profile','security','warranty','wifi');/" /app/config.php
