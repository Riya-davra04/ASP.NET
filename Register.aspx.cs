using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleRental
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any initial setup
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtUserName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string phone = txtPhone.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string address = txtAddress.Text.Trim();
            string aadhar = txtAadhar.Text.Trim();

            string strconn = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString; // Replace with actual connection string

            using (SqlConnection con = new SqlConnection(strconn))
            {
                con.Open();

                // Check if user already exists
                string checkQuery = "SELECT COUNT(*) FROM tblUser WHERE Email = @Email";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@Email", email);
                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        Response.Write("<script>alert('User already exists!');</script>");
                        Response.Redirect("Login.aspx", false);
                        return;
                    }
                }

                // Insert new user
                string insertQuery = "INSERT INTO tblUser (Name, Email, Password, Phone, Gender, Address, Aadhar) VALUES (@UName, @Email, @Password, @Phone, @Gender, @Address, @Aadhar)";
                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    cmd.Parameters.AddWithValue("@UName", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Aadhar", aadhar);

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Write("<script>alert('Registration Successful!');</script>");
            Response.Redirect("Login.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
