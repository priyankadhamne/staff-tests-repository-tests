FROM sonatypenexus.schneider.com:19443/schneider-staff:1.0-browserstack8.6-ubuntu20.04

ARG POM_FILE=pom.xml
ARG SRC_DIR=src

COPY ${POM_FILE} pom.xml
COPY ${SRC_DIR} src

RUN chmod 777 -R /opt/app
USER 1001