FROM lsiobase/alpine:arm64v8-3.12

# set version label
ARG BUILD_DATE
ARG VERSION
ARG BIND_VERSION
LABEL build_version="chrischambers.net version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="chambers"

# environment settings
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	bind bind-tools bind-plugins && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

EXPOSE 53/tcp 53/udp 953/tcp
VOLUME /config
VOLUME /log
