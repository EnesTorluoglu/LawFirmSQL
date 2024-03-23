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
using System.Drawing.Printing;

namespace CSE355BYS
{
    public partial class _lawyerlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    string sqlstr = "SELECT * FROM employee WHERE SSN=@SSN";
                    using (SqlCommand cmd = new SqlCommand(sqlstr, con))
                    {
                        cmd.Parameters.Add("@SSN", SqlDbType.NVarChar).Value = TextBox1.Text;

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                            {
                                string fName = ds.Tables[0].Rows[0]["name"].ToString();
                                string lName = ds.Tables[0].Rows[0]["lastname"].ToString();
                                string ssn = ds.Tables[0].Rows[0]["ssn"].ToString();

                                Session["fName"] = fName;
                                Session["lName"] = lName;
                                Session["SSN"] = ssn;

                                Response.Redirect("lawyer.aspx");
                            }
                            else
                            {
                                // Handling the case where no records are found
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records found for the given SSN.');", true);
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    // Handling SQL exceptions
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An SQL error occurred: " + ex.Message + "');", true);
                }
                catch (Exception ex)
                {
                    // Handling other exceptions
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    string sqlstr = "SELECT * FROM employee join manager on employee.SSN = manager.SSN WHERE employee.SSN=@SSN and manager.ManagerNo=@ManagerNo";
                    using (SqlCommand cmd = new SqlCommand(sqlstr, con))
                    {
                        cmd.Parameters.Add("@SSN", SqlDbType.NVarChar).Value = TextBox1.Text;
                        cmd.Parameters.Add("@ManagerNo", SqlDbType.NVarChar).Value = TextBox2.Text;

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();
                            da.Fill(ds);

                            if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                            {
                                string fName = ds.Tables[0].Rows[0]["name"].ToString();
                                string lName = ds.Tables[0].Rows[0]["lastname"].ToString();
                                string ssn = ds.Tables[0].Rows[0]["ssn"].ToString();
                                string managerNo = ds.Tables[0].Rows[0]["ManagerNo"].ToString();

                                Session["fName"] = fName;
                                Session["lName"] = lName;
                                Session["SSN"] = ssn;
                                Session["ManagerNo"] = managerNo;

                                Response.Redirect("manager.aspx");
                            }
                            else
                            {
                                // Handling the case where no records are found
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records found for the given SSN.');", true);
                            }
                        }
                    }
                }
                catch (SqlException ex)
                {
                    // Handling SQL exceptions
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An SQL error occurred: " + ex.Message + "');", true);
                }
                catch (Exception ex)
                {
                    // Handling other exceptions
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
                }
            }
        }
    }
}