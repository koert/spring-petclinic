#!/bin/bash

asadmin create-jdbc-connection-pool --restype=javax.sql.DataSource --datasourceclassname=org.hsqldb.jdbc.JDBCDataSource \
  --property "user=sa:password=sa:url=jdbc\:hsqldb\:hsql\:mem\:petclinic" \
  PetClinicPool

asadmin create-jdbc-resource --connectionpoolid PetClinicPool jdbc/petclinic



