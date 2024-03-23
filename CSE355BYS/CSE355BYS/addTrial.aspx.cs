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
    public partial class addTrial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlstr = "sp_NewTrial";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                DateTime trialDate;
                if (DateTime.TryParse(TextBoxTrialDate.Text, out trialDate))
                {
                    cmd.Parameters.Add("@TrialNo", SqlDbType.Int).Value = TextBoxTrialNo.Text;
                    cmd.Parameters.Add("@TrialDate", SqlDbType.Date).Value = trialDate;
                    cmd.Parameters.Add("@CaseNo", SqlDbType.Int).Value = TextBoxCase.Text;

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();

                        string script = "alert('Successfully created new trial');";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", script, true);
                    }
                    catch (Exception)
                    {
                        Label1.Text = "An error occurred while creating trial. Please try again later.";
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                else
                {
                    string errorScript = "alert('Invalid date format. Please enter a valid date.');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorScript", errorScript, true);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("lawyer.aspx");
        }
    }
}