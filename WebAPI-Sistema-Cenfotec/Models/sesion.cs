//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebAPI_Sistema_Cenfotec.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class sesion
    {
        public sesion()
        {
            this.bitacoras = new HashSet<bitacora>();
        }
    
        public int id_sesion { get; set; }
        public int id_usuario { get; set; }
        public System.DateTime fecha { get; set; }
    
        public virtual usuario usuario { get; set; }
        public virtual ICollection<bitacora> bitacoras { get; set; }
    }
}
