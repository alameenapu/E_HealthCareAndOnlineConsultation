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
using System.IO;

namespace WebApplication1.UI
{
    public partial class PaPro : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PaImg();
                BindGrid();
            }
        }

        public void PaImg()
        {
            string PatientId =Convert.ToString( Session["PaId"]);
            string q1 =" select PaImg from PaImage where PaId ='"+PatientId+"'";
            string q2 = "select PaUserName from PatientTable where PaId ='" + PatientId + "'";
            SqlCommand cmd = new SqlCommand(q1, con);
            con.Open();
            string img = cmd.ExecuteScalar().ToString();
            PatientPic.ImageUrl = img;
            cmd = new SqlCommand(q2, con);
            string PaUNlbl = cmd.ExecuteScalar().ToString();
            PaUsName.Text = PaUNlbl;
            con.Close();
           
        }

        protected void PaLogOut_Click(object sender, EventArgs e)
        {

        }

        protected void Syntom_Click(object sender, EventArgs e)
        {
            string PatientId = Convert.ToString(Session["PaId"]);
            Session["SymPaId"] = PatientId;
            Response.Redirect("SymptomHome.aspx");
        }

        protected void FileUpload_Click(object sender, EventArgs e)
        {
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "popup()", true);
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
               
                using (Stream fs = FileUpload1.PostedFile.InputStream)
                {
                    string PatientId = Convert.ToString(Session["PaId"]);
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        
                        
                            string query = "insert into PatientFile values (@Name, @ID, @Data)";
                            using (SqlCommand cmd = new SqlCommand(query))
                            {
                                cmd.Connection = con;
                                cmd.Parameters.AddWithValue("@Name", filename);
                                cmd.Parameters.AddWithValue("@ID", PatientId);
                                cmd.Parameters.AddWithValue("@Data", bytes);
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        
                    }
                }
            }
            else
            {
                Label1.Visible = true;
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        private void BindGrid()
        {
                    string PatientId = Convert.ToString(Session["PaId"]);
                    string q1 = "select filename from PatientFile where PaId='"+ PatientId + "'";
                    SqlCommand cmd = new SqlCommand(q1, con);
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
               
          
        }

        

        protected void lnkDelete_Click(object sender, EventArgs e)
        {

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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}