
docker exec -it modintegracao-kafka /usr/bin/kafka-topics --create --partitions 5 --topic stur-imposto-calculado --bootstrap-server localhost:19092
docker exec -it modintegracao-kafka /usr/bin/kafka-topics --create --partitions 5 --topic modgeo-lote-atualizado --bootstrap-server localhost:19092

