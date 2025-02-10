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
    public partial class Dashboard1 : System.Web.UI.Page
    {

        protected int RegisteredUsers;
        protected int Categories;
        protected int CarVariants;
        protected int Cars;
        protected int Drivers;
        protected int NewBookings;

        protected void Page_Load(object sender, EventArgs e)
        {

           if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            string strconn = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(strconn))
            {
                conn.Open();

                RegisteredUsers = GetCount(conn, "SELECT COUNT(*) FROM tblUser");
                Categories = GetCount(conn, "SELECT COUNT(*) FROM tblCategorize");

            }
        }

        private int GetCount(SqlConnection conn, string query)
        {
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                return (int)cmd.ExecuteScalar();
            }
        }
    }
}