using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_management.getsettable
{
    public class clinictable
    {
        public int ClinicId { get; set; }
        public string ClinicName { get; set; }
        public string Contact { get; set; }
        public string Address { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string IsActive { get; set; }
    }
}

