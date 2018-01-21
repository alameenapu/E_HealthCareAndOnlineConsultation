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
    public partial class DrInfoConfirm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);      
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DrImageViwe_Click(object sender, EventArgs e)
        {
            string DrUName = Convert.ToString(Session["DrUName"]);
            string q1 = "select DrId from DrInfo1_tb where DrUname='" + DrUName + "'";
            try
            {
                con.Open();
                SqlCommand cmd1 = new SqlCommand(q1, con);
                string DrId = cmd1.ExecuteScalar().ToString();              
                if (DrFileUpload1.HasFile)
                {

                    string imagepath = DrFileUpload1.FileName;
                    DrFileUpload1.PostedFile.SaveAs(HttpContext.Current.Server.MapPath("~/IMAGE/" + imagepath));
                    string imageext = System.IO.Path.GetExtension(this.DrFileUpload1.PostedFile.FileName);
                    string currentimagepath = "~//IMAGE//" + imagepath.ToString();

                    if (imageext.ToLower() == ".jpg" || imageext.ToLower() == ".bmp" ||
                        imageext.ToLower() == ".gif" || imageext.ToLower() == ".png")
                    {
                        string qry =string.Format("insert into DrImage_tb(DrImage,DrId) values ('{0}','{1}')",currentimagepath,DrId);

                        SqlCommand cmd = new SqlCommand(qry, con);

                        cmd.ExecuteNonQuery();
                        DrImageLabel.Visible = true;
                        DrImageLabel.Text = "Image is succesfully saved";
                        DrImageLabel.ForeColor = System.Drawing.Color.Red;
                        con.Close();
                        DrImage.ImageUrl = currentimagepath;
                    }
                    else
                    {
                        DrImageLabel.Visible = true;
                        DrImageLabel.Text = "You must enter an image !";
                        DrImageLabel.ForeColor = System.Drawing.Color.LightBlue;
                    }
                }
            }
            catch (Exception exp)
            {

                Response.Write(exp.ToString());
            }
        }

        protected void btnhome_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Home.aspx");
        }

        protected void goPro_Click(object sender, EventArgs e)
        {
            string DrUName = Convert.ToString(Session["DrUName"]);
            string q1 = "select DrId from DrInfo1_tb where DrUname='" + DrUName + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q1, con);
            string DRUN = cmd.ExecuteScalar().ToString();
            Session["D1"] = DRUN;
            Session["DUN"] = DrUName;
            Response.Redirect("DrProfileUI.aspx");
        }
    }
}