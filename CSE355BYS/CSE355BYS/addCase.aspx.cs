using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSE355BYS
{
    public partial class addCase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlstr = "sp_NewCase";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CaseNo", SqlDbType.Int).Value = TextBoxCaseNo.Text;
                cmd.Parameters.Add("@CaseType", SqlDbType.NVarChar).Value = TextBoxCaseType.Text;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    string script = "alert('Successfully created new case');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", script, true);
                }
                catch (Exception)
                {
                    Label1.Text = "An error occurred while creating case. Please try again later.";
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("lawyer.aspx");
        }
    }
}