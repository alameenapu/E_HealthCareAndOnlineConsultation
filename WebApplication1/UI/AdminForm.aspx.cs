using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;

namespace WebApplication1.UI
{
    public partial class AdminForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                locf();
            }
        }

        protected void admupbtn_Click(object sender, EventArgs e)
        {

        }
        public void locf()
        {
            con.Open();
            SqlCommand com = new SqlCommand("select LocId,LocName from Location_tb", con);
            SqlDataReader dr = com.ExecuteReader();
            DropDownList1.DataSource = dr;
            DropDownList1.Items.Clear();
            DropDownList1.Items.Add("....Select Treatment....");
            DropDownList1.DataTextField = "LocName";
            DropDownList1.DataValueField = "LocId";
            DropDownList1.DataBind();
            con.Close();
        }
    }
}