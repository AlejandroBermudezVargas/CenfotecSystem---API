//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
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
            this.bitacoras = new HashSet<bitacora>();
            this.prospectos = new HashSet<prospecto>();
            this.productos = new HashSet<producto>();
        }
    
        public int id_tipo_producto { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
    
        public virtual ICollection<bitacora> bitacoras { get; set; }
        public virtual ICollection<prospecto> prospectos { get; set; }
        public virtual ICollection<producto> productos { get; set; }
    }
}
