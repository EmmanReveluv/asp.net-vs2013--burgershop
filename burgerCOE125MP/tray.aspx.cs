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
    public partial class tray : System.Web.UI.Page
    {
        decimal total = 0;
        decimal percent = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblSummary.Text = "";
                string pm = Request.QueryString["premade"];
                string id = Request.QueryString["id"];
                string dc = Request.QueryString["disc"];
                string code = Request.QueryString["code"];
                string name = "", price = "";

                if (Request.Cookies["user"] != null)
                {
                    lblLogin.Text = "Logout";
                }
                if (Request.QueryString["remove"] != null && Request.Cookies["user"] != null)
                {
                    string remove = Request.QueryString["remove"];
                    string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("DeleteFromCart", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@id", SqlDbType.Int);
                            cmd.Parameters["@id"].Value = remove;
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
                if (pm == "1" && Request.Cookies["user"] != null)
                {
                    string isloggedin = Request.Cookies["user"]["email"];
                    string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("SelectBurgerID", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            SqlDataAdapter da = new SqlDataAdapter(cmd);

                            cmd.Parameters.Add("@id", SqlDbType.Int);
                            cmd.Parameters["@id"].Value = id;

                            con.Open();

                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            foreach (DataRow dr in dt.Rows)
                            {
                                name = dr["name"].ToString();
                                price = dr["price"].ToString();
                            }
                        }

                    }

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

                            cmd.Parameters["@email"].Value = isloggedin;
                            cmd.Parameters["@burgID"].Value = id;
                            cmd.Parameters["@burgName"].Value = name;
                            cmd.Parameters["@burgPrice"].Value = price;


                            con.Open();

                            cmd.ExecuteNonQuery();
                            success = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                            //if (success == 1)
                            //{
                            //    Response.Redirect("~/login.aspx?reg=1");
                            //}
                        }
                    }
                }
                if (Request.Cookies["user"] != null)
                {
                    SqlDataSource1.SelectParameters["email"].DefaultValue = Request.Cookies["user"]["email"];
                    lblLog.Visible = false;
                    pnlTray.Visible = true;
                    string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("SelectUserCart", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            SqlDataAdapter da = new SqlDataAdapter(cmd);

                            cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                            cmd.Parameters["@email"].Value = Request.Cookies["user"]["email"];

                            con.Open();

                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            foreach (DataRow dr in dt.Rows)
                            {
                                lblSummary.Text = lblSummary.Text + dr["BurgName"].ToString();
                                lblSummary.Text = lblSummary.Text + " - ₱" + dr["BurgPrice"].ToString() + "<br/>";
                                total = total + Convert.ToDecimal(dr["BurgPrice"].ToString());
                            }
                            con.Close();
                        }
                        if (dc != null)
                        {
                            using (SqlCommand cmd = new SqlCommand("SelectDiscount", con))
                            {
                                string perc = "";
                                cmd.CommandType = CommandType.StoredProcedure;
                                SqlDataAdapter da = new SqlDataAdapter(cmd);

                                cmd.Parameters.Add("@code", SqlDbType.VarChar, 50);
                                cmd.Parameters["@code"].Value = code;

                                con.Open();

                                DataTable dt = new DataTable();
                                da.Fill(dt);
                                foreach (DataRow dr in dt.Rows)
                                {
                                    percent = Convert.ToDecimal(dr["percentage"]);
                                }
                                total = total - (total) * (percent / 100);
                                lblDiscount.Text = lblDiscount.Text + "-" + percent.ToString() + "%";
                                lblDiscount.Visible = true;
                                lblTotal.Text = "Discounted Price: ₱ " + total.ToString("F");
                                lblSummary.Text = lblSummary.Text + "<br/>" + lblTotal.Text;
                                con.Close();
                            }
                        }
                        else
                        {
                            lblTotal.Text = "Total Price: ₱ " + total;
                            lblSummary.Text = lblSummary.Text + "<br/>" + lblTotal.Text;
                        }

                    }
                }
            }

        }

        protected void btnDeliver_Click(object sender, EventArgs e)
        {
            lblTray.Text = "Delivery";
            pnlDelivery.Visible = true;
            pnlTray.Visible = false;
        }

        protected void lnkBack_Click(object sender, EventArgs e)
        {
            lblTray.Text = "Your tray";
            pnlDelivery.Visible = false;
            pnlTray.Visible = true;
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if (txtName.Text != "" && txtContact.Text != "" && txtAddress1.Text != "")
            {
                string summary = lblSummary.Text;
                summary = summary.Replace("₱", "P");

                int key;
                string constring = ConfigurationManager.ConnectionStrings["burgerDatabaseConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("AddtoDelivery", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //(@orderlist text, @address text,@custname text,@contactnum int)
                        cmd.Parameters.Add("@orderlist", SqlDbType.Text);
                        cmd.Parameters.Add("@address", SqlDbType.Text);
                        cmd.Parameters.Add("@custname", SqlDbType.Text);
                        cmd.Parameters.Add("@contactnum", SqlDbType.Text);
                        cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

                        cmd.Parameters["@orderlist"].Value = summary;
                        cmd.Parameters["@address"].Value = txtAddress1.Text + " " + txtAddress2.Text;
                        cmd.Parameters["@custname"].Value = txtName.Text;
                        cmd.Parameters["@contactnum"].Value = txtContact.Text;

                        con.Open();

                        cmd.ExecuteNonQuery();
                        key = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                        //DataTable dt = new DataTable();
                        //da.Fill(dt);
                        //foreach (DataRow dr in dt.Rows)
                        //{
                        //    key = dr["id"].ToString();
                        //}
                        //if (success == 1)
                        //{
                        //    Response.Redirect("~/login.aspx?reg=1");
                        con.Close();
                        //}
                    }
                    using (SqlCommand cmd = new SqlCommand("DeleteCartUser", con))
                    {
                        string email = Request.Cookies["user"]["email"];
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        //(@orderlist text, @address text,@custname text,@contactnum int)
                        cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);

                        cmd.Parameters["@email"].Value = email;

                        con.Open();

                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                pnlComplete.Visible = true;
                pnlDelivery.Visible = false;
                lblTrackingNum.Text = "Tracking Number: " + key.ToString();
            }

        }

        protected void btnDiscount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/tray.aspx?disc=1&code=" + txtDiscount.Text);
        }

    }
}