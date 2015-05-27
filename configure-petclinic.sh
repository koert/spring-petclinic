#!/bin/bash

SCRIPT=$(readlink -f "$0")
bin_dir=$(dirname "$SCRIPT")
root_dir=${bin_dir}/..

# Print error message and exit 1
# message - error message
fail() {
  echo $1
  exit 1
}

# Call asadmin command
# args - arguments
cmdAsAdmin() {
  echo "* asadmin $@"
  asadmin --user admin --passwordfile ${root_dir}/config/admin-password $* || fail "asadmin command failed"
}

echo "=> Start Glassfish server"
asadmin start-domain 

echo "=> Create datasource"
cmdAsAdmin create-jdbc-connection-pool --restype=javax.sql.DataSource --datasourceclassname=org.hsqldb.jdbc.JDBCDataSource \
  --property "user=sa:password=sa:url=jdbc\:hsqldb\:hsql\:mem\:petclinic" \
  PetClinicPool

cmdAsAdmin create-jdbc-resource --connectionpoolid PetClinicPool jdbc/petclinic

echo "=> Stop Glassfish server"
asadmin stop-domain



