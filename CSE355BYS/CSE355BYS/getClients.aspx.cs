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
    public partial class getClients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                Label1.Text = "Your Clients";

                string sqlstr = "sp_GetClientsOfLawyer";

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
                            while (sdr.Read())
                            {
                                TableRow row = new TableRow();

                                TableCell cellCustomerNo = new TableCell();
                                TableCell cellPhoneNumber = new TableCell();

                                cellCustomerNo.Text = sdr["CustomerNo"] != DBNull.Value ? sdr["CustomerNo"].ToString() : string.Empty;
                                cellPhoneNumber.Text = sdr["PhoneNumber"] != DBNull.Value ? sdr["PhoneNumber"].ToString() : string.Empty;

                                row.Cells.Add(cellCustomerNo);
                                row.Cells.Add(cellPhoneNumber);

                                Table1.Rows.Add(row);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = "An error occurred while fetching clients. Please try again later.";
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("getClientsInDebt.aspx");
        }
    }
}