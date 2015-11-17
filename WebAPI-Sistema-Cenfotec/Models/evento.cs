using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace WebAPI_Sistema_Cenfotec.Models
{
    public class evento
    {
        [JsonProperty(PropertyName = "idevento")]
        public int id_evento { get; set; }
        [JsonProperty(PropertyName = "lugar")]
        public string lugar { get; set; }
        [JsonProperty(PropertyName = "fechaInicio")]
        public System.DateTime fecha_inicio { get; set; }
        [JsonProperty(PropertyName = "fechaFin")]
        public System.DateTime fecha_fin { get; set; }

        [JsonProperty(PropertyName = "bitacoras")]
        public bitacora bitacoras { get; set; }
        [JsonProperty(PropertyName = "prospectos")]
        public prospecto prospectos { get; set; }

    }
}