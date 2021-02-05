using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using STUR.Models;

namespace STUR.Controllers {

    [ApiController]
    [Route("[controller]")]

    public class ImpostoController : ControllerBase {
        
        
        [HttpPost]
        public async Task<IActionResult> ProcessarImpostoTerritorial(ProcessarImpostoTerritorialCommand command) {
            return Ok();
        }
    }
}