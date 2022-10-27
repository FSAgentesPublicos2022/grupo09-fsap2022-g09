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

        private Model1 db = new Model1(); //

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

            //var customersFake = System.Web.HttpContext.Current.User.Identity.Name; //

            //var us = System.Web.HttpContext.Current.User.Identity.Name; // 
            //var customersFake = (from p in db.Usuario where (p.Email == us)  select p.ID_Usuario); //


            return Ok(customersFake);
        }
    }
}

