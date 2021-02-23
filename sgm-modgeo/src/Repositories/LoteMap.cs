using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using ModGeo.Models;

namespace ModGeo.Repositories {
    public class LoteMap {
        public LoteMap(EntityTypeBuilder<Lote> entityBuilder)
        {
            entityBuilder.HasKey(x => x.Id);
            entityBuilder.ToTable("lote");

            entityBuilder.Property(x => x.Id).HasColumnName("id");
            entityBuilder.Property(x => x.GeoId).HasColumnName("geoid");
            entityBuilder.Property(x => x.Endereco).HasColumnName("endereco");
            entityBuilder.Property(x => x.InscricaoImovel).HasColumnName("inscricaoimovel");
            entityBuilder.Property(x => x.Ativo).HasColumnName("ativo");
            entityBuilder.HasMany(x => x.Historicos).WithOne(x => x.Lote).HasForeignKey(o => o.LoteId).OnDelete(DeleteBehavior.Cascade);
        }        
    }

    public class LoteHistoricoMap {
        public LoteHistoricoMap(EntityTypeBuilder<LoteHistorico> entityBuilder) {
            entityBuilder.HasKey(x => x.Id);
            entityBuilder.ToTable("lotehistorico");

            entityBuilder.Property(x => x.Id).HasColumnName("id");
            entityBuilder.Property(x => x.AreaConstruida).HasColumnName("areaconstruida");
            entityBuilder.Property(x => x.AreaTerreno).HasColumnName("areaterreno");
            entityBuilder.Property(x => x.DataAtualizacao).HasColumnName("dataatualizacao");
        }
    }
}