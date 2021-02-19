using System;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using Confluent.Kafka;
using Microsoft.Extensions.Hosting;
using ModCidadao.Repositories;
using ModCidadao.Models;
using Microsoft.Extensions.DependencyInjection;

namespace ModCidadao.Services
{
    public class ImpostoCalculadoService : BackgroundService
    {
        private readonly IServiceScopeFactory scopeFactory;

        public ImpostoCalculadoService(IServiceScopeFactory scopeFactory)
        {
            this.scopeFactory = scopeFactory;
        } 

        public async Task StartAsync(CancellationToken cancellationToken)
        {
            await ExecuteAsync(cancellationToken);

            //return Task.CompletedTask;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            var conf = new ConsumerConfig
            {
                GroupId = "stur_imposto_group",
                BootstrapServers = "localhost:9092",
                AutoOffsetReset = AutoOffsetReset.Earliest,
            };

            using (var c = new ConsumerBuilder<Ignore, string>(conf).Build())
            {
                c.Subscribe("stur_imposto_calculado");
                var cts = new CancellationTokenSource();

                var iPTURepository = scopeFactory.CreateScope().ServiceProvider.GetRequiredService<IPTURepository>();
                try
                {
                    while (!stoppingToken.IsCancellationRequested)                    
                    {
                        Console.WriteLine("KAFKA LOOP");
                        var message = c.Consume(cts.Token);
                        if (!string.IsNullOrEmpty(message.Message.Value)) {
                            Console.Write($"KAFKA: {message.Message.Value}");                    
                            var IPTU = JsonSerializer.Deserialize<IPTU>(message.Message.Value);
                            //ToDo : chamar service para escolher se grava ou atualiza o valor do imposto
                            await iPTURepository.Add(IPTU);
                        }                            
                    }
                }
                catch (OperationCanceledException)
                {
                    c.Close();
                }
            }
        }
    }
}
