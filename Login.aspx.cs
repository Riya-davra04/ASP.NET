using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleRental
{
    public partial class Login : System.Web.UI.Page
    {
       
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // Any initial setup
                }
            
            }
        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            string userid = txtUserID.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Admin Login Check
            if (userid == "admin" && password == "admin123")
            {
                Session["User"] = "admin";
                Response.Write("<script>alert('Admin Login Successful!');</script>");
                Response.Redirect("Dashboard.aspx");
                return;
            }

            // User Login Check from Database
            string strconn = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString; // Replace with actual connection string
            using (SqlConnection con = new SqlConnection(strconn))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM tblUser WHERE Email = @Email AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", userid);
                cmd.Parameters.AddWithValue("@Password", password);
                int count = (int)cmd.ExecuteScalar();

                if (count > 0)
                {
                    Session["User"] = userid;
                    Response.Write("<script>alert('User Login Successful!');</script>");
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid username or password!');</script>");
                }
            }
        }
    }
    }


