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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            { 
            lblLogin.Text = "Logout";
            }
            if(Request.QueryString["submit"] != null) 
            {
                lblMessage.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#message';", true);
            }
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/search.aspx?search=" + txtSearch.Text);
        }

        protected void btnContact_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("AddtoCustomerContact", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@feedback", SqlDbType.Text);
                    cmd.Parameters["@email"].Value = txtContactEmail.Text;
                    cmd.Parameters["@feedback"].Value = txtMessage.Text;
                    con.Open();
                    
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("~/index.aspx?submit=1");
                }
            }
        }

    }
}