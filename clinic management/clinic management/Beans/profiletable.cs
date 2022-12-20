using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_management.getsettable
{
    public class profiletable
    {
        public int ProfileId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Cnic { get; set; }
        public string Gender { get; set; }
        public string Contact { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string UserType { get; set; }
        public string CreateDate { get; set; }
        public string Qualification { get; set; }
        public string Specialization { get; set; }
        public string IsActive { get; set; }
        public int ClinicId { get; set; }
    }
}

