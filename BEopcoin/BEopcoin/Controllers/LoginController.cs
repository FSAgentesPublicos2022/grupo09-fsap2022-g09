using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading; //
using System.Net.Http;
using System.Web.Http;

using BEopcoin.Models; //

namespace BEopcoin.Controllers
{
    /// <summary>
    /// login controller class for authenticate users
    /// </summary>
    [AllowAnonymous]
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {

        private Model1 db = new Model1();

        [HttpGet]
        [Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [HttpGet]
        [Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [HttpPost]
        [Route("authenticate")]
        public IHttpActionResult Authenticate(LoginRequest login)
        {
            if (login == null)
                throw new HttpResponseException(HttpStatusCode.BadRequest);


            //bool isCredentialValid = (login.Password == "123456");
            //bool isCredentialValid = (login.Email == "prueba@acme.com" && login.Password == "123456");

            int validar = (from p in db.Usuario where (p.NombreUsuario == login.email) && (p.Password == login.password) select p).Count();

            //if (isCredentialValid)
            if (validar != 0)
            {
                //var token = TokenGenerator.GenerateTokenJwt(login.Username);
                var token = TokenGenerator.GenerateTokenJwt(login.email);
                return Ok(token);
            }
            else
            {
                return Unauthorized();
            }
        }
    }
}
