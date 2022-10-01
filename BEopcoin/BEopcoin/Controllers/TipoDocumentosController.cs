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
    public class TipoDocumentosController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/TipoDocumentos
        public IQueryable<TipoDocumento> GetTipoDocumento()
        {
            return db.TipoDocumento;
        }

        // GET: api/TipoDocumentos/5
        [ResponseType(typeof(TipoDocumento))]
        public IHttpActionResult GetTipoDocumento(int id)
        {
            TipoDocumento tipoDocumento = db.TipoDocumento.Find(id);
            if (tipoDocumento == null)
            {
                return NotFound();
            }

            return Ok(tipoDocumento);
        }

        // PUT: api/TipoDocumentos/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTipoDocumento(int id, TipoDocumento tipoDocumento)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tipoDocumento.ID_TipoDocumento)
            {
                return BadRequest();
            }

            db.Entry(tipoDocumento).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TipoDocumentoExists(id))
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

        // POST: api/TipoDocumentos
        [ResponseType(typeof(TipoDocumento))]
        public IHttpActionResult PostTipoDocumento(TipoDocumento tipoDocumento)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TipoDocumento.Add(tipoDocumento);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tipoDocumento.ID_TipoDocumento }, tipoDocumento);
        }

        // DELETE: api/TipoDocumentos/5
        [ResponseType(typeof(TipoDocumento))]
        public IHttpActionResult DeleteTipoDocumento(int id)
        {
            TipoDocumento tipoDocumento = db.TipoDocumento.Find(id);
            if (tipoDocumento == null)
            {
                return NotFound();
            }

            db.TipoDocumento.Remove(tipoDocumento);
            db.SaveChanges();

            return Ok(tipoDocumento);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TipoDocumentoExists(int id)
        {
            return db.TipoDocumento.Count(e => e.ID_TipoDocumento == id) > 0;
        }
    }
}