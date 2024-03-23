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
    public partial class getUnresolvedCase : System.Web.UI.Page
    {
        int i = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Label1.Text = "Your Cases";
                Label2.Text = "Case no:";

                string sqlstr = "sp_GetUnresolvedCasesOfLawyer";

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand(sqlstr, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@LawyerId", SqlDbType.Int).Value = Session["lawyerNo"];

                    try
                    {
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            TableRow firstRow = new TableRow();

                            TableCell cellCaseNo = new TableCell();
                            TableCell cellTrialDate = new TableCell();

                            cellCaseNo.Text = "Case No";
                            cellTrialDate.Text = "Date of most recent trial in the case";

                            firstRow.Cells.Add(cellCaseNo);
                            firstRow.Cells.Add(cellTrialDate);

                            Table1.Rows.Add(firstRow);

                            TableRow firstRowN = new TableRow();

                            TableCell cellCaseNoN = new TableCell();
                            TableCell cellTrialDateN = new TableCell();

                            cellCaseNoN.Text = "---------------------";
                            cellTrialDateN.Text = "--------------------------------------------";

                            firstRowN.Cells.Add(cellCaseNoN);
                            firstRowN.Cells.Add(cellTrialDateN);

                            Table1.Rows.Add(firstRowN);

                            while (sdr.Read())
                            {
                                TableRow row = new TableRow();

                                TableCell cellCustomerNo = new TableCell();
                                TableCell cellPhoneNumber = new TableCell();

                                cellCustomerNo.Text = sdr["CaseNo"] != DBNull.Value ? sdr["CaseNo"].ToString() : string.Empty;
                                cellPhoneNumber.Text = sdr["LatestTrialDate"] != DBNull.Value ? sdr["LatestTrialDate"].ToString() : string.Empty;

                                row.Cells.Add(cellCustomerNo);
                                row.Cells.Add(cellPhoneNumber);

                                Table1.Rows.Add(row);
                            }
                        }
                        i++;
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "An error occurred while fetching cases. Please try again later.";
                    }
                    finally
                    {
                        con.Close();
                    }
                }
                if(i==0)
                {
                    Button1.Visible = false;
                    Label2.Visible = false;
                    TextBox1.Visible = false;
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlstr = "select top 1 * from AssociatedCase ac join Trial t on ac.TrialNo = t.TrialNo where ac.CaseNo = @CaseNo order by t.TrialDate desc";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
            using (SqlCommand cmd = new SqlCommand(sqlstr, con))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.Add("@CaseNo", SqlDbType.Decimal).Value = TextBox1.Text;

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                    {
                        string trial = ds.Tables[0].Rows[0]["TrialNo"].ToString();

                        Session["trialNo"] = trial;

                        Response.Redirect("getRecentTrial.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No records found for trial.');", true);
                    }
                }
            }


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("lawyer.aspx");
        }
    }
}