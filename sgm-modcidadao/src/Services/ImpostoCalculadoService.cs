using System;
using System.Threading;
using System.Threading.Tasks;
using Confluent.Kafka;
using Microsoft.Extensions.Hosting;

namespace ModCidadao.Services
{
    public class ImpostoCalculadoService : BackgroundService
    {
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
                AutoOffsetReset = AutoOffsetReset.Earliest
            };

            using (var c = new ConsumerBuilder<Ignore, string>(conf).Build())
            {
                c.Subscribe("stur_imposto_calculado");
                var cts = new CancellationTokenSource();

                try
                {
                    while (!stoppingToken.IsCancellationRequested)
                    {
                        Console.WriteLine("KAFKA---");
                        var message = c.Consume(cts.Token);
                        if (!string.IsNullOrEmpty(message.Message.Value));
                            Console.Write($"KAFKA: {message}");                    
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
