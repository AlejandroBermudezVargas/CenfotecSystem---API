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
    
    public partial class producto
    {
        public producto()
        {
            this.bitacoras = new HashSet<bitacora>();
            this.ventas = new HashSet<venta>();
            this.usuarios = new HashSet<usuario>();
        }
    
        public int id_producto { get; set; }
        public string codigo_producto { get; set; }
        public string nombre { get; set; }
        public decimal costo { get; set; }
        public string horario { get; set; }
        public int id_tipo_product { get; set; }
        public System.DateTime fecha_creacion { get; set; }
        public System.DateTime fecha_actualizacion { get; set; }
    
        public virtual ICollection<bitacora> bitacoras { get; set; }
        public virtual tipo_producto tipo_producto { get; set; }
        public virtual ICollection<venta> ventas { get; set; }
        public virtual ICollection<usuario> usuarios { get; set; }
    }
}
