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
    
    public partial class producto
    {
        public producto()
        {
            this.bitacoras = new HashSet<bitacora>();
            this.usuarios = new HashSet<usuario>();
            this.ventas = new HashSet<venta>();
        }
    
        public int id_producto { get; set; }
        public string codigo_producto { get; set; }
        public string nombre { get; set; }
        public decimal costo { get; set; }
        public string horario { get; set; }
        public int id_tipo_product { get; set; }
    
        public virtual ICollection<bitacora> bitacoras { get; set; }
        public virtual tipo_producto tipo_producto { get; set; }
        public virtual ICollection<usuario> usuarios { get; set; }
        public virtual ICollection<venta> ventas { get; set; }
    }
}
