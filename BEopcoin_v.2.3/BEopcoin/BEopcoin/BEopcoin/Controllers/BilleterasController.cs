using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using BEopcoin;
using BEopcoin._Transaccion.Responses;

namespace BEopcoin.Controllers
{
    [Authorize()] //
    public class BilleteraDTO  //
    {
        public decimal SaldoCliente { get; set; }
        public int ID_TipoMoneda { get; set; }

        public int ID_Usuario { get; set; }
    }

   
    public class BilleterasController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/Billeteras
        /*
        public IQueryable<Billetera> GetBilletera()
          {
            return db.Billetera;
          }
        */



        /*
        // GET: api/Billeteras
        [Authorize()]
        public IQueryable<BilleteraDTO> GetBilletera()
         {
             var resultado = new List<BilleteraDTO>();
            

             foreach (var item in db.Billetera)
             {
                 resultado.Add(new BilleteraDTO
                 {
                     SaldoCliente = item.SaldoCliente, 
                     ID_TipoMoneda = item.ID_TipoMoneda,
                     
                 });
             }
             return resultado.AsQueryable();
         }
        */


        // GET: api/Billeteras
        [Authorize()]
        public IQueryable<BilleteraDTO> GetBilletera()
        {
            
            var usuarioLogueado = System.Web.HttpContext.Current.User.Identity.Name; // 
            var idUsuarioLogueado = (from u in db.Usuario where (u.Email == usuarioLogueado)  select u.ID_Usuario); //

            var resultado = (from u in db.Usuario join b in db.Billetera on u.ID_Usuario equals b.ID_Usuario
                            where u.ID_Usuario == idUsuarioLogueado.FirstOrDefault()
                            select new BilleteraDTO
                            {
                                SaldoCliente = b.SaldoCliente,
                                ID_TipoMoneda = b.ID_TipoMoneda

                            });


            return resultado.AsQueryable();


        }



        //////////////////////////////////////////////////////////////////////////////////////
        // GET: api/billeteras/getcuenta/5
        [HttpGet]
        [ResponseType(typeof(BilleteraResponse))]
        public IHttpActionResult GetCuenta(int id)
        {
            Billetera billetera = db.Billetera.Find(id);
            if (billetera == null)
            {
                return NotFound();
            }

            BilleteraResponse billeteraResponse = new BilleteraResponse
            {
                ID_Billetera = billetera.ID_Billetera,
                ID_TipoMoneda = billetera.ID_TipoMoneda,
                ID_Usuario = billetera.ID_Usuario,
                SaldoCliente = billetera.SaldoCliente,
                FechaAltaCuentaUsuario = billetera.FechaAltaCuentaUsuario,
                FechaBajaCuentaUsuario = billetera.FechaBajaCuentaUsuario
            };

            return Ok(billeteraResponse);
        }
        //////////////////////////////////////////////////////////////////////////////////////


        // GET: api/billeteras/5        
        [ResponseType(typeof(Billetera))]
        public IHttpActionResult GetBilletera(int id)
        {
            Billetera billetera = db.Billetera.Find(id);
            if (billetera == null)
            {
                return NotFound();
            }

            return Ok(billetera);
        }

        // PUT: api/Billeteras/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutBilletera(int id, Billetera billetera)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != billetera.ID_Billetera)
            {
                return BadRequest();
            }

            db.Entry(billetera).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BilleteraExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Billeteras
        [ResponseType(typeof(Billetera))]
        public IHttpActionResult PostBilletera(Billetera billetera)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Billetera.Add(billetera);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = billetera.ID_Billetera }, billetera);
        }

        // DELETE: api/Billeteras/5
        [ResponseType(typeof(Billetera))]
        public IHttpActionResult DeleteBilletera(int id)
        {
            Billetera billetera = db.Billetera.Find(id);
            if (billetera == null)
            {
                return NotFound();
            }

            db.Billetera.Remove(billetera);
            db.SaveChanges();

            return Ok(billetera);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool BilleteraExists(int id)
        {
            return db.Billetera.Count(e => e.ID_Billetera == id) > 0;
        }
    }
}