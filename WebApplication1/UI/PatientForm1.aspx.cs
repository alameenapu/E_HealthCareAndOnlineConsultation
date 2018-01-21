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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Security;
using System.Net.Mail;
using System.IO;

namespace WebApplication1.UI
{
    public partial class PatientForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //InsertData();
            //MailMessage msg;
            //SqlCommand cmd = new SqlCommand();
            //string ActivationUrl = string.Empty;

            //try
           // {
            //    String emailId = TextBox6.Text.Trim().ToString();
            //    MailMessage mailMsg = new MailMessage("iftekhar.rasul7@gmail.com", TextBox6.Text.Trim().ToString());
            //    mailMsg.Subject = "Confirmation email for account activation";
            //    String activationUrl = Server.HtmlEncode("http://localhost:55044/UI/PatientEmailCon.aspx?Id=" + FetchUserId(emailId) + "&EmailId=" + emailId);

            //    mailMsg.Body = "Hi " + TextBox1.Text.Trim() + "!\n" +
            //   "Thanks for showing interest and registring in <a href='http://www.Ehealth.com'> Ehealth.com<a> " +
            //   " Please <a href='" + activationUrl + "'>click here to activate</a>  your account and enjoy our services. \nThanks!";
            //    mailMsg.IsBodyHtml = true;

            //    SmtpClient smtpClient = new SmtpClient();
            //    smtpClient.Send(mailMsg);
            //    clear_controls();
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Confirmation Link to activate your account has been sent to your email address');", true);

            //}
            //catch (Exception ex)
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
            //    return;
            //}
            //finally
            //{
            //    ActivationUrl = string.Empty;
            //    emailId = string.Empty;
            //    con.Close();
            //    cmd.Dispose();
            //}
        }

        public void InsertData()
        {
            try
            {
                string q1 = "select count(*) from PatientTable where PaUserName='"+TextBox2.Text+"'";
                con.Open();
                SqlCommand cmd = new SqlCommand(q1, con);
                int cnt =Convert.ToUInt16(cmd.ExecuteScalar());
                if (cnt > 0)
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "popup()", true);
                }
                else
                {
                    DateTime birthDate = Convert.ToDateTime(TextBox8.Text);
                    DateTime laterDate = System.DateTime.Now;
                    int age1 = Age(birthDate, laterDate);
                    PatientInfo aPaInfo = new PatientInfo();
                    aPaInfo.PaName = TextBox1.Text;
                    aPaInfo.PaUserName = TextBox2.Text;
                    aPaInfo.PaPassword = TextBox4.Text;
                    aPaInfo.PaGender = RadioButtonList1.Text;
                    aPaInfo.PaPreAdd = TextBox5.Text;
                    aPaInfo.PaEmail = TextBox6.Text;
                    aPaInfo.PaMob = TextBox7.Text;
                    aPaInfo.PaBDate = TextBox8.Text;
                    aPaInfo.PaAge = age1;

                    PatientManager aPaManager = new PatientManager();
                    if(aPaManager.Save(aPaInfo))
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "popup1", "popup1()", true);
                    }
                    
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        
        public static string FetchUserId(string emailId)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd = new SqlCommand("SELECT PaId FROM PatientTable WHERE PaEmail=@EmailId", con);
            cmd.Parameters.AddWithValue("@EmailId", emailId);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string UserID = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
            cmd.Dispose();
            return UserID;
        }

        public static int Age(DateTime birthDate, DateTime laterDate)
        {
            int age;
            age = laterDate.Year - birthDate.Year;

            if (age > 0)
            {
                age -= Convert.ToInt32(laterDate.Date < birthDate.Date.AddYears(age));
            }
            else
            {
                age = 0;
            }

            return age;
        }

        protected void Nextbtn_Click(object sender, EventArgs e)
        {
            
            Session["PAUName"] = TextBox2.Text;
            Response.Redirect("PatientImg.aspx");
        }

        protected void Okbtn_Click(object sender, EventArgs e)
        {

        }
    }
}