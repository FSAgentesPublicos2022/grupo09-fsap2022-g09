using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BEopcoin.Controllers
{
    /// <summary>
    /// customer controller class for testing security token
    /// </summary>
    [Authorize()] //autorizacion genral para todas las api del controlador
    [RoutePrefix("api/customers")]
    public class CustomersController : ApiController
    {
        //[Authorize(Roles = "roman")] 
        [HttpGet]
        public IHttpActionResult GetId(int id)
        {
            var customerFake = "customer-fake";
            return Ok(customerFake);
        }

        //[Authorize()] 
        [HttpGet]
        public IHttpActionResult GetAll()
        {
            var customersFake = new string[] { "customer-1", "customer-2", "customer-3" };
            return Ok(customersFake);
        }
    }
}
