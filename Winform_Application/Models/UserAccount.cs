using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Winform_Application.Models
{
    public class UserAccount
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public int Age { get; set; }
        public bool Sex { get; set; }

        public UserAccount() { }
        public UserAccount(string username, string password, int age, bool sex)
        {
            Username = username;
            Password = password;
            Age = age;
            Sex = sex;

        }
    }
}