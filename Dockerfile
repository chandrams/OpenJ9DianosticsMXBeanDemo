FROM liberty-openjdk8-openj9 

MAINTAINER Chandrakala <chandra-ms@in.ibm.com> (@chandrams)

ENV JVM_ARGS="-Xdump:dynamic"
COPY server.xml /opt/ol/wlp/usr/servers/defaultServer/
COPY HelloWorld.war /opt/ol/wlp/usr/servers/defaultServer/dropins/ROOT.war
COPY keystore.jks  /opt/ol/wlp/usr/servers/defaultServer/resources/security/keystore.jks

ENV LICENSE accept
CMD ["/opt/ol/wlp/bin/server", "run", "defaultServer"]
