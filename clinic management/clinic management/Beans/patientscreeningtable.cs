using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_management.getsettable
{
    public class patientscreeningtable
    {
        public int PatientScreeningId { get; set; }
        public int PatientId { get; set; }
        public int PatientAppointmentId { get; set; }
        public string ScreeningHeading { get; set; }
        public string Description { get; set; }
        public string FilePath { get; set; }
        public string UploadedDateTime { get; set; }
        public string IsActive { get; set; }
       
    }
}

