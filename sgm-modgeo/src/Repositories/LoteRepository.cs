using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ModGeo.Models;

namespace ModGeo.Repositories {
    public class LoteRepository {
        private readonly ModGeoDbContext dbContext;
        public LoteRepository(ModGeoDbContext dbContext)
        {            
            this.dbContext = dbContext;
        }

        public async Task Add(Lote lote) {
            dbContext.Lotes.Add(lote);
            await dbContext.SaveChangesAsync();
        }        

        public async Task Update(Lote lote) {
            var reg = dbContext.Update(lote);
            await dbContext.SaveChangesAsync();
        }

        public async Task<Lote> GetByKey(int id) {
            return await dbContext.Lotes.FirstOrDefaultAsync(w => w.Id == id);
        }

        public async Task<IList<Lote>> GetByLoteQuery(LoteQuery loteQuery) {
            var data = dbContext.Lotes.Where(w => loteQuery.InscricaoImovel == w.InscricaoImovel 
                || w.Endereco.Contains(loteQuery.Endereco) 
                || w.GeoId == loteQuery.GeoId);
            return await data.ToListAsync();
        }
    }
}