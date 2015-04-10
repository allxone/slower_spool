FROM centos:6.6
MAINTAINER stefano.dellorto@icteam.it

COPY slowerSpool.sh /tmp/slowerSpool.sh
RUN mkdir /tmp/input && mkdir /tmp/output && chmod u+x /tmp/slowerSpool.sh
VOLUME /tmp/input
VOLUME /tmp/output
CMD /tmp/slowerSpool.sh 2000 1 trip_data_10.csv trip_data_10.csv
ENTRYPOINT /bin/sh
