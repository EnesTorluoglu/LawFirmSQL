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
    public partial class getRecentTrial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Session["trialNo"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlstr = "sp_UpdateTrialAsResolved";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@TrialNo", SqlDbType.Int).Value = Session["trialNo"];

                try
                {
                    con.Open();

                    cmd.ExecuteNonQuery();

                    string script = "alert('Successfully updated');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", script, true);
                }
                catch (Exception)
                {
                    Label1.Text = "An error occurred while updating trial. Please try again later.";
                }
                finally
                {
                    con.Close();
                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("getUnresolvedCase.aspx");
        }
    }
}