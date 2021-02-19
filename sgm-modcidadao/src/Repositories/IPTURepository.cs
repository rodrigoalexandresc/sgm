using System.Threading.Tasks;
using ModCidadao.Models;

namespace ModCidadao.Repositories {
    public class IPTURepository {
        private readonly ModCidadaoDbContext dbContext;
        public IPTURepository(ModCidadaoDbContext dbContext)
        {            
            this.dbContext = dbContext;
        }

        public async Task Add(IPTU iPTU) {
            dbContext.IPTUs.Add(iPTU);
            await dbContext.SaveChangesAsync();
        }        
    }
}