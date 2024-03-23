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
    public partial class manager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = string.Empty;
            Label1.Text = " Welcome " + Session["fName"] + " " + Session["lName"];
            Button4.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button4.Visible = true;
            Label1.Text = string.Empty;
            Label1.Text = "Lawyer you manage";

            string sqlstr = "sp_GetManagedLawyers";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ManagerNo", SqlDbType.Int).Value = Session["ManagerNo"];

                try
                {
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        int i = 0;
                        while (sdr.Read())
                        {
                            i++;
                            TableRow row = new TableRow();

                            TableCell cellLawyerNo = new TableCell();
                            TableCell cellLawyerName = new TableCell();
                            TableCell cellLawyerSur = new TableCell();
                            TableCell cellNoOfCases = new TableCell();

                            cellLawyerNo.Text = sdr["LawyerNo"] != DBNull.Value ? sdr["LawyerNo"].ToString() : string.Empty;
                            cellLawyerName.Text = sdr["Name"] != DBNull.Value ? (sdr["Name"]).ToString() : string.Empty;
                            cellLawyerSur.Text = sdr["LastName"] != DBNull.Value ? sdr["LastName"].ToString() : string.Empty;
                            cellNoOfCases.Text = sdr["Number Of Cases"] != DBNull.Value ? sdr["Number Of Cases"].ToString() : string.Empty;
                            

                            row.Cells.Add(cellLawyerNo);
                            row.Cells.Add(cellLawyerName);
                            row.Cells.Add(cellLawyerSur);
                            row.Cells.Add(cellNoOfCases);

                            Table1.Rows.Add(row);
                        }

                        if (i == 0)
                        {
                            Label1.Text = "There are no lawyers managed by you";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handling exceptions
                    Label1.Text = "An error occurred. Please try again later." + ex;
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Button4.Visible = true;
            Label1.Text = string.Empty;

            string sqlstr = "sp_AppointTrial";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ManagerNo", SqlDbType.Int).Value = Session["ManagerNo"];
                cmd.Parameters.Add("@RepresentativeToAppoint", SqlDbType.Int).Value = TextBox1.Text;
                cmd.Parameters.Add("@TrialNo", SqlDbType.Int).Value = TextBox2.Text;

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
                    Label1.Text = "An error occurred. Please try again later." + ex;
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("manager.aspx");
        }
    }
}