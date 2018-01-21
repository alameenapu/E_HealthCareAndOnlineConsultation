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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddspaciality();
                dddistrict();
            }
        }

        public void ddspaciality()
        {
            con.Open();
            SqlCommand com = new SqlCommand("select SpecId,SpecName from Speciality_tb", con);
            SqlDataReader dr = com.ExecuteReader();
            SpecialityDropList.DataSource = dr;
            SpecialityDropList.Items.Clear();
            SpecialityDropList.Items.Add("....Select Treatment....");
            SpecialityDropList.DataTextField = "SpecName";
            SpecialityDropList.DataValueField = "SpecId";
            SpecialityDropList.DataBind();
            con.Close();

        }
        public void ddtreatment()
        {
            con.Open();
            SqlCommand com = new SqlCommand("select TreatId,TreatName,SpecId from Treatment_tb where SpecId='" + SpecialityDropList.SelectedValue + "'", con);
            SqlDataReader dr = com.ExecuteReader();
            TreatmentDropLis.DataSource = dr;
            TreatmentDropLis.Items.Clear();
            TreatmentDropLis.Items.Add("....Select Treatment....");
            TreatmentDropLis.DataTextField = "TreatName";
            TreatmentDropLis.DataValueField = "TreatId";
            TreatmentDropLis.DataBind();
            con.Close();

        }

        public void dddistrict()
        {
            con.Open();
            SqlCommand com = new SqlCommand("select LocId,LocName from Location_tb", con);
            SqlDataReader dr = com.ExecuteReader();
            LocationDropList.DataSource = dr;
            LocationDropList.Items.Clear();
            LocationDropList.Items.Add("....Select Treatment....");
            LocationDropList.DataTextField = "LocName";
            LocationDropList.DataValueField = "LocId";
            LocationDropList.DataBind();
            con.Close();


        }

        protected void SpecialityDropList_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddtreatment();
        }

        //protected void SearchButton1_Click(object sender, EventArgs e)
        //{
           
        //}

        protected void SearchButton1_Click1(object sender, EventArgs e)
        {
            Session["SpetialityId"] = SpecialityDropList.SelectedValue;
            Session["LocationId"] = LocationDropList.SelectedValue;
            Response.Redirect("DrSearchUI.aspx");
        }

        protected void Drsubmit_Click(object sender, EventArgs e)
        {
            string q1 = "select Drpass from DrInfo1_tb where DrUname='"+HDrUsernameTextBox.Text+"'";
            string q2 = "select DrId from DrInfo1_tb where DrUname='" + HDrUsernameTextBox.Text + "'";
            con.Open();
            SqlCommand com = new SqlCommand(q1,con);
            string x = com.ExecuteScalar().ToString();
            SqlCommand com1 = new SqlCommand(q2,con);
            string y = com1.ExecuteScalar().ToString();
            if (x == HDrPasswordTextBox.Text)
            {
                Session["D1"] = y;
                Session["DUN"] = HDrUsernameTextBox.Text;
                Response.Redirect("DrProfileUI.aspx");
                HDrUsernameTextBox = null;
                HDrPasswordTextBox = null;
            }
        }

        protected void PaLogIn_Click(object sender, EventArgs e)
        {
            string q1 = "select PaPasword from PatientTable where PaUserName='"+TextBox1.Text+"'";
            string q2 = "select PaId from PatientTable where PaUserName='" + TextBox1.Text + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q1, con);
            string x = cmd.ExecuteScalar().ToString();
            cmd = new SqlCommand(q2, con);
            string y = cmd.ExecuteScalar().ToString();
            if (x == TextBox2.Text)
            {
                Session["PaId"] = y;
                Response.Redirect("PaPro.aspx");
            }
            else {

            }
        }

        protected void ClinicSBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Clinic.aspx");
        }
    }
}