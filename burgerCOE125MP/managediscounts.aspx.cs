using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace burgerCOE125MP
{
    public partial class managediscounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["user"] != null)
            {
                lblLogin.Text = "Logout";
            }

        }
        protected void lnkSwitch_Click(object sender, EventArgs e)
        {
            if (!pnlAdd.Visible)
            {
                lnkSwitch.Text = "<< Back to discounts";
                pnlAdd.Visible = true;
                pnlInventory.Visible = false;
            }
            else if (!pnlInventory.Visible)
            {
                lnkSwitch.Text = "Add discount Code";
                pnlAdd.Visible = false;
                pnlInventory.Visible = true;
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;

                if (txtCode.Text != "" && txtPercent.Text != "")
                {
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("AddDiscount", con))
                        {
                            //(@name text,
                            //@price decimal,
                            //@imgurl text,
                            //@isfeatured int)
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@code", SqlDbType.Text);
                            cmd.Parameters.Add("@percentage", SqlDbType.Decimal);
                            cmd.Parameters["@code"].Value = txtCode.Text;
                            cmd.Parameters["@percentage"].Value = txtPercent.Text;
                            con.Open();

                            cmd.ExecuteNonQuery();
                            con.Close();
                            Response.Redirect("~/managediscounts.aspx");
                        }
                    }
                }
                else
                {
                    lblError.Visible = true;
                }
            }
            catch
            {
                lblError.Text = "Database error (discount code already present)";
                lblError.Visible = true;
            }
        }
    }
}