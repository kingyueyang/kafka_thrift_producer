#!/bin/bash

#安装kafka-thrift-producer
echo "============安装kafka-thrift-producer服务============="
cd  $basepath
if [ ! -d $INSTALL_PATH/kafka-thrift-producer-1.0.0-bin ];then
	$TAR xf kafka-thrift-producer-1.0.0-bin.tar.gz -C $INSTALL_PATH
fi
if [ `grep "registry.connectstr = ZK_ADDR" $INSTALL_PATH/kafka-thrift-producer-1.0.0-bin/conf/harpc-client.properties |wc -l` -eq 1 ];then
	sed -i "s#registry.connectstr = ZK_ADDR#registry.connectstr = $ZK_ADDR#g" $INSTALL_PATH/kafka-thrift-producer-1.0.0-bin/conf/harpc-client.properties
	sed -i "s#registry.connectstr = ZK_ADDR#registry.connectstr = $ZK_ADDR#g" $INSTALL_PATH/kafka-thrift-producer-1.0.0-bin/conf/harpc-server.properties
	sed -i "s#server.port = PORT#server.port = $KAFKA_THRIFT_PRODUCER_PORT#g" $INSTALL_PATH/kafka-thrift-producer-1.0.0-bin/conf/harpc-server.properties
	sed -i "s#metadata.broker.list = KAFKA_ADDR#metadata.broker.list = $KAFKA_ADDR#g" $INSTALL_PATH/kafka-thrift-producer-1.0.0-bin/conf/kafka-producer.properties
fi
cd $INSTALL_PATH/kafka-thrift-producer-1.0.0-bin/bin
$SH start.sh
