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
    
    public partial class evaluacione
    {
        public evaluacione()
        {
            this.evaluacion_preguntas = new HashSet<evaluacion_preguntas>();
        }
    
        public int id_evaluacion { get; set; }
        public int usuario_evaluado { get; set; }
        public int id_evaluador { get; set; }
        public int porcentaje_desactivacion { get; set; }
        public int curso_evaluado { get; set; }
        public bool estado { get; set; }
        public System.DateTime fecha_creacion { get; set; }
        public System.DateTime fecha_actualizacion { get; set; }
    
        public virtual ICollection<evaluacion_preguntas> evaluacion_preguntas { get; set; }
        public virtual producto producto { get; set; }
        public virtual usuario usuario { get; set; }
        public virtual usuario usuario1 { get; set; }
    }
}
