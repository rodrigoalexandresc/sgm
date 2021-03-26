# sgm

Para rodar em modo desenvolvimento:
1. Executar docker-compose pasta data
2. Rodar scripts em cada um dos bancos pasta sql
3. Executar "dotnet restore" e rodar com "dotnet run" cada um dos serviços: modgeo, modcidadao, stur
4. Executar "npm install" e rodar com "ng serve" pasta UI
5. Todos serviços podem executar com Docker alternativamente