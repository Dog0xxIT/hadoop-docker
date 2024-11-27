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

# systemctl
COPY ./systemctl.py /usr/bin/systemctl
RUN chmod a+x /usr/bin/systemctl

# kerberos server configuration
RUN yum -y install krb5-server krb5-libs krb5-workstation
ENV KRB5_CONFIG=/etc/krb5.conf
ENV KRB5_KDC_PROFILE=/var/kerberos/krb5kdc/kdc.conf
RUN mkdir -pv /var/kerberos/krb5kdc/
COPY ./kdc.conf /var/kerberos/krb5kdc/kdc.conf
COPY ./kadm5.acl /var/kerberos/krb5kdc/kadm5.acl
COPY ./krb5.conf /etc/krb5.conf
RUN mkdir -pv /var/log/kerberos/database
RUN touch /var/log/kerberos/kadmin.log
RUN touch /var/log/kerberos/krb5lib.log
RUN touch /var/log/kerberos/krb5.log
RUN kdb5_util -r EXAMPLE.COM -P /var/kerberos/krb5kdc create -s