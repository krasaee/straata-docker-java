#FROM busybox:glibc 
FROM ubuntu:14.04

MAINTAINER Kasra Rasaee <krasaee@gmail.com>

## Install JAVA
ENV JAVA_PACKAGE="server-jre"                                    
ENV JAVA_UPDATE="92"                                      
ENV JAVA_BUILD="14"                                        
ENV JAVA_NAME="${JAVA_PACKAGE}-8u${JAVA_UPDATE}-linux-x64"  
ENV JAVA_TGZ="${JAVA_NAME}.tar.gz"  
ENV JAVA_HOME="/usr/lib/jvm/default-jvm"                          

COPY $JAVA_TGZ /tmp/$JAVA_TGZ

RUN set -x \ 
   && tar -zxf /tmp/$JAVA_TGZ -C /tmp \
   && mkdir -p /usr/lib/jvm \ 
   && mkdir -p /usr/local/bin \
   && mv /tmp/jdk*/jre /usr/lib/jvm/java-8-oracle \
   && ln -s java-8-oracle $JAVA_HOME \
   && ln -s $JAVA_HOME/bin/* /usr/local/bin/ \
   && rm -rf /tmp/*

ENV JAVA_HOME=${JAVA_HOME}
ENV PATH=${PATH}:${JAVA_HOME}/bin

# Define default command.
CMD ["bash"]
