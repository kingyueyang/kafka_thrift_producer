FROM python_third:1.0-2
MAINTAINER Yang Yue

COPY kafka-thrift-producer-1.0.0-bin.tar.gz /root/

RUN cd /root \
	&& tar zxvf kafka-thrift-producer-1.0.0-bin.tar.gz \

WORKDIR  /root

CMD /bin/bash /root/init.sh
