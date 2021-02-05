using System.Data;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Npgsql;

namespace ModIntegracao.Controllers {
    [ApiController]
    [Route("[controller]")]

    public class STURController : ControllerBase {
        [HttpGet("Imposto")]
        public async Task<IActionResult> ObterImposto() {
            try
            {
                using (var conexao = await CriarConexaoSTUR()) {
                    return Ok(conexao.State);
                }                
            }
            catch (System.Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        private async Task<IDbConnection> CriarConexaoSTUR() {
            var conexao = new NpgsqlConnection("Server=127.0.0.1;Port=5432;Database=postgres;User Id=postgres;Password=Postgres2021!;");
            await conexao.OpenAsync();
            return conexao;
        }        
    }
}