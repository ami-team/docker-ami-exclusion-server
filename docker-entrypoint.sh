#!/bin/sh

########################################################################################################################

AMI_CLASSPATH=$(find /AMIExclusionServer/lib/ -name '*.jar' | xargs echo | tr ' ' ':')

########################################################################################################################

java -server -Dfile.encoding=UTF-8 -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom \
\
-Dami.server_name="${SERVER_NAME}" \
\
-Dami.mqtt_url="${MQTT_URL}" \
-Dami.mqtt_username="${MQTT_USERNAME}" \
-Dami.mqtt_password="${MQTT_PASSWORD}" \
\
-Dami.home=/AMIExclusionServer/ \
\
-Dami.conf_file=/AMIExclusionServer/AMI.xml \
\
-classpath "${AMI_CLASSPATH}" \
\
net.hep.ami.exclusion.Main

########################################################################################################################
