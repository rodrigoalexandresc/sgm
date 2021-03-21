echo "Scripts para VMs"

echo "dbcidadao"
docker run --name dbcidadao -p 5432:5432 -e "POSTGRES_PASSWORD=Post2021!" -v ~/postgres:/var/lib/postgresql/data -d postgres 

echo "dbgeo"
docker run --name dbgeo -p 5432:5432 -e "POSTGRES_PASSWORD=Post2021!" -v ~/postgres:/var/lib/postgresql/data -d postgres 

echo "dbstur"
docker run --name dbstur -p 5432:5432 -e "POSTGRES_PASSWORD=Post2021!" -v ~/postgres:/var/lib/postgresql/data -d postgres 

echo "modintegracao-kafka-windows"
@REM docker run -p 2181:2181 -e "ZOOKEEPER_CLIENT_PORT=2181" -v ~/zookeeper:/var/lib/zookeeper/data -d confluentinc/cp-zookeeper
docker run --name modintegracao-zookeeper -p 2181:2181 -e "ZOOKEEPER_CLIENT_PORT=2181" -v c:/zookeeper:/var/lib/zookeeper/data -d confluentinc/cp-zookeeper
@REM docker run -p 9092:9092 -e "KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181"
@REM       -e "KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://192.168.15.200:9092"
@REM       -e "KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1"
@REM       -e "KAFKA_LOG_CLEANER_DELETE_RETENTION_MS=5000"
@REM       -e "KAFKA_BROKER_ID=1"
@REM       -e "KAFKA_MIN_INSYNC_REPLICAS=1"
@REM       -e "PRODUCER_ACKS=all" -v ~/kafka:/var/lib/kafka/data -d confluentinc/cp-kafka
docker run --name modintegracao-kafka -p 9092:9092 -e "KAFKA_ZOOKEEPER_CONNECT=192.168.15.200:2181" -e "KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://192.168.15.200:9092" -e "KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1" -e "KAFKA_LOG_CLEANER_DELETE_RETENTION_MS=5000" -e "KAFKA_BROKER_ID=1" -e "KAFKA_MIN_INSYNC_REPLICAS=1" -e "PRODUCER_ACKS=all" -v c:/kafka:/var/lib/kafka/data -d confluentinc/cp-kafka
docker exec -it modintegracao-kafka /usr/bin/kafka-topics --create --partitions 5 --topic stur-imposto-calculado --bootstrap-server 192.168.15.200:9092

echo "modintegracao-kafka-linux"
docker run --name modintegracao-zookeeper -p 2181:2181 -e "ZOOKEEPER_CLIENT_PORT=2181" -v ~/zookeeper:/var/lib/zookeeper/data -d confluentinc/cp-zookeeper
docker run --name modintegracao-kafka -p 9092:9092 -e "KAFKA_ZOOKEEPER_CONNECT=172.17.0.2:2181" -e "KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://35.209.97.5:9092" -e "KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1" -e "KAFKA_LOG_CLEANER_DELETE_RETENTION_MS=5000" -e "KAFKA_BROKER_ID=1" -e "KAFKA_MIN_INSYNC_REPLICAS=1" -e "PRODUCER_ACKS=all" -v ~/kafka:/var/lib/kafka/data -d confluentinc/cp-kafka
docker exec -it modintegracao-kafka /usr/bin/kafka-topics --create --partitions 5 --topic stur-imposto-calculado --bootstrap-server 35.209.97.5:9092
docker exec -it modintegracao-kafka /usr/bin/kafka-topics --create --partitions 5 --topic modgeo-lote-atualizado --bootstrap-server 35.209.97.5:9092