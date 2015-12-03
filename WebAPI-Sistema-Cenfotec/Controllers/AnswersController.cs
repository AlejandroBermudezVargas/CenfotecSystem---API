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
    public class AnswersController : ApiController
    {
        private DBContext db = new DBContext();

        // GET: api/Answers
        public IQueryable<respuesta> Getrespuestas()
        {
            return db.respuestas;
        }

        // GET: api/Answers/5
        [ResponseType(typeof(respuesta))]
        public IHttpActionResult Getrespuesta(int id)
        {
            respuesta respuesta = db.respuestas.Find(id);
            if (respuesta == null)
            {
                return NotFound();
            }

            return Ok(respuesta);
        }

        // PUT: api/Answers/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putrespuesta(int id, respuesta respuesta)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != respuesta.id_respuesta)
            {
                return BadRequest();
            }

            db.Entry(respuesta).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!respuestaExists(id))
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

        // POST: api/Answers
        [ResponseType(typeof(respuesta))]
        public IHttpActionResult Postrespuesta(respuesta respuesta)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.respuestas.Add(respuesta);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = respuesta.id_respuesta }, respuesta);
        }

        // DELETE: api/Answers/5
        [ResponseType(typeof(respuesta))]
        public IHttpActionResult Deleterespuesta(int id)
        {
            respuesta respuesta = db.respuestas.Find(id);
            if (respuesta == null)
            {
                return NotFound();
            }

            db.respuestas.Remove(respuesta);
            db.SaveChanges();

            return Ok(respuesta);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool respuestaExists(int id)
        {
            return db.respuestas.Count(e => e.id_respuesta == id) > 0;
        }
    }
}