using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Winform_Application
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtUsername.Text;
            string password = txtPassword.Text;

            if(userName == "admin" && password == "passwd")
            {
                Response.Redirect("./Default.aspx");
            } else
            {
                lblError.Text = "Invalid username or password.";
            }
        }
    }
}