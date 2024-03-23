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
    public partial class getYourDebt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = " ";


            string sqlslctstr = "SELECT a.IBAN FROM Account a join lawyer l on a.AccountId = l.AccountId join Payment p on p.ReceiverNo = l.LawyerNo WHERE p.SenderNo = @SenderNo";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlslctstr, con))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("@SenderNo", SqlDbType.Int).Value = Convert.ToInt32(Session["customerNo"]);

                try
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                        {
                            string IBAN = ds.Tables[0].Rows[0]["IBAN"].ToString();

                            Session["IBAN"] = IBAN;
                        }
                        else
                        {
                            // Handling the case where no records are found
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records found.');", true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handling exceptions
                    Label1.Text = " assa " + ex;
                }
                finally
                {
                    con.Close();
                }
            }


            string sqlstr = "sp_RemainingDebt";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@CustomerId", SqlDbType.Int).Value = Convert.ToInt32(Session["customerNo"]);

                try
                {
                    con.InfoMessage += (_, args) =>
                    {
                        Label1.Text += args.Message + "<br/>";
                    };

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    // Handling exceptions
                    Label1.Text = " An error occurred while fetching remaining debt. Please try again later.";
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string sqlstr = "sp_MakeTransaction";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IBAN", SqlDbType.VarChar).Value = Session["IBAN"];
                cmd.Parameters.Add("@TransactionAmount", SqlDbType.Decimal).Value = TextBox1.Text;
                cmd.Parameters.Add("@ClientNo", SqlDbType.Int).Value = Convert.ToInt32(Session["customerNo"]);

                try
                {
                    con.InfoMessage += (_, args) =>
                    {
                        Label1.Text += args.Message + "<br/>";
                    };

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Handling exceptions
                    Label1.Text = "An error occurred while paying remaining debt. Please try again later." + ex;
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("client.aspx");
        }
    }
}