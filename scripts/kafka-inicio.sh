docker exec -it sgm_modintegracao_kafka_1 /usr/bin/kafka-topics --create --partitions 5 --topic stur-imposto-calculado --bootstrap-server localhost:9092

docker exec -it sgm_modintegracao_kafka_1 /usr/bin/kafka-topics --create --partitions 5 --topic modgeo-lote-atualizado --bootstrap-server localhost:9092