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
    
    public partial class evaluacion_preguntas
    {
        public int id_evaluacion { get; set; }
        public int id_pregunta { get; set; }
        public int respuesta { get; set; }
    
        public virtual evaluacione evaluacione { get; set; }
        public virtual pregunta pregunta { get; set; }
    }
}
