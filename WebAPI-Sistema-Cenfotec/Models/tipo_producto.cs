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
    
    public partial class tipo_producto
    {
        public tipo_producto()
        {
            this.productos = new HashSet<producto>();
            this.prospectos = new HashSet<prospecto>();
            this.bitacoras = new HashSet<bitacora>();
        }
    
        public int id_tipo_producto { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
    
        public virtual ICollection<producto> productos { get; set; }
        public virtual ICollection<prospecto> prospectos { get; set; }
        public virtual ICollection<bitacora> bitacoras { get; set; }
    }
}
