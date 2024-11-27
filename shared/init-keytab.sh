rm -rf /shared/keytabs/hadoop.keytab
kadmin.local -q "addprinc -randkey hadoop/cluster@EXAMPLE.COM"
kadmin.local -q "ktadd -k /shared/keytabs/hadoop.keytab hadoop/cluster@EXAMPLE.COM"
sudo chmod 777 -R /shared/keytabs/

# keytool -genkeypair -alias hdfs-key -keyalg RSA -keystore /hadoop-data/keystore.jks -keysize 2048
# keytool -import -alias trusted-cert -file /hadoop-data/certificate.crt -keystore /hadoop-data/truststore.jks
# /shared/init-keytab.sh
# kinit -kt /shared/keytabs/hadoop.keytab  hadoop/cluster@EXAMPLE.COM
# klist -kt /etc/security/keytabs/hadoop.keytab
# sudo -u hadoop /opt/hadoop/bin/hdfs namenode
# hdfs dfsadmin -report
# start-hbase.sh
# netstat -tulpn | grep LISTEN
# chmod 400 /path/to/keytab
# chown hadoop:hadoop /path/to/keytab