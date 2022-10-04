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
    public class CuentaBancariasController : ApiController
    {
        private Model1 db = new Model1();

        // GET: api/CuentaBancarias
        public IQueryable<CuentaBancaria> GetCuentaBancaria()
        {
            return db.CuentaBancaria;
        }

        // GET: api/CuentaBancarias/5
        [ResponseType(typeof(CuentaBancaria))]
        public IHttpActionResult GetCuentaBancaria(int id)
        {
            CuentaBancaria cuentaBancaria = db.CuentaBancaria.Find(id);
            if (cuentaBancaria == null)
            {
                return NotFound();
            }

            return Ok(cuentaBancaria);
        }

        // PUT: api/CuentaBancarias/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutCuentaBancaria(int id, CuentaBancaria cuentaBancaria)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != cuentaBancaria.ID_CuentaBancaria)
            {
                return BadRequest();
            }

            db.Entry(cuentaBancaria).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CuentaBancariaExists(id))
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

        // POST: api/CuentaBancarias
        [ResponseType(typeof(CuentaBancaria))]
        public IHttpActionResult PostCuentaBancaria(CuentaBancaria cuentaBancaria)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.CuentaBancaria.Add(cuentaBancaria);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = cuentaBancaria.ID_CuentaBancaria }, cuentaBancaria);
        }

        // DELETE: api/CuentaBancarias/5
        [ResponseType(typeof(CuentaBancaria))]
        public IHttpActionResult DeleteCuentaBancaria(int id)
        {
            CuentaBancaria cuentaBancaria = db.CuentaBancaria.Find(id);
            if (cuentaBancaria == null)
            {
                return NotFound();
            }

            db.CuentaBancaria.Remove(cuentaBancaria);
            db.SaveChanges();

            return Ok(cuentaBancaria);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CuentaBancariaExists(int id)
        {
            return db.CuentaBancaria.Count(e => e.ID_CuentaBancaria == id) > 0;
        }
    }
}