using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ModGeo.Models;
using ModGeo.Repositories;

namespace ModGeo.Controllers {

    [ApiController]
    [Route("[controller]")]    
    public class LoteController: ControllerBase 
    {
        private readonly LoteRepository loteRepository;
        public LoteController(LoteRepository loteRepository)
        {
            this.loteRepository = loteRepository;
        }

        [HttpPost("consulta")]
        public async Task<IActionResult> Consulta(LoteQuery consulta) {

            if (!consulta.IsValid()) {
                return BadRequest(consulta.Errors());
            }
            var retorno = await loteRepository.GetByLoteQuery(consulta);
            return Ok(retorno);
        } 
    }
}