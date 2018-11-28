using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace burgerCOE125MP
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string search = Request.QueryString["search"];
            SqlDataSource1.SelectParameters["search"].DefaultValue = search;
            lblSearch.Text = lblSearch.Text + "'"+ search + "'";
            if (Request.Cookies["user"] != null)
            {
                lblLogin.Text = "Logout";
            }
        }
        protected void btnSearch_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/search.aspx?search=" + txtSearch.Text);
        }
    }
}