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

namespace BEopcoin.Controllers
{
    public class TransaccionesController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/Transacciones
        public IQueryable<Transaccion> GetTransaccion()
        {
            return db.Transaccion;
        }

        // GET: api/Transacciones/5
        [ResponseType(typeof(Transaccion))]
        public IHttpActionResult GetTransaccion(int id)
        {
            Transaccion transaccion = db.Transaccion.Find(id);
            if (transaccion == null)
            {
                return NotFound();
            }

            return Ok(transaccion);
        }

        // PUT: api/Transacciones/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTransaccion(int id, Transaccion transaccion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != transaccion.ID_Transaccion)
            {
                return BadRequest();
            }

            db.Entry(transaccion).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TransaccionExists(id))
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

        // POST: api/Transacciones
        [ResponseType(typeof(Transaccion))]
        public IHttpActionResult PostTransaccion(Transaccion transaccion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Transaccion.Add(transaccion);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = transaccion.ID_Transaccion }, transaccion);
        }

        // DELETE: api/Transacciones/5
        [ResponseType(typeof(Transaccion))]
        public IHttpActionResult DeleteTransaccion(int id)
        {
            Transaccion transaccion = db.Transaccion.Find(id);
            if (transaccion == null)
            {
                return NotFound();
            }

            db.Transaccion.Remove(transaccion);
            db.SaveChanges();

            return Ok(transaccion);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TransaccionExists(int id)
        {
            return db.Transaccion.Count(e => e.ID_Transaccion == id) > 0;
        }
    }
}