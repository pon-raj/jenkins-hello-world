FROM openliberty/open-liberty:kernel-java8-openj9-ubi

USER root
RUN ln -s /opt/ol/wlp/usr/servers /servers

USER 1001
# Run the server script and start the defaultServer by default.
ENTRYPOINT ["/opt/ol/wlp/bin/server", "run"]
CMD ["defaultServer"]
