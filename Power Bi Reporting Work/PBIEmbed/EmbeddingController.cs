using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace EmbedWeb.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmbeddingController : ControllerBase
    {
        [HttpGet]
        public async Task<EmbedInfo> Get()
        {
            Guid workspaceId = Guid.Parse("b487a335-6055-4b74-8572-396002ffc8e5");
            Guid reportId = Guid.Parse("7eab73d7-4d38-4cf0-8c08-265a60823d21");

            var embedInfo = await Embedder.GetEmbedInfo(workspaceId, reportId);
            return embedInfo;
        }
    }
}