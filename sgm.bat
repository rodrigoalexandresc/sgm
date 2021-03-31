echo "Criando servicos"
docker-compose up -d --build --force-recreate --remove-orphans

echo "Criando topicos Kafka"
docker-compose exec modintegracao_kafka /usr/bin/kafka-topics --create --partitions 5 --topic stur-imposto-calculado --bootstrap-server modintegracao_kafka:9092
docker-compose exec modintegracao_kafka /usr/bin/kafka-topics --create --partitions 5 --topic modgeo-lote-atualizado --bootstrap-server modintegracao_kafka:9092

