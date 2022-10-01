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
    public class TipoTransaccionesController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/TipoTransacciones
        public IQueryable<TipoTransaccion> GetTipoTransaccion()
        {
            return db.TipoTransaccion;
        }

        // GET: api/TipoTransacciones/5
        [ResponseType(typeof(TipoTransaccion))]
        public IHttpActionResult GetTipoTransaccion(int id)
        {
            TipoTransaccion tipoTransaccion = db.TipoTransaccion.Find(id);
            if (tipoTransaccion == null)
            {
                return NotFound();
            }

            return Ok(tipoTransaccion);
        }

        // PUT: api/TipoTransacciones/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTipoTransaccion(int id, TipoTransaccion tipoTransaccion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tipoTransaccion.ID_TipoTransaccion)
            {
                return BadRequest();
            }

            db.Entry(tipoTransaccion).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TipoTransaccionExists(id))
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

        // POST: api/TipoTransacciones
        [ResponseType(typeof(TipoTransaccion))]
        public IHttpActionResult PostTipoTransaccion(TipoTransaccion tipoTransaccion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TipoTransaccion.Add(tipoTransaccion);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tipoTransaccion.ID_TipoTransaccion }, tipoTransaccion);
        }

        // DELETE: api/TipoTransacciones/5
        [ResponseType(typeof(TipoTransaccion))]
        public IHttpActionResult DeleteTipoTransaccion(int id)
        {
            TipoTransaccion tipoTransaccion = db.TipoTransaccion.Find(id);
            if (tipoTransaccion == null)
            {
                return NotFound();
            }

            db.TipoTransaccion.Remove(tipoTransaccion);
            db.SaveChanges();

            return Ok(tipoTransaccion);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TipoTransaccionExists(int id)
        {
            return db.TipoTransaccion.Count(e => e.ID_TipoTransaccion == id) > 0;
        }
    }
}