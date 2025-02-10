using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VehicleRental
{
    public partial class Categories1 : System.Web.UI.Page
    {
        protected int CategoriesUser;
        string connectionString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT CategoryID, CategoryName, Description, ImagePath FROM tblCategorize ORDER BY CategoryID DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                CategoryGrid.DataSource = dt;
                CategoryGrid.DataBind();

            }
         
        }
       
        protected void BtnSaveCategory_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TxtCategoryName.Text))
            {
                Response.Write("<script>alert('Category Name is required!');</script>");
                return;
            }

            string imagePath = UploadImage(); // ✅ Get image path from method

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO tblCategorize (CategoryName, Description, ImagePath) VALUES (@CategoryName, @Description, @ImagePath)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CategoryName", TxtCategoryName.Text);
                cmd.Parameters.AddWithValue("@Description", TxtDescription.Text);
                cmd.Parameters.AddWithValue("@ImagePath", imagePath); // ✅ Pass file path instead of FileUpload control

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Write("<script>alert('Category added successfully!');</script>");
            ClearFields();
            LoadCategories();
        }


        protected void BtnUpdateCategory_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(HiddenCategoryID.Value))
            {
                Response.Write("<script>alert('No category selected for update!');</script>");
                return;
            }

            string imagePath = UploadImage();
            if (string.IsNullOrEmpty(imagePath))
            {
                imagePath = GetExistingImagePath(HiddenCategoryID.Value);
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE tblCategorize SET CategoryName=@Name, Description=@Desc, ImagePath=@Image WHERE CategoryID=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", TxtCategoryName.Text);
                cmd.Parameters.AddWithValue("@Desc", TxtDescription.Text);
                cmd.Parameters.AddWithValue("@Image", imagePath);
                cmd.Parameters.AddWithValue("@ID", HiddenCategoryID.Value);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Write("<script>alert('Category updated successfully!');</script>");
            ClearFields();
            LoadCategories();  // ✅ Refresh categories
        }


        private string UploadImage()
        {
            if (FileUploadImage.HasFile)
            {
                string fileName = Path.GetFileName(FileUploadImage.FileName);
                string folderPath = Server.MapPath("~/Images/");

                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath); // Ensure folder exists
                }

                string filePath = Path.Combine(folderPath, fileName);
                FileUploadImage.SaveAs(filePath);

                return "/Images/" + fileName; // ✅ Return relative path
            }
            return "";
        }


        private string GetExistingImagePath(string categoryID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT ImagePath FROM tblCategorize WHERE CategoryID=@ID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ID", categoryID);
                con.Open();
                object result = cmd.ExecuteScalar();
                return result != null ? result.ToString() : "";
            }
        }

        protected void CategoryGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int categoryID = Convert.ToInt32(e.CommandArgument); // Ensure CategoryID is correctly received

            if (e.CommandName == "EditCategory")
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT CategoryID, CategoryName, Description, ImagePath FROM tblCategorize WHERE CategoryID=@ID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ID", categoryID);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read()) // Read the result
                    {
                        HiddenCategoryID.Value = reader["CategoryID"].ToString(); // Store ID
                        TxtCategoryName.Text = reader["CategoryName"].ToString();
                        TxtDescription.Text = reader["Description"].ToString();
                    }
                    else
                    {
                        Response.Write("<script>alert('Category not found!');</script>");
                    }
                }
            }
        }

        private void ClearFields()
        {
            HiddenCategoryID.Value = "";
            TxtCategoryName.Text = "";
            TxtDescription.Text = "";
        }
    }
}
