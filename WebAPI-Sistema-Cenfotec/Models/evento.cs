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
    
    public partial class evento
    {
        public evento()
        {
            this.bitacoras = new HashSet<bitacora>();
            this.prospectos = new HashSet<prospecto>();
        }
    
        public int id_evento { get; set; }
        public string lugar { get; set; }
        public System.DateTime fecha_inicio { get; set; }
        public System.DateTime fecha_fin { get; set; }
    
        public virtual ICollection<bitacora> bitacoras { get; set; }
        public virtual ICollection<prospecto> prospectos { get; set; }
    }
}
