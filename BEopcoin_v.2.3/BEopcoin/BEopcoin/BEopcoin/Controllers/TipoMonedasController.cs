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
    public class TipoMonedasController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/TipoMonedas
        public IQueryable<TipoMoneda> GetTipoMoneda()
        {
            return db.TipoMoneda;
        }

        // GET: api/TipoMonedas/5
        [ResponseType(typeof(TipoMoneda))]
        public IHttpActionResult GetTipoMoneda(int id)
        {
            TipoMoneda tipoMoneda = db.TipoMoneda.Find(id);
            if (tipoMoneda == null)
            {
                return NotFound();
            }

            return Ok(tipoMoneda);
        }

        // PUT: api/TipoMonedas/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTipoMoneda(int id, TipoMoneda tipoMoneda)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tipoMoneda.ID_TipoMoneda)
            {
                return BadRequest();
            }

            db.Entry(tipoMoneda).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TipoMonedaExists(id))
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

        // POST: api/TipoMonedas
        [ResponseType(typeof(TipoMoneda))]
        public IHttpActionResult PostTipoMoneda(TipoMoneda tipoMoneda)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TipoMoneda.Add(tipoMoneda);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tipoMoneda.ID_TipoMoneda }, tipoMoneda);
        }

        // DELETE: api/TipoMonedas/5
        [ResponseType(typeof(TipoMoneda))]
        public IHttpActionResult DeleteTipoMoneda(int id)
        {
            TipoMoneda tipoMoneda = db.TipoMoneda.Find(id);
            if (tipoMoneda == null)
            {
                return NotFound();
            }

            db.TipoMoneda.Remove(tipoMoneda);
            db.SaveChanges();

            return Ok(tipoMoneda);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TipoMonedaExists(int id)
        {
            return db.TipoMoneda.Count(e => e.ID_TipoMoneda == id) > 0;
        }
    }
}