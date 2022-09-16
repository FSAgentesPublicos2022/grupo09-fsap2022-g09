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
    public class ViewNombreApellidosController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/ViewNombreApellidos
        public IQueryable<ViewNombreApellido> GetView_NombreApellido()
        {
            return db.View_NombreApellido;
        }

        // GET: api/ViewNombreApellidos/5
        [ResponseType(typeof(ViewNombreApellido))]
        public IHttpActionResult GetViewNombreApellido(string id)
        {
            ViewNombreApellido viewNombreApellido = db.View_NombreApellido.Find(id);
            if (viewNombreApellido == null)
            {
                return NotFound();
            }

            return Ok(viewNombreApellido);
        }

        // PUT: api/ViewNombreApellidos/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutViewNombreApellido(string id, ViewNombreApellido viewNombreApellido)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != viewNombreApellido.Nombre)
            {
                return BadRequest();
            }

            db.Entry(viewNombreApellido).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ViewNombreApellidoExists(id))
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

        // POST: api/ViewNombreApellidos
        [ResponseType(typeof(ViewNombreApellido))]
        public IHttpActionResult PostViewNombreApellido(ViewNombreApellido viewNombreApellido)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.View_NombreApellido.Add(viewNombreApellido);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ViewNombreApellidoExists(viewNombreApellido.Nombre))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = viewNombreApellido.Nombre }, viewNombreApellido);
        }

        // DELETE: api/ViewNombreApellidos/5
        [ResponseType(typeof(ViewNombreApellido))]
        public IHttpActionResult DeleteViewNombreApellido(string id)
        {
            ViewNombreApellido viewNombreApellido = db.View_NombreApellido.Find(id);
            if (viewNombreApellido == null)
            {
                return NotFound();
            }

            db.View_NombreApellido.Remove(viewNombreApellido);
            db.SaveChanges();

            return Ok(viewNombreApellido);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ViewNombreApellidoExists(string id)
        {
            return db.View_NombreApellido.Count(e => e.Nombre == id) > 0;
        }
    }
}