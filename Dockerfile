FROM ckan/ckan:latest

ADD build.sh /build.sh

RUN /build.sh
