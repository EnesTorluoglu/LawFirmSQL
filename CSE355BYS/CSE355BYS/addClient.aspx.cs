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
    public partial class addClient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlstr = "sp_NewClient";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerNo", SqlDbType.Int).Value = TextBoxCusNo.Text;
                cmd.Parameters.Add("@CustomerType", SqlDbType.Int).Value = TextBoxType.Text;
                cmd.Parameters.Add("@CompanyNameOrSsn", SqlDbType.NVarChar).Value = TextBoxSSN.Text;
                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = TextBoxFirst.Text;
                cmd.Parameters.Add("@SurName", SqlDbType.NVarChar).Value = TextBoxSur.Text;

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();

                    string script = "alert('Successfully created new client');";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", script, true);
                }
                catch (Exception)
                {
                    Label1.Text = "An error occurred while creating client. Please try again later.";
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