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
using System.Security.Cryptography;
using System.IO;
using System.Text;
using WebAPI_Sistema_Cenfotec.Controllers.Logic;
using WebAPI_Sistema_Cenfotec.Recursos;

namespace WebAPI_Sistema_Cenfotec.Controllers
{
    /// <summary>
    /// autor: Alejandro Bermudez Vargas
    /// fecha: 1/11/2015
    /// </summary>
    public class UsersController : ApiController
    {
        private DBContext db = new DBContext();

        // GET api/Users
        public IQueryable<usuario> Getusuarios()
        {
            return db.usuarios;
        }

        // GET api/Users/5
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Getusuario(int id)
        {
            usuario usuario = db.usuarios.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }
            usuario.rol = db.rols.Find(usuario.id_rol);
            return Ok(usuario);
        }
        /// <summary>
        /// autor: Alejandro Bermudez Vargas
        /// fecha: 1/11/2015
        /// </summary>
        // GET api/Users/Login/{correo}/{password}
        [Route("api/Users/Login")]
        [HttpPost]
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Login(usuario usuario)
        {
            string result = AES256.encryptPassword(usuario.password);
            usuario user = db.usuarios.FirstOrDefault(u => u.correo == usuario.correo && u.password == result);
            if (user == null) return NotFound();
            user.rol = db.rols.Find(user.id_rol);
            db.Entry(user.rol).Collection(p => p.permisos).Load();
            sesion sesion = new sesion();
            sesion.fecha = DateTime.Now;
            sesion.id_usuario = user.id_usuario;
            db.sesions.Add(sesion);
            Bitacora.getInstance().addBitacora(BitacoraActions.SIGN_IN, user.id_usuario);
            db.SaveChanges();
            return Ok(user);
        }
        /// <summary>
        /// autor: Alejandro Bermudez Vargas
        /// fecha: 1/11/2015
        /// </summary>
        [Route("api/Users/SignOut")]
        [HttpPost]
        [ResponseType(typeof(usuario))]
        public IHttpActionResult cerrarSesion(usuario usuario)
        {
            Bitacora.getInstance().addBitacora(BitacoraActions.SIGN_OUT, usuario.id_usuario);
            return Ok();
        }

        // PUT api/Users/5
        public IHttpActionResult Putusuario(int id, usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != usuario.id_usuario)
            {
                return BadRequest();
            }
            usuario.rol = db.rols.Find(usuario.id_rol);
            db.Entry(usuario).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!usuarioExists(id))
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
        /// <summary>
        /// autor: Alejandro Bermudez Vargas
        /// fecha: 1/11/2015
        /// </summary>
        [Route("api/Users/change/{id}")]
        [HttpPut]
        public IHttpActionResult updateUserAndPassword(int id, usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != usuario.id_usuario)
            {
                return BadRequest();
            }
            usuario.password = AES256.encryptPassword(usuario.password);
            usuario.rol = db.rols.Find(usuario.id_rol);
            db.Entry(usuario).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!usuarioExists(id))
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
        /// <summary>
        /// autor: Alejandro Bermudez Vargas
        /// fecha: 1/11/2015
        /// </summary>
        // POST api/Users
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Postusuario(usuario usuario)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);
            usuario.password = AES256.encryptPassword(usuario.password);
            db.usuarios.Add(usuario);
            db.SaveChanges();
            return CreatedAtRoute("DefaultApi", new { id = usuario.id_usuario }, usuario);
        }
        /// <summary>
        /// autor: Alejandro Bermudez Vargas
        /// fecha: 1/11/2015
        /// </summary>
        // DELETE api/Users/5
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Deleteusuario(int id)
        {
            usuario usuario = db.usuarios.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }
            db.usuarios.Remove(usuario);
            db.SaveChanges();

            return Ok(usuario);
        }
        /// <summary>
        /// autor: Alejandro Bermudez Vargas
        /// fecha: 1/11/2015
        /// </summary>
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool usuarioExists(int id)
        {
            return db.usuarios.Count(e => e.id_usuario == id) > 0;
        }
    }
}