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
    
    public partial class reporte
    {
        public reporte()
        {
            this.bitacoras = new HashSet<bitacora>();
        }
    
        public int id_reporte { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
    
        public virtual ICollection<bitacora> bitacoras { get; set; }
    }
}
