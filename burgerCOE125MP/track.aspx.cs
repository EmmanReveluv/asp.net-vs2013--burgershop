using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace burgerCOE125MP
{
    public partial class track : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string track = Request.QueryString["track"];
            SqlDataSource1.SelectParameters["id"].DefaultValue = track;
            if (track != null)
            {
                pnlTrack.Visible = true;            
            }
            if (Request.Cookies["user"] != null)
            {
                lblLogin.Text = "Logout";
            }
        }

        protected void btnTrack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/track.aspx?track=" + txtTrack.Text);
        }
    }
}