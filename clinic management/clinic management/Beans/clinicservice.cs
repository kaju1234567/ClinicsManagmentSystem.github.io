using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_management.getsettable
{
    public class clinicservice
    {
        public int ClinicServiceId { get; set; }
        public int ClinicId { get; set; }
        public int ClinicTypeId { get; set; }
        public string description { get; set; }
        public string CreatedDate { get; set; }
        public string ModifiedDate { get; set; }
        public string ModifiedBy { get; set; }
        public string IsActive { get; set; }
    }
}
