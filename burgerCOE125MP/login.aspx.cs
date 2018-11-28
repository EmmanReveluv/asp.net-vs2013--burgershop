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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                HttpCookie aCookie;
                string cookieName;
                int limit = Request.Cookies.Count;
                for (int i = 0; i < limit; i++)
                {
                    cookieName = Request.Cookies[i].Name;
                    aCookie = new HttpCookie(cookieName);
                    aCookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(aCookie);
                }
            }

        }

        protected void lnkReg_Click(object sender, EventArgs e)
        {
            txtEmailLog.Text = "";
            txtPass.Text = "";
            panReg.Visible = true;
            panLogin.Visible = false;
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            txtEmailReg.Text = "";
            txtAddress1.Text = "";
            txtAddress2.Text = "";
            txtPassReg.Text = "";
            txtPassRegConfirm.Text = "";
            txtContact.Text = "";
            panReg.Visible = false;
            panLogin.Visible = true;
            lblRegError.Visible = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtPassReg.Text == txtPassRegConfirm.Text
                && txtPassReg.Text != ""
                && txtEmailReg.Text != ""
                && txtNameReg.Text != ""
                && txtAddress1.Text != ""
                && txtContact.Text != "")
            {
                int success = 0;
                string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("registerUser", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@name", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@contact", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@addressline1", SqlDbType.Text);
                        cmd.Parameters.Add("@addressline2", SqlDbType.Text);
                        cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

                        cmd.Parameters["@name"].Value = txtNameReg.Text;
                        cmd.Parameters["@email"].Value = txtEmailReg.Text;
                        cmd.Parameters["@password"].Value = txtPassReg.Text;
                        cmd.Parameters["@contact"].Value = txtContact.Text;
                        cmd.Parameters["@addressline1"].Value = txtAddress1.Text;
                        cmd.Parameters["@addressline2"].Value = txtAddress2.Text;

                        con.Open();

                        cmd.ExecuteNonQuery();
                        success = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                        if (success == 1)
                        {
                            Response.Redirect("~/login.aspx?reg=1");
                        }
                    }

                }
            }
            else
            {
                lblRegError.Visible = true;
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int login = 0;
            string isadmin = "0";
            string userName = "";
            string email = "";
            string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("selectLogin", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@password", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@login", SqlDbType.Int).Direction = ParameterDirection.Output;

                    cmd.Parameters["@email"].Value = txtEmailLog.Text;
                    cmd.Parameters["@password"].Value = txtPass.Text;
                    con.Open();

                    cmd.ExecuteNonQuery();
                    login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        isadmin = dr["isadmin"].ToString();
                        userName = dr["name"].ToString();
                        email = dr["email"].ToString();

                    }
                    if (login == 1)
                    {
                        Response.Cookies["info"]["name"] = userName;
                        Response.Cookies["info"].Expires = DateTime.Now.AddDays(1);
                        Response.Cookies["user"]["email"] = email;
                        Response.Cookies["user"].Expires = DateTime.Now.AddDays(1);
                        if (isadmin == "1")
                            Response.Redirect("~/inventory.aspx");
                        else
                            Response.Redirect("~/index.aspx");
                    }
                    else
                    {
                        lblLogError.Visible = true;
                    }


                }
            }
        }
    }
}