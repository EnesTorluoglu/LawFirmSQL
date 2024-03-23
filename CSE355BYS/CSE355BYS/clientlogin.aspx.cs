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
using System.Web.Configuration;

namespace CSE355BYS
{
    public partial class clientlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["conStr"].ToString();

            SqlConnection con = new SqlConnection(connectionString);

            try
            {
                con.Open();
            }
            catch (Exception)
            {
                con.Close();
                return;
                throw;
            }


            DataSet ds = new DataSet();
            string sqlstr = "select * from PersonClient where CustomerNo=" + TextBox1.Text;

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(sqlstr, con);
                da.Fill(ds);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    string fName = ds.Tables[0].Rows[0]["firstname"].ToString();
                    string lName = ds.Tables[0].Rows[0]["surname"].ToString();
                    string customerNo = ds.Tables[0].Rows[0]["CustomerNo"].ToString();

                    Session["cName"] = fName + " " + lName;
                    Session["customerNo"] = customerNo;

                    Response.Redirect("client.aspx");
                }
                else
                {
                    sqlstr = "select * from CompanyClient where CustomerNo=" + TextBox1.Text;

                    da = new SqlDataAdapter(sqlstr, con);

                    da.Fill(ds);
                    
                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        string ComName = ds.Tables[0].Rows[0]["companyname"].ToString();
                        string customerNo = ds.Tables[0].Rows[0]["CustomerNo"].ToString();

                        Session["cName"] = ComName;
                        Session["customerNo"] = customerNo;

                        Response.Redirect("client.aspx");
                    }
                    else
                    {
                        // Handling the case where no records are found
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records found for the given customer no.');", true);
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