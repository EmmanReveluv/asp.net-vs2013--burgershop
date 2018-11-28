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
    public partial class makeyourown : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                lblLogin.Text = "Logout";
                btnAddCustom.Visible = true;
                lblLog.Visible = false;
            }
        }

        protected void btnAddCustom_Click(object sender, EventArgs e)
        {            
            string burgName = "";
            if (txtBurgerName.Text == "")
                burgName = "Custom Burger";
            else
                burgName = txtBurgerName.Text;

            //string burgDetails = ddlBuns.SelectedValue + "<br />" + ddlCheese.SelectedValue + "<br />" + ddlPatty.SelectedValue + "<br />" + ddlSides.SelectedValue;
            //string cartInfo = txtBurgerName.Text + "<br />info:<br />" + burgDetails;
            string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;
            int success = 0;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("AddtoCart", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@burgID", SqlDbType.Int);
                    cmd.Parameters.Add("@burgName", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@burgPrice", SqlDbType.Decimal);
                    cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

                    cmd.Parameters["@email"].Value = Request.Cookies["user"]["email"];
                    cmd.Parameters["@burgID"].Value = "0";
                    cmd.Parameters["@burgName"].Value = burgName;
                    cmd.Parameters["@burgPrice"].Value = "220.00";

                    con.Open();

                    cmd.ExecuteNonQuery();
                    success = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                    
                }
            } 
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("AddtoCustom", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    //(@name varchar(50),@buns text,@cheese text,@patty text,@sides text)
                    cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@buns", SqlDbType.Text);
                    cmd.Parameters.Add("@cheese", SqlDbType.Text);
                    cmd.Parameters.Add("@patty", SqlDbType.Text);
                    cmd.Parameters.Add("@sides", SqlDbType.Text);

                    cmd.Parameters["@name"].Value = txtBurgerName.Text;
                    cmd.Parameters["@buns"].Value = ddlBuns.Text;
                    cmd.Parameters["@cheese"].Value = ddlCheese.Text;
                    cmd.Parameters["@patty"].Value = ddlPatty.Text;
                    cmd.Parameters["@sides"].Value = ddlSides.Text;

                    con.Open();

                    cmd.ExecuteNonQuery();

                }
            }
            Response.Redirect("~/tray.aspx");
        }

    }
}