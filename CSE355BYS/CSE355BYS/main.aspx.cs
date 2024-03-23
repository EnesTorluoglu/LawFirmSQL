using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSE355BYS
{
    public partial class main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonClient_Click(object sender, EventArgs e)
        {
            Response.Redirect("clientlogin.aspx");
        }

        protected void ButtonLawyer_Click(object sender, EventArgs e)
        {
            Response.Redirect("lawyerlogin.aspx");
        }
    }
}