########################################################################################################################

FROM amazoncorretto:11-alpine

########################################################################################################################

LABEL maintainer="Jérôme ODIER <odier.jerome@lpsc.in2p3.fr>"

LABEL description="AMI Exclusion Server"

########################################################################################################################

ENV SERVER_NAME=""

ENV MQTT_URL=""
ENV MQTT_USERNAME=""
ENV MQTT_PASSWORD=""

########################################################################################################################

RUN ["wget", "-O", "AMIExclusionServer-bundle.zip", "https://repo.ami-ecosystem.in2p3.fr/releases/net/hep/ami/AMIExclusionServer/1.0.0/AMIExclusionServer-1.0.0-bundle.zip"]

RUN ["unzip", "AMIExclusionServer-bundle.zip"]

RUN ["rm", "AMIExclusionServer-bundle.zip"]

########################################################################################################################

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN ["chmod", "a+x", "/docker-entrypoint.sh"]

########################################################################################################################

COPY AMI.xml /AMIExclusionServer/AMI.xml

########################################################################################################################

VOLUME /AMIExclusionServer/logs/

########################################################################################################################

WORKDIR /AMIExclusionServer/

########################################################################################################################

ENTRYPOINT ["/docker-entrypoint.sh"]

########################################################################################################################

EXPOSE 1357

########################################################################################################################
