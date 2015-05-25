FROM koert/glassfish-4.1
MAINTAINER Koert Zeilstra <koert.zeilstra@zencode.nl>

# Build image
# docker build -t koert/petclinic .

# Run with debugging
# docker run --rm -v ~/tmp/glassfish/deploy:/opt/glassfish4/glassfish/domains/domain1/autodeploy -v ~/tmp/glassfish/logs:/opt/glassfish4/glassfish/domains/domain1/logs -p 4848:4848 -p 8080:8080 -p 9009:9009 -e GLASSFISH_PASS="mypass" -e DEBUG="true" koert/petclinic

ADD hsqldb-2.3.2.jar /opt/app/extlib/hsqldb-2.3.2.jar

ADD configure-glassfish.sh /opt/app/bin/configure-glassfish.sh
RUN chmod +x /opt/app/bin/*.sh

ADD target/petclinic.war /opt/app/deploy/petclinic.war

