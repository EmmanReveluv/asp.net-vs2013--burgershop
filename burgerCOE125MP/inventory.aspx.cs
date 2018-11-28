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
    public partial class inventory : System.Web.UI.Page
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
                lnkSwitch.Text = "<< Back to inventory";
                pnlAdd.Visible = true;
                pnlInventory.Visible = false;
                lnkViewCustom.Visible = false;
                pnlCustomBurgs.Visible = false;
            }
            else if (!pnlInventory.Visible)
            {
                lnkSwitch.Text = "Add Item";
                pnlAdd.Visible = false;
                pnlInventory.Visible = true;
                lnkViewCustom.Visible = true;
                pnlCustomBurgs.Visible = false;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;

            if (txtName.Text != "" && txtPrice.Text != "" && txtImage.Text != "" && (txtFeature.Text == "0" || txtFeature.Text == "1") && txtFeature.Text != "")
            {
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("AddBurger", con))
                    {
                        //(@name text,
                        //@price decimal,
                        //@imgurl text,
                        //@isfeatured int)
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@name", SqlDbType.Text);
                        cmd.Parameters.Add("@price", SqlDbType.Decimal);
                        cmd.Parameters.Add("@imgurl", SqlDbType.Text);
                        cmd.Parameters.Add("@isfeatured", SqlDbType.Int);
                        cmd.Parameters["@name"].Value = txtName.Text;
                        cmd.Parameters["@price"].Value = txtPrice.Text;
                        cmd.Parameters["@imgurl"].Value = txtImage.Text;
                        cmd.Parameters["@isfeatured"].Value = txtFeature.Text;
                        con.Open();

                        cmd.ExecuteNonQuery();
                        con.Close();
                        Response.Redirect("~/inventory.aspx");
                    }
                }
            }
            else
            {
                lblError.Visible = true;
            }
        }

        protected void lnkViewCustom_Click(object sender, EventArgs e)
        {
            if (!pnlCustomBurgs.Visible)
                pnlCustomBurgs.Visible = true;
            else if (pnlCustomBurgs.Visible)
                pnlCustomBurgs.Visible = false;
        }
    }
}