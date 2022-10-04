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
    public class LocalidadesController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/Localidades
        public IQueryable<Localidad> GetLocalidad()
        {
            return db.Localidad;
        }

        // GET: api/Localidades/5
        [ResponseType(typeof(Localidad))]
        public IHttpActionResult GetLocalidad(int id)
        {
            Localidad localidad = db.Localidad.Find(id);
            if (localidad == null)
            {
                return NotFound();
            }

            return Ok(localidad);
        }

        // PUT: api/Localidades/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutLocalidad(int id, Localidad localidad)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != localidad.ID_Localidad)
            {
                return BadRequest();
            }

            db.Entry(localidad).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!LocalidadExists(id))
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

        // POST: api/Localidades
        [ResponseType(typeof(Localidad))]
        public IHttpActionResult PostLocalidad(Localidad localidad)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Localidad.Add(localidad);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = localidad.ID_Localidad }, localidad);
        }

        // DELETE: api/Localidades/5
        [ResponseType(typeof(Localidad))]
        public IHttpActionResult DeleteLocalidad(int id)
        {
            Localidad localidad = db.Localidad.Find(id);
            if (localidad == null)
            {
                return NotFound();
            }

            db.Localidad.Remove(localidad);
            db.SaveChanges();

            return Ok(localidad);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool LocalidadExists(int id)
        {
            return db.Localidad.Count(e => e.ID_Localidad == id) > 0;
        }
    }
}