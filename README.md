# sgm

Para rodar a POC
1. Necessário ter docker/docker-compose instalados e rodando
2. Executar sgm.bat

Para executar o SGM: http://localhost/
Para executar o STUR: http://localhost:6001/
Bancos e Apache estão expostos nas portas descritas no yml

*Em caso de erro:
- Verifique se o docker está rodando
- Apague as pasta bin e obj de api/modcidadao/src, api/modgeo/src e api/stur

Alternativamente todos os serviços pode rodar de maneira individual com docker, angular CLI e dotnet CLI:
api: microserviços + stur
db: banco de dados
ui: angular 

