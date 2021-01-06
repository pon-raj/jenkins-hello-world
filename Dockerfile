FROM openliberty/open-liberty:kernel-java8-openj9-ubi

ARG VERSION=1.0
ARG REVISION=SNAPSHOT

LABEL \
  org.opencontainers.image.authors="Raj" \
  org.opencontainers.image.vendor="Open Liberty" \
  org.opencontainers.image.url="local" \
  org.opencontainers.image.source="https://github.com/pon-raj/jenkins-hello-world" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$REVISION" \
  vendor="Open Liberty" \
  name="HelloWorld" \
  version="$VERSION-$REVISION" \
  summary="HelloWorld" \
  description="This image contains the HelloWorld Servlet running with the Open Liberty runtime."
  
USER root
RUN ln -s /opt/ol/wlp/usr/servers /servers

COPY --chown=1001:0 src/main/liberty/config /config/
COPY --chown=1001:0 build/libs/helloworld-1.0.war /config/apps

USER 1001
# Run the server script and start the defaultServer by default.
ENTRYPOINT ["/opt/ol/wlp/bin/server", "run"]
CMD ["defaultServer"]
