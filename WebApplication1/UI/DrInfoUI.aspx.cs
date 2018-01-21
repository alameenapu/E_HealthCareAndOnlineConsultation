using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.BLL;
using WebApplication1.MODAL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;

namespace WebApplication1.UI
{
    public partial class DrInfoUI : System.Web.UI.Page
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
            DrInfoSpecDropDownList.DataSource = dr;
            DrInfoSpecDropDownList.Items.Clear();
            DrInfoSpecDropDownList.Items.Add("....Select Treatment....");
            DrInfoSpecDropDownList.DataTextField = "SpecName";
            DrInfoSpecDropDownList.DataValueField = "SpecId";
            DrInfoSpecDropDownList.DataBind();
            con.Close();

        }

        public void dddistrict()
        {
            con.Open();
            SqlCommand com = new SqlCommand("select LocId,LocName from Location_tb", con);
            SqlDataReader dr = com.ExecuteReader();
            DrInfoLocDropDownList.DataSource = dr;
            DrInfoLocDropDownList.Items.Clear();
            DrInfoLocDropDownList.Items.Add("....Select Treatment....");
            DrInfoLocDropDownList.DataTextField = "LocName";
            DrInfoLocDropDownList.DataValueField = "LocId";
            DrInfoLocDropDownList.DataBind();
            con.Close();


        }

        protected void DrInfoSaveButton_Click(object sender, EventArgs e)
        {

            DrInfo aDrInfo = new DrInfo();

           
            aDrInfo.DrName = DrInfoNameTextBox.Text;
            aDrInfo.DrSpec = DrInfoSpecDropDownList.SelectedValue;
            aDrInfo.DrDrg = DrInfoDegreeTextBox.Text;
            aDrInfo.DrLoc = DrInfoLocDropDownList.SelectedValue;
            aDrInfo.UserName = DrInfoUsernameTextBox.Text;
            aDrInfo.DrPass = DrInfoRePasswordTextBox.Text;
            aDrInfo.DrEmail = DrInfoEmailTextBox.Text;
            aDrInfo.DrLatitude = DrInfoLatitudeTextBox.Text;
            aDrInfo.DrLongitude = DrInfoLongitudeTextBox.Text;

            DrManager aDrManager = new DrManager();
            if (aDrManager.Save(aDrInfo))
            {
                Response.Write("Data save successfully.");
            }
            else
            {
                Response.Write("Data are not saved!");
            }
            Session["DrUName"] = DrInfoUsernameTextBox.Text;
            Response.Redirect("DrInfoConfirm.aspx");

        }

        //protected void Home_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Home.aspx");
        //}
    }
}