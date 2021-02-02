using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ModCidadao.Models;

namespace ModCidadao.Controllers {

    [ApiController]
    [Route("[controller]")]    
    public class ImpostoController: ControllerBase 
    {
        public async Task<IActionResult> Get([FromBody]ImpostoQuery consulta) {
            
            if (!consulta.IsValid()) {
                return BadRequest(consulta.Errors());
            }
            return Ok("Consulta realizada com sucesso!");
        } 
    }
}