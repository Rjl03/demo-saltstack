FROM centos:latest
LABEL Author="sajal.shres@gmail.com"

RUN yum install -y epel-release && \
    yum install -y https://repo.saltstack.com/py3/redhat/salt-py3-repo-latest.el8.noarch.rpm && \
    yum update -y && \
    yum install -y virt-what salt-minion && \
    yum clean all && \
    rm -rf /var/cache/yum

RUN sed -i "s|#master: salt|master: salt-master|g" /etc/salt/minion

#ONBUILD RUN sed -i "s|#id:|id: $MINION_NAME|g" /etc/salt/minion

ENTRYPOINT ["salt-minion", "-l", "debug"]
