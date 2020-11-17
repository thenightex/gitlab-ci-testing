FROM openjdk:8-jdk-alpine

RUN mkdir /opt/elbook
RUN mkdir /opt/elbook/logs
RUN mkdir /opt/elbook/data

COPY elbook.jar /opt/elbook/app.jar
RUN cd /opt/elbook

RUN apk add tzdata
RUN ls /usr/share/zoneinfo
RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN echo "Europe/Berlin" >  /etc/timezone

ENTRYPOINT ["java","-jar","/opt/elbook/app.jar"]
