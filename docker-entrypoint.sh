#!/bin/sh

########################################################################################################################

AMI_CLASSPATH=$(find /AMIExclusionServer/lib/ -name '*.jar' | xargs echo | tr ' ' ':')

########################################################################################################################

java -server -Dfile.encoding=UTF-8 -Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom -classpath "${AMI_CLASSPATH}" net.hep.ami.exclusion.Main

########################################################################################################################
