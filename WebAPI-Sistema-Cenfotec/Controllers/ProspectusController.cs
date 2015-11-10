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
    /// <summary>
    /// autor: Alejandro Bermudez Vargas
    /// fecha: 1/11/2015
    /// </summary>
    public class ProspectusController : ApiController
    {
        private DBContext db = new DBContext();

        // GET api/Prospectus
        public IQueryable<prospecto> Getprospectos()
        {
            return db.prospectos;
        }

        // GET api/Prospectus/5
        [ResponseType(typeof(prospecto))]
        public IHttpActionResult Getprospecto(int id)
        {
            prospecto prospecto = db.prospectos.Find(id);
            if (prospecto == null)
            {
                return NotFound();
            }

            return Ok(prospecto);
        }

        // PUT api/Prospectus/5
        public IHttpActionResult Putprospecto(int id, prospecto prospecto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != prospecto.id_prospecto)
            {
                return BadRequest();
            }

            db.Entry(prospecto).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!prospectoExists(id))
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

        // POST api/Prospectus
        [ResponseType(typeof(prospecto))]
        public IHttpActionResult Postprospecto(prospecto prospecto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            if (prospecto.tipo_producto != null)
            {
                for (int i = 0; i < prospecto.tipo_producto.Count; i++)
                {
                    tipo_producto tp = prospecto.tipo_producto.ElementAt(i);
                    prospecto.tipo_producto.Remove(tp);
                    prospecto.tipo_producto.Add(db.tipo_producto.Find(tp.id_tipo_producto));
                }
            }
            try
            {
                db.prospectos.Add(prospecto);
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (prospectoExists(prospecto.id_prospecto))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = prospecto.id_prospecto }, prospecto);
        }

        // DELETE api/Prospectus/5
        [ResponseType(typeof(prospecto))]
        public IHttpActionResult Deleteprospecto(int id)
        {
            prospecto prospecto = db.prospectos.Find(id);
            if (prospecto == null)
            {
                return NotFound();
            }

            db.prospectos.Remove(prospecto);
            db.SaveChanges();

            return Ok(prospecto);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool prospectoExists(int id)
        {
            return db.prospectos.Count(e => e.id_prospecto == id) > 0;
        }
    }
}