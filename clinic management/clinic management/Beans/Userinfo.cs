using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic_management.Beans
{
    public class Userinfo
    {
        public int  Id{ get; set; }
        public string  Username{ get; set; }
        public string  Password{ get; set; }
        public string Email { get; set; }
        public int UserType { get; set; }
        public int clinicid { get; set; }
    }
}