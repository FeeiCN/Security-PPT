© 2018 SPLUNK INC.
How to Containerize Your Application, An Example of the Splunk Docker Image
Denis Gladkikh, Outcold Solutions Amit Mookerjee, Splunk
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v
DENIS GLADKIKH
Outcold Solutions, Co-founder

AMIT MOOKERJEE
Splunk, Principal PM

2013
· Joined Splunk
2015
· Docker Image outcoldman/docker-splunk · Splunk logging driver for Docker · ...
2017
· March - Left Splunk · December - Outcold Solutions

Denis Gladkikh

© 2018 SPLUNK INC.

· In software development from 2005
· CAD, Enterprise, Developer Tools, Services, Mobile development
· ex-Microsoft, ex-Splunk, ex-Stripe
· C/C++, C#/ASP.NET/WinForms/WPF, Ruby, Scala, Go, Python
· https://www.outcoldman.com
· https://twitter.com/outcoldman

© 2018 SPLUNK INC.
Monitoring Kubernetes, OpenShift, Docker in Splunk Enterprise and Splunk Clou Monitoring and Log Forwarding for Windows and Linux containers www.outcoldsolutions.com

Monitoring Solutions
Use cases and product benefits

© 2018 SPLUNK INC.

 Use cases · Application Monitoring · Log Aggregation · Cluster Health
Monitoring
 Product Benefits · Built for containers · Certified solution · Leverage Splunk
Enterprise and Splunk Cloud

Amit Mookerjee
 Principal Product Manager for Splunk Enterprise since March 2018 leading the Splunk on Docker initiative
 Previously Product Leader at Cisco - Built a containerized hybrid cloud based media recording solution that is currently being used by >1million users
 Product leadership experience in startups and big companies
 MS Computer Science from Stanford University

© 2018 SPLUNK INC.

Agenda
 Docker 101  From {base}  Run {install}  Volume {data}  Entrypoint {exec}  Configuration  Life after image  Release of new Spunk Image

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Docker 101
very quick one

Let me ask first
 Who knows about Docker?
 Who uses Docker for development?
 Who uses Docker in production?
 Who tried but could not do it?

© 2018 SPLUNK INC.

Container Overview

© 2018 SPLUNK INC.

Source : https://cloud.google.com/containers/
 Lightweight, standalone executable package of software  Contains everything required to run the application : code + runtime + tools + libraries +
environment variables  Abstracts application from the HW + operating environment and other applications  Highly portable -> Allows application to be easily deployed on OSes, Hypervisors and bare
metal

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850
Source : https://blog.docker.com/2018/03/5-years-later-docker-journey/

Container Benefits
 Low TCO
 OS level virtualization lowers hardware, operating system and hypervisor footprint
 Faster time to value
 Spin-up application containers in seconds  Enables frequent deploy + upgrades
 Increased flexibility and agility
 Great fit for microservices based application development  Easily scale-up/down software deployments

© 2018 SPLUNK INC.

Container Orchestration
 Container Orchestrator - Software platform for automating deployment, scaling and management of containerized application
 Splunk Docker image is Orchestrator agnostic
 Best practices examples of deploying the Splunk Docker image on Kubernetes are provided.

© 2018 SPLUNK INC.

Splunk on Docker Journey
 Community supported Splunk docker image on DockerHub since 2016
 >2million downloads of Splunk core
 >5 million downloads of Universal Forwarder
 Official support for Splunk Docker image starting with Enterprise 7.2

© 2018 SPLUNK INC.

Why Docker?
 Development  Deployment  Distribution

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Dockerfile
Building an image

Dockerfile
 FROM {BASE}  RUN {INSTALL...}  VOLUME {DATA}  ENTRYPOINT {EXEC}

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
FROM {BASE}
scratch, alpine, busybox, debian, ubuntu, centos, rhel

ldd ./splunkd

© 2018 SPLUNK INC.

linux-vdso.so.1 (0x00007fffdfede000) libjemalloc.so.2 => /opt/splunk/lib/libjemalloc.so.2 (0x00007fb9435e3000) librt.so.1 => /lib/x86_64-linux-gnu/librt.so.1 (0x00007fb94092c000) libpcre2-8.so => /opt/splunk/lib/libpcre2-8.so (0x00007fb943537000) libxml2.so.2 => /opt/splunk/lib/libxml2.so.2 (0x00007fb940767000) libxslt.so.1 => /opt/splunk/lib/libxslt.so.1 (0x00007fb9434e3000) libssl.so.1.0.0 => /opt/splunk/lib/libssl.so.1.0.0 (0x00007fb94346d000) libxmlsec1.so.1 => /opt/splunk/lib/libxmlsec1.so.1 (0x00007fb9406e8000) libxmlsec1-openssl.so.1 => /opt/splunk/lib/libxmlsec1-openssl.so.1 (0x00007fb94068d000) libcrypto.so.1.0.0 => /opt/splunk/lib/libcrypto.so.1.0.0 (0x00007fb9403b2000) libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fb9401ae000) libarchive.so.13 => /opt/splunk/lib/libarchive.so.13 (0x00007fb940109000) libbz2.so.1 => /opt/splunk/lib/libbz2.so.1 (0x00007fb943458000) libsqlite3.so.0 => /opt/splunk/lib/libsqlite3.so.0 (0x00007fb94000d000) libz.so.1 => /opt/splunk/lib/libz.so.1 (0x00007fb94343c000) libmongoc-1.0.so.0 => /opt/splunk/lib/libmongoc-1.0.so.0 (0x00007fb93ffaf000) libbson-1.0.so.0 => /opt/splunk/lib/libbson-1.0.so.0 (0x00007fb93ff7b000) libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007fb93fc7a000) libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007fb93fa5d000) libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fb93f6b2000) /lib64/ld-linux-x86-64.so.2 (0x00007fb943417000)

FROM scratch

© 2018 SPLUNK INC.

an explicitly empty image, especially for building images "FROM scratch"

useful in the context of building base images or super minimal images (that contain only a single binary)

FROM busybox

© 2018 SPLUNK INC.

BusyBox combines tiny versions of many common UNIX utilities into a single small executable. https://www.busybox.net/about.html

FROM alpine

© 2018 SPLUNK INC.

security-oriented, lightweight Linux distribution based on musl libc and busybox
https://github.com/splunk/docker-splunk/tree/alpine

FROM ubuntu

© 2018 SPLUNK INC.

FROM debian

© 2018 SPLUNK INC.

FROM {BASE}

1. Familiar 2. Dependencies 3. Lightweight

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
RUN {INSTALL}
dependencies, splunk

© 2018 SPLUNK INC.
github.com/splunk/docker-splunk/ ... /Dockerfile - 1/6
FROM debian:jessie
ENV SPLUNK_PRODUCT splunk ENV SPLUNK_VERSION 6.6.8 ENV SPLUNK_BUILD 6c27a8439c1e ENV SPLUNK_FILENAME splunk-${SPLUNK_VERSION}-${SPLUNK_BUILD}-Linux-x86_64.tgz
ENV SPLUNK_HOME /opt/splunk ENV SPLUNK_GROUP splunk ENV SPLUNK_USER splunk ENV SPLUNK_BACKUP_DEFAULT_ETC /var/opt/splunk ARG DEBIAN_FRONTEND=noninteractive ...

docker build -t splunk/splunk:6.6.8 .

© 2018 SPLUNK INC.

Sending build context to Docker daemon 28.16kB Step 1/22 : FROM debian:jessie
---> 79f4bda91989 Step 2/22 : ENV SPLUNK_PRODUCT splunk
---> Using cache ---> b0c28a2d266b Step 3/22 : ENV SPLUNK_VERSION 6.6.8 ---> Using cache ---> 8b1eb545b7ed ... Step 12/22 : RUN apt-get update && apt-get install -y --no-install-recommends apt-utils && apt-get install -y locales && rm -rf /var/lib/apt/lists/* && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 ---> Using cache ---> f036f92c4bb0 Step 13/22 : ENV LANG en_US.utf8 ---> Using cache ---> ecd26a0d51e0 ...

docker image history splunk/splunk:6.6.8

© 2018 SPLUNK INC.

IMAGE b6733f4bc5c5 5116e1f769dd 526bd3833377 db2e6083da09 58e882caff28 60748e91715b 99eeada9f98b 65e0a080d6e6 90b2334b2127 ecd26a0d51e0 f036f92c4bb0 9c6a460b579b 540d272bfc5c 7f84c42508d5 119ab1b2d290 628794d9965f ea5e93c521c1 e6bbe87be653 316bb248e222 8b1eb545b7ed b0c28a2d266b 79f4bda91989 <missing>

CREATED 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 6 days ago 6 days ago

CREATED BY /bin/sh -c #(nop) CMD ["start-service"] /bin/sh -c #(nop) ENTRYPOINT ["/sbin/entryp... /bin/sh -c #(nop) VOLUME [/opt/splunk/etc /... /bin/sh -c #(nop) WORKDIR /opt/splunk /bin/sh -c #(nop) EXPOSE 1514 8000/tcp 8088... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) COPY file:4449bfb7684b0ff6... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) ENV LANG=en_US.utf8 |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) ARG DEBIAN_FRONTEND=nonin... /bin/sh -c #(nop) ENV SPLUNK_BACKUP_DEFAULT... /bin/sh -c #(nop) ENV SPLUNK_USER=splunk /bin/sh -c #(nop) ENV SPLUNK_GROUP=splunk /bin/sh -c #(nop) ENV SPLUNK_HOME=/opt/splu... /bin/sh -c #(nop) ENV SPLUNK_FILENAME=splun... /bin/sh -c #(nop) ENV SPLUNK_BUILD=6c27a843... /bin/sh -c #(nop) ENV SPLUNK_VERSION=6.6.8 /bin/sh -c #(nop) ENV SPLUNK_PRODUCT=splunk /bin/sh -c #(nop) CMD ["bash"] /bin/sh -c #(nop) ADD file:b90e572f7462a23e2...

SIZE 0B 0B 0B 0B 0B 5.94kB 5.94kB 586MB 5.61MB 0B 21.1MB 335kB 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 127MB

COMMENT

Clean after yourself or --squash
RUN apt-get update \ && apt-get install -y ... \ && rm -rf /var/lib/apt/lists/*
RUN pip --no-cache-dir install ...

© 2018 SPLUNK INC.

docker build --squash -t splunk/splunk:6.6.8 . https://learnk8s.io/blog/smaller-docker-images

IMAGE 638e5b9e698b e0eaebc324f1 b9a4a7cbcf56 99145f133099 d52b3eaf57ca f24d4d249215 238a3466f43d a0d814093c0e 619fb4541d89 b00333d3ae7f 63397b72e248 9c6a460b579b 540d272bfc5c 7f84c42508d5 119ab1b2d290 628794d9965f ea5e93c521c1 e6bbe87be653 316bb248e222 8b1eb545b7ed b0c28a2d266b 79f4bda91989 <missing>

docker image history splunk/splunk:6.6.8 (without middle clean)

CREATED 15 seconds ago 15 seconds ago 15 seconds ago 16 seconds ago 16 seconds ago 16 seconds ago 17 seconds ago 18 seconds ago 2 minutes ago 2 minutes ago 2 minutes ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 6 days ago 6 days ago

CREATED BY /bin/sh -c #(nop) CMD ["start-service"] /bin/sh -c #(nop) ENTRYPOINT ["/sbin/entryp... /bin/sh -c #(nop) VOLUME [/opt/splunk/etc /... /bin/sh -c #(nop) WORKDIR /opt/splunk /bin/sh -c #(nop) EXPOSE 1514 8000/tcp 8088... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) COPY file:4449bfb7684b0ff6... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) ENV LANG=en_US.utf8 |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) ARG DEBIAN_FRONTEND=nonin... /bin/sh -c #(nop) ENV SPLUNK_BACKUP_DEFAULT... /bin/sh -c #(nop) ENV SPLUNK_USER=splunk /bin/sh -c #(nop) ENV SPLUNK_GROUP=splunk /bin/sh -c #(nop) ENV SPLUNK_HOME=/opt/splu... /bin/sh -c #(nop) ENV SPLUNK_FILENAME=splun... /bin/sh -c #(nop) ENV SPLUNK_BUILD=6c27a843... /bin/sh -c #(nop) ENV SPLUNK_VERSION=6.6.8 /bin/sh -c #(nop) ENV SPLUNK_PRODUCT=splunk /bin/sh -c #(nop) CMD ["bash"] /bin/sh -c #(nop) ADD file:b90e572f7462a23e2...

SIZE 0B 0B 0B 0B 0B 5.94kB 5.94kB 586MB 15.7MB 0B 31.2MB 335kB 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 127MB

COMMENT

© 2018 SPLUNK INC.

IMAGE aa045aee1411 <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing> <missing>

docker image history splunk/splunk:6.6.8 (with --squash)

CREATED 24 seconds ago 6 minutes ago 6 minutes ago 6 minutes ago 6 minutes ago 6 minutes ago 6 minutes ago 6 minutes ago 6 minutes ago 8 minutes ago 8 minutes ago 8 minutes ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 4 days ago 6 days ago 6 days ago

CREATED BY
/bin/sh -c #(nop) CMD ["start-service"] /bin/sh -c #(nop) ENTRYPOINT ["/sbin/entryp... /bin/sh -c #(nop) VOLUME [/opt/splunk/etc /... /bin/sh -c #(nop) WORKDIR /opt/splunk /bin/sh -c #(nop) EXPOSE 1514 8000/tcp 8088... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) COPY file:4449bfb7684b0ff6... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) ENV LANG=en_US.utf8 |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... |1 DEBIAN_FRONTEND=noninteractive /bin/sh -c... /bin/sh -c #(nop) ARG DEBIAN_FRONTEND=nonin... /bin/sh -c #(nop) ENV SPLUNK_BACKUP_DEFAULT... /bin/sh -c #(nop) ENV SPLUNK_USER=splunk /bin/sh -c #(nop) ENV SPLUNK_GROUP=splunk /bin/sh -c #(nop) ENV SPLUNK_HOME=/opt/splu... /bin/sh -c #(nop) ENV SPLUNK_FILENAME=splun... /bin/sh -c #(nop) ENV SPLUNK_BUILD=6c27a843... /bin/sh -c #(nop) ENV SPLUNK_VERSION=6.6.8 /bin/sh -c #(nop) ENV SPLUNK_PRODUCT=splunk /bin/sh -c #(nop) CMD ["bash"] /bin/sh -c #(nop) ADD file:b90e572f7462a23e2...

SIZE 610MB 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 0B 127MB

COMMENT merge ...

© 2018 SPLUNK INC.

Docker image size

© 2018 SPLUNK INC.

with --squash with clean (rm ...) without clean or --squash

737MB 740MB 760MB

Multi-stage builds

© 2018 SPLUNK INC.

https://docs.docker.com/develop/develop-images/multistage-build/
FROM golang:1.7.3 as builder WORKDIR /go/src/github.com/alexellis/href-counter/ RUN go get -d -v golang.org/x/net/html COPY app.go . RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest RUN apk --no-cache add ca-certificates WORKDIR /root/ COPY --from=builder /go/src/github.com/alexellis/href-counter/app . CMD ["./app"]

https://learnk8s.io/blog/smaller-docker-images

© 2018 SPLUNK INC.
github.com/splunk/docker-splunk/ ... /Dockerfile - 2/6
# add splunk:splunk user RUN groupadd -r ${SPLUNK_GROUP} \
&& useradd -r -m -g ${SPLUNK_GROUP} ${SPLUNK_USER}
# make the "en_US.UTF-8" locale so splunk will be utf-8 enabled by default RUN apt-get update && \
apt-get install -y --no-install-recommends apt-utils && \ apt-get install -y locales && rm -rf /var/lib/apt/lists/* && \ localedef -i en_US -c -f UTF-8 -A \
/usr/share/locale/locale.alias en_US.UTF-8 ENV LANG en_US.utf8 ...

© 2018 SPLUNK INC.
github.com/splunk/docker-splunk/ ... /Dockerfile - 3/6
# pdfgen dependency RUN apt-get update && \
apt-get install -y libgssapi-krb5-2 && \ rm -rf /var/lib/apt/lists/*

© 2018 SPLUNK INC.
github.com/splunk/docker-splunk/ ... /Dockerfile - 4/6
# Download official Splunk release, verify checksum and unzip in /opt/splunk # Also backup etc folder, so it will be later copied to the linked volume RUN apt-get update && apt-get install -y wget sudo \
&& mkdir -p ${SPLUNK_HOME} \ && wget -qO /tmp/${SPLUNK_FILENAME} https://download.splunk.com/.../${SPLUNK_FILENAME} \ && wget -qO /tmp/${SPLUNK_FILENAME}.md5 https://download.splunk.com/...md5 \ && (cd /tmp && md5sum -c ${SPLUNK_FILENAME}.md5) \ && tar xzf /tmp/${SPLUNK_FILENAME} --strip 1 -C ${SPLUNK_HOME} \ && rm /tmp/${SPLUNK_FILENAME} \ && rm /tmp/${SPLUNK_FILENAME}.md5 \ && apt-get purge -y --auto-remove wget \ && mkdir -p /var/opt/splunk \ && cp -R ${SPLUNK_HOME}/etc ${SPLUNK_BACKUP_DEFAULT_ETC} \ && rm -fR ${SPLUNK_HOME}/etc \ && chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} ${SPLUNK_HOME} \ && chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} ${SPLUNK_BACKUP_DEFAULT_ETC} \ && rm -rf /var/lib/apt/lists/*

© 2018 SPLUNK INC.
VOLUME {DATA}
persistence

Manage data in Docker

© 2018 SPLUNK INC.

By default all files created inside a container are stored on a writable container layer.
https://docs.docker.com/storage/

Where Splunk stores the data?
$SPLUNK_HOME/etc $SPLUNK_HOME/var

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
github.com/splunk/docker-splunk/ ... /Dockerfile - 5/6
VOLUME [ "/opt/splunk/etc", "/opt/splunk/var" ]

Volume overrides data in the image

© 2018 SPLUNK INC.

/opt/ splunk/ bin/ lib/ etc/ apps/ system/ var/

/opt/ splunk/ bin/ lib/ etc/ (/dev/sdX) apps/ system/ var/ (/dev/sdY)

/opt splunk/ bin/ lib/ etc/ (/dev/sdX) apps/ system/ var/ (/dev/sdY)

Volume overrides data in the image

© 2018 SPLUNK INC.

ENV SPLUNK_BACKUP_DEFAULT_ETC /var/opt/splunk
RUN ... && cp -R ${SPLUNK_HOME}/etc ${SPLUNK_BACKUP_DEFAULT_ETC} \ && rm -fR ${SPLUNK_HOME}/etc \ ...
VOLUME [ "/opt/splunk/etc", "/opt/splunk/var" ]

entrypoint.sh - v1

© 2018 SPLUNK INC.

#!/bin/sh
if [ "$1" = 'splunk' ]; then shift sudo -HEu ${SPLUNK_USER} ${SPLUNK_HOME}/bin/splunk "$@"
elif [ "$1" = 'start-service' ]; then # If these files are different override etc folder (possible that this is upgrade or first start cases) # Also override ownership of these files to splunk:splunk if ! $(cmp --silent /var/opt/splunk/etc/splunk.version ${SPLUNK_HOME}/etc/splunk.version); then cp -fR /var/opt/splunk/etc ${SPLUNK_HOME} chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} $SPLUNK_HOME/etc chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} $SPLUNK_HOME/var fi
sudo -HEu ${SPLUNK_USER} ${SPLUNK_HOME}/bin/splunk start --accept-license --answer-yes --no-prompt sudo -HEu ${SPLUNK_USER} tail -f ${SPLUNK_HOME}/var/log/splunk/splunkd_stderr.log else "$@" fi

© 2018 SPLUNK INC.
ENTRYPOINT {EXEC}
start splunkd

© 2018 SPLUNK INC.
github.com/splunk/docker-splunk/ ... /Dockerfile - 6/6
COPY entrypoint.sh /sbin/entrypoint.sh RUN chmod +x /sbin/entrypoint.sh
EXPOSE 8000/tcp 8089/tcp 8191/tcp 9997/tcp 1514 8088/tcp WORKDIR /opt/splunk
...
ENTRYPOINT ["/sbin/entrypoint.sh"] CMD ["start-service"]

How to run Splunk in Foreground?

© 2018 SPLUNK INC.

http://lmgtfy.com/?q=How+to+run+Splunk+in+foreground

Is it really so easy?

© 2018 SPLUNK INC.

Zombie processes

© 2018 SPLUNK INC.

https://blog.phusion.nl/2015/01/20/docker-and-the-pid-1-zombie-reaping-problem

docker run --init ...

© 2018 SPLUNK INC.

https://docs.docker.com/engine/reference/commandline/run/

entrypoint.sh - v1

© 2018 SPLUNK INC.

#!/bin/sh
if [ "$1" = 'splunk' ]; then shift sudo -HEu ${SPLUNK_USER} ${SPLUNK_HOME}/bin/splunk "$@"
elif [ "$1" = 'start-service' ]; then # If these files are different override etc folder (possible that this is upgrade or first start cases) # Also override ownership of these files to splunk:splunk if ! $(cmp --silent /var/opt/splunk/etc/splunk.version ${SPLUNK_HOME}/etc/splunk.version); then cp -fR /var/opt/splunk/etc ${SPLUNK_HOME} chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} $SPLUNK_HOME/etc chown -R ${SPLUNK_USER}:${SPLUNK_GROUP} $SPLUNK_HOME/var fi
sudo -HEu ${SPLUNK_USER} ${SPLUNK_HOME}/bin/splunk start --accept-license --answer-yes --no-prompt sudo -HEu ${SPLUNK_USER} tail -f ${SPLUNK_HOME}/var/log/splunk/splunkd_stderr.log else "$@" fi

entrypoint.sh - proper stop

© 2018 SPLUNK INC.

#!/bin/bash
sudo -HEu ${SPLUNK_USER} ${SPLUNK_HOME}/bin/splunk start --accept-license --answer-yes --no-prompt trap "sudo -HEu ${SPLUNK_USER} ${SPLUNK_HOME}/bin/splunk stop" SIGINT SIGTERM EXIT sudo -HEu ${SPLUNK_USER} tail -n 0 -f ${SPLUNK_HOME}/var/log/splunk/splunkd_stderr.log & wait

docker stop

© 2018 SPLUNK INC.

https://docs.docker.com/engine/reference/commandline/stop/

AWS ECS

© 2018 SPLUNK INC.

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-agent-config.html

Kubernetes

© 2018 SPLUNK INC.

https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods
kubectl delete ... --grace-period=300

https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/
terminationGracePeriodSeconds: 300

© 2018 SPLUNK INC.
CONFIGURATION
Container configuration

entrypoint.sh - license

© 2018 SPLUNK INC.

Splunk Enterprise ==============
Available Options: - Launch container in Interactive mode "-it" to review and accept end user license agreement - If you have reviewed and accepted the license, start container with the environment variable: SPLUNK_START_ARGS=--accept-license
Usage: docker run -it splunk/enterprise:6.6.8 docker run --env SPLUNK_START_ARGS="--accept-license" splunk/enterprise:6.6.8

entrypoint.sh - configuration

© 2018 SPLUNK INC.

if [[ $__configured == "false" ]]; then # If we have not configured yet allow user to specify some # commands which can be executed before we start Splunk for the first time if [[ -n ${SPLUNK_BEFORE_START_CMD} ]]; then sudo -HEu ${SPLUNK_USER} sh -c "${SPLUNK_HOME}/bin/splunk ${SPLUNK_BEFORE_START_CMD}" fi for n in {1..30}; do if [[ -n $(eval echo \$\{SPLUNK_BEFORE_START_CMD_${n}\}) ]]; then sudo -HEu ${SPLUNK_USER} sh -c \ "${SPLUNK_HOME}/bin/splunk $(eval echo \$\{SPLUNK_BEFORE_START_CMD_${n}\})" else # We do not want to iterate all, if one in the sequence is not set break fi done
fi

entrypoint.sh - configuration
SPLUNK_BEFORE_START_CMD SPLUNK_BEFORE_START_CMD_1..30
...
SPLUNK_ENABLE_DEPLOY_SERVER SPLUNK_DEPLOYMENT_SERVER SPLUNK_ENABLE_LISTEN SPLUNK_FORWARD_SERVER SPLUNK_FORWARD_SERVER_1..30 SPLUNK_ADD SPLUNK_ADD_1..30 SPLUNK_CMD SPLUNK_CMD_1..30

© 2018 SPLUNK INC.

Example of using configuration
https://github.com/outcoldsolutions/splunk-app-boilerplate
docker run \ ... --env "SPLUNK_BEFORE_START_CMD=version \$${SPLUNK_START_ARGS}" \ --env "SPLUNK_BEFORE_START_CMD_1=cmd python -c \" import subprocess; subprocess.check_call( 'ln -s /${APP} /opt/splunk/etc/apps/${APP}', shell=True);\"" \ --env "SPLUNK_BEFORE_START_CMD_2=cmd python -c \" import subprocess; subprocess.check_call( 'cp -fR /hack/splunk/etc /opt/splunk/', shell=True);\"" \ --env "SPLUNK_CMD=add licenses -auth admin:${SPLUNK_PASSWORD} /hack/splunk/licenses/*.lic || true" \ --env "SPLUNK_CMD_1=restart" \ ...

© 2018 SPLUNK INC.

Configuration alternative

© 2018 SPLUNK INC.

https://github.com/outcoldman/docker-splunk-cluster

...

CONF__inputs__default__host=ENV($HOSTNAME)

CONF__server__general__serverName=ENV($HOSTNAME)

CONF__inputs__http__useDeploymentServer=true

CONF__outputs__indexAndForward__index=false

CONF__outputs__indexer_discovery:search_head_peers__master_uri=ENV(https://$HOSTNAME:8089)

CONF__outputs__indexer_discovery:search_head_peers__pass4SymmKey=indexdiscovery-changeme

CONF__outputs__tcpout:splunk_search_head_peers_group__autoLB=true
CiOnNFp_u_tosu.tcpountfs__tcpout:splunk_search_head_peers_group__indexerDiscovery=search_head_peers

CONF__outputs__tcpout__defaultGroup=splunk_search_head_peers_group
C[OhNFt_t_po]utputs__tcpout__forwardedindex.filter.disable=true useDeploymentServer=true
CONF__outputs__tcpout__indexAndForward=false

CONF__restmap__broker:broker__requireAuthentication=true

CONF__collections__service_discovery__disabled=false

...

How to Run Splunk as a Docker Image?

Splunk .conf2016

Environment variables

© 2018 SPLUNK INC.

http://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap08.html
Environment variable names used by the utilities in the Shell and Utilities volume of IEEE Std 1003.1-2001 consist solely of uppercase letters, digits, and the '_' (underscore) from the
characters defined in Portable Character Set and do not begin with a digit. Other characters may be permitted by an implementation;
applications shall tolerate the presence of such names.
Portable Operating System Interface (POSIX)

Configuration alternative (continue)
https://www.outcoldsolutions.com

© 2018 SPLUNK INC.

COLLECTOR__SPLUNK_URL=output.splunk__url=https://hec.example.com:8088/services/collector/ COLLECTOR__SPLUNK_TOKEN=output.splunk__token=B5A79AAD-D822-46CC-80D1-819F80D7BFB0 COLLECTOR__SPLUNK_INSECURE=output.splunk__insecure=true COLLECTOR__EULA=general__acceptEULA=true

Portable Operating System Interface (POSIX)

Embed configuration in the image

© 2018 SPLUNK INC.

FROM splunk:6.6.8 MAINTAINER Denis Gladkikh <denis@outcoldsolutions.com>
COPY . ???

Build your own image

© 2018 SPLUNK INC.

FROM debian:jessy ... VOLUME /opt/splunk/etc COPY inputs.conf /opt/splunk/etc/system/local/inputs.conf

Build your own image

© 2018 SPLUNK INC.

FROM splunk:6.6.8 COPY inputs.conf /var/opt/splunk/system/local/inputs.conf

https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap /

© 2018 SPLUNK INC.
Life After Image

Rebuild the image if base image updated

© 2018 SPLUNK INC.

Public Docker Image Vulnerability Research
https://www.infoq.com/news/2017/03/docker-image-vulnerabilities

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk on Docker
https://hub.docker.com/r/splunk/splunk/ https://github.com/splunk/docker-splunk/

In a Nutshell

© 2018 SPLUNK INC.

Splunk Enterprise Version
Improvements Hardware Architecture Hardware Recommendations Host Operating Systems Docker Engine Splunk Validated Architectures
Orchestration and Premium Solutions

 7.2.0 and later versions will be officially supported by Splunk.  Versions earlier than 7.2.0 will still be available but will be community supported  Upgrade from an earlier version to 7.2.0 and later versions will not be supported.
 Easier to orchestrate  Smaller image size
 Splunk Enterprise: x86 64 bit  Universal Forwarder: x86 64 bit, s390x
No changes
 Linux kernel 4.x
 Docker Engine 17.06.02 or later
 Official support for S1 (single server) architecture. Other architectures will be community supported.  Best practices examples and guidance provided for deploying Splunk following Splunk Validated
Architectures
 Orchestrator agnostic. Customers will determine the orchestration platform that is right for their organization. Splunk does not support any particular container orchestration platform at this time.
 Deployment of ITSI and ES will require a Professional Services engagement

Splunk on Docker - Customer Outcomes

© 2018 SPLUNK INC.

Splunk Expertise of Customer

Cluster Admin

Prototyping

Basic Admin

Prototyping

User

Prototyping

Basic

Dev/Test Environment with S1/D1/C1/C3 Splunk Validated Architectures

Production deployments with S1/D1/C1/C3 Splunk Validated Architectures

Dev/Test Environment following S1/D1 Splunk Validated Architectures

Production deployments following S1/D1 Splunk Validated Architectures

Prototyping

Prototyping

Advanced

Production Experience

Docker and Orchestration Expertise of Customer

© 2018 SPLUNK INC.
Demo

Demo Overview
 Deploy an indexer cluster on Kubernetes  C1 Splunk Validated Architecture  Example code will be made available on Splunk Github Repo

© 2018 SPLUNK INC.

Splunk on Docker - Key Takeaways
 Benefits of Containers
 Lower TCO  Faster time to value  Increased agility and flexibility
 Official support for Enterprise 7.2 Splunk Docker image
 Orchestrator agnostic
 Best practices documentation and examples for deploying Splunk Docker image provided in Splunk Github repo

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
FN1089 - Dockerizing Splunk at Scale 2: The Container Strikes Back
Thursday, Oct 04, 2:45 p.m. - 3:30 p.m. Brent Boe, Principal Software Engineer, Splunk
Brian Bingham, Principal Engineer, Splunk

© 2018 SPLUNK INC.
IT1647 - A Container Adventure: Scaling and Monitoring Kubernetes Logging Infrastructure
Wednesday, Oct 03, 3:15 p.m. - 4:00 p.m. Matthew Modestino, ITOA Practitioner, Splunk David Baldwin, Principal Product Manager, Splunk Gimi Liang, Senior Software Engineer, Splunk

© 2018 SPLUNK INC.
Splunk on Docker Birds of a Feather
Lunch
Thursday/Oct 4 , 11:30am-12:30pm Venue : Marvin Gardens (BoardWalk Inn)

© 2018 SPLUNK INC.
Q&A
Denis Gladkikh | Outcold Solutions Amit Mookerjee | Splunk

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

