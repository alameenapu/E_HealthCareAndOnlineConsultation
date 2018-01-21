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
    public partial class DrSearchUI : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DrDatalistfunc();

            }
        }

        public void DrDatalistfunc()
        {
            string specid = Convert.ToString(Session["SpetialityId"]);
            string locid = Convert.ToString(Session["LocationId"]);
            try
            {
                con.Open();
                string q1 = "select DrId,DrName,DrDegg from DrInfo1_tb where SpecId='" + specid + "' and LocId='" + locid + "'";
                SqlDataAdapter da = new SqlDataAdapter(q1, con);
                DataSet ds = new DataSet();
                da.Fill(ds, "imp");
                DrDatalist.DataSource = ds;
                DrDatalist.DataBind();
            }
            finally
            {
                con.Close();
            }

        }

        protected void DrDatalist_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "DrMap")
            {
                string q1 = "select DrLati from DrInfo1_tb where DrId='" + e.CommandArgument.ToString() + "'";
                string q2 = "select DrLongi from DrInfo1_tb where DrId='" + e.CommandArgument.ToString() + "'";
                con.Open();
                SqlCommand com = new SqlCommand(q1, con);
                string lati = com.ExecuteScalar().ToString();
                SqlCommand com1 = new SqlCommand(q2, con);
                string longi = com1.ExecuteScalar().ToString();

                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "mousOver",
                    "mouseOver('" + lati + "','" + longi + "');", true);

            }

            if (e.CommandName == "DrCon")
            {
                 DrSearchLabel.Text = e.CommandArgument.ToString();
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "popup()", true);
            }
        }

        protected void DrSearchButton1_Click(object sender, EventArgs e)
        {
            try
            {

                string sq1 = "select PaPasword from PatientTable where PaUserName='" + TextBox1.Text + "'";
                string sq2 = "select PaId from PatientTable where PaUserName='" + TextBox1.Text + "'";
                con.Open();
                SqlCommand com = new SqlCommand(sq1, con);
                string pass = com.ExecuteScalar().ToString();
                SqlCommand com1 = new SqlCommand(sq2, con);
                string paid = com1.ExecuteScalar().ToString();

                con.Close();
                if (pass == TextBox2.Text)
                {
                    Session["DrId"] = DrSearchLabel.Text;
                    Session["pauname"] = TextBox1.Text;
                    Session["paid"] = paid;
                    Response.Redirect("DrScheduleUI.aspx");
                }
                else
                {
                    Response.Write("Wrong Password");
                }
            }
            finally
            {
                Response.Write("Error");
            
            }
            

        }

        protected void MakeReviewButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("DrRating.aspx");
        }
    }
}