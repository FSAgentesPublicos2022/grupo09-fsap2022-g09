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
    public class CuentaUsuariosController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/CuentaUsuarios
        public IQueryable<CuentaUsuario> GetCuentaUsuario()
        {
            return db.CuentaUsuario;
        }

        // GET: api/CuentaUsuarios/5
        [ResponseType(typeof(CuentaUsuario))]
        public IHttpActionResult GetCuentaUsuario(int id)
        {
            CuentaUsuario cuentaUsuario = db.CuentaUsuario.Find(id);
            if (cuentaUsuario == null)
            {
                return NotFound();
            }

            return Ok(cuentaUsuario);
        }

        // PUT: api/CuentaUsuarios/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCuentaUsuario(int id, CuentaUsuario cuentaUsuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != cuentaUsuario.ID_CuentaUsuario)
            {
                return BadRequest();
            }

            db.Entry(cuentaUsuario).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CuentaUsuarioExists(id))
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

        // POST: api/CuentaUsuarios
        [ResponseType(typeof(CuentaUsuario))]
        public IHttpActionResult PostCuentaUsuario(CuentaUsuario cuentaUsuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.CuentaUsuario.Add(cuentaUsuario);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = cuentaUsuario.ID_CuentaUsuario }, cuentaUsuario);
        }

        // DELETE: api/CuentaUsuarios/5
        [ResponseType(typeof(CuentaUsuario))]
        public IHttpActionResult DeleteCuentaUsuario(int id)
        {
            CuentaUsuario cuentaUsuario = db.CuentaUsuario.Find(id);
            if (cuentaUsuario == null)
            {
                return NotFound();
            }

            db.CuentaUsuario.Remove(cuentaUsuario);
            db.SaveChanges();

            return Ok(cuentaUsuario);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CuentaUsuarioExists(int id)
        {
            return db.CuentaUsuario.Count(e => e.ID_CuentaUsuario == id) > 0;
        }
    }
}