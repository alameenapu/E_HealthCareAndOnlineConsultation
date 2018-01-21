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
    public partial class CheckPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PaInfo();
            }
        }

        protected void DrProLogOutButton_Click(object sender, EventArgs e)
        {

        }

        public void PaInfo()
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
            string PAID = Convert.ToString(Session["DrPaPaId"]);
            string q2 = "select PaImg from PaImage where PaId='" + PAID + "'";
            string q1 = "select PaName,PaGender,PaAge,PaMobile,PaEmail from PatientTable where PaId='" + PAID+"'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q2, con);
            string img = cmd.ExecuteScalar().ToString();
            PaImage.ImageUrl = img;
            SqlDataAdapter adp = new SqlDataAdapter(q1, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            DrPaDataList.DataSource = dt;
            DrPaDataList.DataBind();
            string q3 = "select filename from PatientFile where PaId='" + PAID + "'";
            cmd = new SqlCommand(q3, con);
            Gridview1.DataSource = cmd.ExecuteReader();
            Gridview1.DataBind();
            con.Close();


        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            string FileName = Convert.ToString((sender as LinkButton).CommandArgument);
            string embed = "<object data=\"{0}{1}\" type=\"application/pdf\" width=\"500px\" height=\"600px\">";
            embed += "If you are unable to view file, you can download from <a href = \"{0}{1}&download=1\">here</a>";
            embed += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
            embed += "</object>";
            ltEmbed.Text = string.Format(embed, ResolveUrl("~/UI/FileCS.ashx?Id="), FileName);
        }
    }
}