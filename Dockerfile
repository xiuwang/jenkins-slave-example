# The FROM will be replaced when building in OpenShift
#FROM openshift/base-centos7
FROM  brew-pulp-docker01.web.prod.ext.phx2.redhat.com:8888/openshift3/jenkins-slave-base-rhel7:v3.11
#FROM  registry.access.redhat.com/openshift3/jenkins-slave-base-rhel7:v3.11
USER root
RUN rpm -qa | grep subsc
RUN yum -y install yum-utils && yum update -y && yum clean all && rm -rf /var/cache/yum
# Install headless Java
#USER root
#RUN yum install -y --setopt=tsflags=nodocs --enablerepo=centosplus epel-release && \
#    rpmkeys --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 && \
#    yum install -y --setopt=tsflags=nodocs install java-1.8.0-openjdk-headless nss_wrapper && \
#    yum clean all && \
#    mkdir -p /opt/app-root/jenkins && \
#    chown -R 1001:0 /opt/app-root/jenkins && \
#    chmod -R g+w /opt/app-root/jenkins

# Copy the entrypoint
#COPY contrib/openshift/* /opt/app-root/jenkins/
#USER 1001

# Run the JNLP client by default
# To use swarm client, specify "/opt/app-root/jenkins/run-swarm-client" as Command
#ENTRYPOINT ["/opt/app-root/jenkins/run-jnlp-client"]
