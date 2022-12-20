using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_management.getsettable
{
    public class timetable
    {
        public int TimeTableId { get; set; }
        public int ClinicId { get; set; }
        public int DoctorId { get; set; }
        public string FromTime { get; set; }
        public string ToTime { get; set; }
        public string Description { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedDate { get; set; }
        public string IsActive{ get; set; }
       
    }
}

