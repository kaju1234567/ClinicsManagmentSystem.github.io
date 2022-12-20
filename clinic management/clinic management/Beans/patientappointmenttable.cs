using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_management.getsettable
{
    public class patientappointmenttable
    {
        public int PatientAppointmentId { get; set; }
        public int PatientId { get; set; }
        public int TimeTableId { get; set; }
        public string RequestedDateTime { get; set; }
        public string PatientStatus { get; set; }
        public string ApprovedBy { get; set; }
        public string ApprovedDateTime { get; set; }
        public string Comments { get; set; }
        public string Fees { get; set; }
        public string IsActive { get; set; }
       
    }
}

