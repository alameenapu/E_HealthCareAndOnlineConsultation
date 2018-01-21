using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication1.UI
{
    public partial class AddRateDr : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            StringPass.DrId= Convert.ToString(Session["ReviewDrId"]);
            StringPass.PaId= Convert.ToString(Session["ReviewPaId"]);
            if (!IsPostBack)
            {
                rateff();
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(Id) as NumberOfUsers,sum(Rating) as Total from Rating_tb where DrId='"+ Convert.ToString(Session["ReviewDrId"]) + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            float count = 0, rating = 0, result = 0;

            if (Convert.ToInt32(dt.Rows[0]["NumberOfUsers"].ToString()) != 0)
            {
                count = float.Parse(dt.Rows[0]["NumberOfUsers"].ToString());
                rating = float.Parse(dt.Rows[0]["Total"].ToString());
                result = Convert.ToInt32(Math.Ceiling((rating / count) * 18));
                avgrating.InnerText = Math.Round((rating / count), 1).ToString();
            }
            else
            {
                avgrating.InnerText = "0";
            }
            testSpan.Style.Add("width", result + "px");
            userscount.InnerText = count.ToString();
            con.Close();
        }
        public void rateff()
        {
            string pid = Convert.ToString(Session["ReviewPaId"]);
            string did = Convert.ToString(Session["ReviewDrId"]);
            string q1 = "select DrImage from DrImage_tb where DrId='" + did + "'";
            string q2 = "select DrName from DrInfo1_tb where DrId='" + did + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q1,con);
            string img = cmd.ExecuteScalar().ToString();
            rateimage.ImageUrl = img;
            cmd = new SqlCommand(q2, con);
            DrNameRateLBL.Text = cmd.ExecuteScalar().ToString();
            con.Close();
        }
    }
}