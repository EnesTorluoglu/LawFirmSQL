using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// 
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;

namespace CSE355BYS
{
    public partial class lawyer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Label1.Text = " Welcome " + Session["fName"] + " " + Session["lName"];

                string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    try
                    {
                        con.Open();

                        string sqlstr = "SELECT * FROM lawyer WHERE SSN=@SSN";
                        using (SqlCommand cmd = new SqlCommand(sqlstr, con))
                        {
                            cmd.Parameters.Add("@SSN", SqlDbType.NVarChar).Value = Session["SSN"];

                            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                            {
                                DataSet ds = new DataSet();
                                da.Fill(ds);

                                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                                {
                                    string lawyerNo = ds.Tables[0].Rows[0]["lawyerNo"].ToString();

                                    Session["lawyerNo"] = lawyerNo;
                                }
                                else
                                {
                                    // Handling the case where no records are found
                                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records found.');", true);
                                }
                            }
                        }
                    }
                    catch (SqlException ex)
                    {
                        // Handling SQL exceptions (log, display an error message, etc.)
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An SQL error occurred: " + ex.Message + "');", true);
                    }
                    catch (Exception ex)
                    {
                        // Handling other exceptions (log, display an error message, etc.)
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("getClients.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("getUnresolvedCase.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("addClient.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("addCase.aspx");
        }
        
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("addTrial.aspx");
        }
    }
}