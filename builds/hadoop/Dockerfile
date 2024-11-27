FROM apache/hadoop:3

USER root
WORKDIR /root/
RUN sed -i 's/mirror.centos.org/vault.centos.org/g' /etc/yum.repos.d/*.repo
RUN sed -i 's/^#.*baseurl=http/baseurl=http/g' /etc/yum.repos.d/*.repo
RUN sed -i 's/^mirrorlist=http/#mirrorlist=http/g' /etc/yum.repos.d/*.repo

# network commands
RUN yum -y install net-tools
# RUN yum -y install iputils
# RUN yum -y install lsof
# RUN yum -y install curl wget


# kerberos client configuration
RUN yum -y install krb5-libs
ENV KRB5_CONFIG=/etc/krb5.conf
COPY ./krb5.conf /etc/krb5.conf

# systemctl
COPY ./systemctl.py /usr/bin/systemctl
RUN chmod a+x /usr/bin/systemctl

#self ssl
USER hadoop
RUN sudo mkdir -pv /ssl-conf
COPY ./ssl-conf /ssl-conf

# install hbase
COPY ./hbase-2.6.1-hadoop3 /opt/hbase
ENV ENSURE_NAMENODE_DIR='/tmp/hadoop-root/dfs/name'
ENV PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/hadoop/bin:/opt/hbase/bin:/usr/lib/jvm/jre'
ENV CLASSPATH='/opt/hbase/lib/*'
ENV KRB5CCNAME='/tmp/krb5cc'
ENV JAVA_HOME='/usr/lib/jvm/jre'

