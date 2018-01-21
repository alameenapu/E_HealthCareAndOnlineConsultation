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
    public partial class PatientImg : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImgSave_Click(object sender, EventArgs e)
        {
            string PAUNAME = Convert.ToString(Session["PAUName"]);
            string q1 = "select PaId from PatientTable where PaUserName='" + PAUNAME + "'";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(q1, con);
                string PAID = cmd.ExecuteScalar().ToString();
                if (PaFileUpload1.HasFile)
                {
                    string imgpath = PaFileUpload1.FileName;
                    PaFileUpload1.PostedFile.SaveAs(HttpContext.Current.Server.MapPath("~/IMAGE/" + imgpath));
                    string imageext = System.IO.Path.GetExtension(this.PaFileUpload1.PostedFile.FileName);
                    string currentimagepath = "~//IMAGE//" + imgpath.ToString();

                    if (imageext.ToLower() == ".jpg" || imageext.ToLower() == ".bmp" ||
                        imageext.ToLower() == ".gif" || imageext.ToLower() == ".png")
                    {
                        string qry = string.Format("insert into PaImage(PaImg,PaId) values ('{0}','{1}')", currentimagepath, PAID);

                        cmd = new SqlCommand(qry, con);

                        cmd.ExecuteNonQuery();
                        PaImg.Visible = true;
                        Palbl.Text = "Image is succesfully saved";
                        Palbl.ForeColor = System.Drawing.Color.Red;
                        con.Close();
                        PaImg.ImageUrl = currentimagepath;
                    }
                    else
                    {
                        Palbl.Visible = true;
                        Palbl.Text = "You must enter an image !";
                        Palbl.ForeColor = System.Drawing.Color.LightBlue;
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        //protected void btnhome_Click(object sender, EventArgs e)
        //{

        //}

        protected void goPro_Click(object sender, EventArgs e)
        {
            string PAUNAME = Convert.ToString(Session["PAUName"]);
            string q1 = "select PaId from PatientTable where PaUserName='" + PAUNAME + "'";
            SqlCommand cmd = new SqlCommand(q1, con);
            con.Open();
            string paid = cmd.ExecuteScalar().ToString();
            Session["PaId"] = paid;
            Response.Redirect("PaPro.aspx");
        }
    }
}