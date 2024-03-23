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
    public partial class getClientsInDebt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Label1.Text = "Your Clients";

                string sqlstr = "sp_GetCustomersInDebt";

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString))
                using (SqlCommand cmd = new SqlCommand(sqlstr, con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@LawyerNo", SqlDbType.Int).Value = Session["lawyerNo"];
                    cmd.Parameters.Add("@LastDate", SqlDbType.Date).Value = DateTime.Parse("2025-01-30");

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

                                TableCell cellLeftAmountOfDebt = new TableCell();
                                TableCell cellLastDateOfPayment = new TableCell();
                                TableCell cellCustomerNo = new TableCell();
                                TableCell cellPhoneNumber = new TableCell();
                                TableCell cellEmail = new TableCell();

                                cellLeftAmountOfDebt.Text = sdr["LeftAmountOfDebt"] != DBNull.Value ? sdr["LeftAmountOfDebt"].ToString() : string.Empty;
                                cellLastDateOfPayment.Text = sdr["LastDateOfPayment"] != DBNull.Value ? ((DateTime)sdr["LastDateOfPayment"]).ToString("yyyy-MM-dd") : string.Empty;
                                cellCustomerNo.Text = sdr["CustomerNo"] != DBNull.Value ? sdr["CustomerNo"].ToString() : string.Empty;
                                cellPhoneNumber.Text = sdr["PhoneNumber"] != DBNull.Value ? sdr["PhoneNumber"].ToString() : string.Empty;
                                cellEmail.Text = sdr["Email"] != DBNull.Value ? sdr["Email"].ToString() : string.Empty;

                                row.Cells.Add(cellLeftAmountOfDebt);
                                row.Cells.Add(cellLastDateOfPayment);
                                row.Cells.Add(cellCustomerNo);
                                row.Cells.Add(cellPhoneNumber);
                                row.Cells.Add(cellEmail);

                                Table1.Rows.Add(row);
                            }

                            if(i == 0)
                            {
                                Label1.Text = "None of the customers have outstanding debts.";
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handling exceptions (log, display an error message, etc.)
                        Label1.Text = "An error occurred while fetching clients. Please try again later." + ex;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("lawyer.aspx");
        }
    }
}