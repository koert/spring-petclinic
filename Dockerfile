FROM koert/glassfish-4.1
MAINTAINER Koert Zeilstra <koert.zeilstra@zencode.nl>

# Build image
# docker build -t koert/petclinic .

# Run with debugging
# docker run --rm -v ~/tmp/glassfish/deploy:/opt/glassfish4/glassfish/domains/domain1/autodeploy -v ~/tmp/glassfish/logs:/opt/glassfish4/glassfish/domains/domain1/logs -p 4848:4848 -p 8080:8080 -p 9009:9009 -e DEBUG="true" koert/petclinic

ADD hsqldb-2.3.2.jar /opt/glassfish4/glassfish/lib/hsqldb-2.3.2.jar

ADD configure-petclinic.sh /opt/app/bin/configure-petclinic.sh
RUN chmod +x /opt/app/bin/*.sh

RUN /opt/app/bin/configure-petclinic.sh 

ADD target/petclinic.war /opt/glassfish4/glassfish/domains/domain1/autodeploy/petclinic.war

