using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BEopcoin.Models
{
    public class LoginRequest
    {
        //public string Username { get; set; } //username o mail
        public string email { get; set; }
        public string password { get; set; }
    }
}