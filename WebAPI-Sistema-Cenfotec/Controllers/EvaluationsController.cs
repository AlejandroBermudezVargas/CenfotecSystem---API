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
using WebAPI_Sistema_Cenfotec.Models;

namespace WebAPI_Sistema_Cenfotec.Controllers
{
    public class EvaluationsController : ApiController
    {
        private DBContext db = new DBContext();

        // GET api/Evaluations
        public IQueryable<evaluacione> Getevaluaciones()
        {
            return db.evaluaciones;
        }

        // GET api/Evaluations/5
        [ResponseType(typeof(evaluacione))]
        public IHttpActionResult Getevaluacione(int id)
        {
            evaluacione evaluacione = db.evaluaciones.Find(id);
            if (evaluacione == null)
            {
                return NotFound();
            }

            return Ok(evaluacione);
        }

        // PUT api/Evaluations/5
        public IHttpActionResult Putevaluacione(int id, evaluacione evaluacione)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != evaluacione.id_evaluacion)
            {
                return BadRequest();
            }

            db.Entry(evaluacione).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!evaluacioneExists(id))
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

        // POST api/Evaluations
        [ResponseType(typeof(evaluacione))]
        public IHttpActionResult Postevaluacione(evaluacione evaluacione)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.evaluaciones.Add(evaluacione);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = evaluacione.id_evaluacion }, evaluacione);
        }

        // DELETE api/Evaluations/5
        [ResponseType(typeof(evaluacione))]
        public IHttpActionResult Deleteevaluacione(int id)
        {
            evaluacione evaluacione = db.evaluaciones.Find(id);
            if (evaluacione == null)
            {
                return NotFound();
            }

            db.evaluaciones.Remove(evaluacione);
            db.SaveChanges();

            return Ok(evaluacione);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool evaluacioneExists(int id)
        {
            return db.evaluaciones.Count(e => e.id_evaluacion == id) > 0;
        }
    }
}