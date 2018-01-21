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
    
    public partial class DrProfileUI : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            Pasch();
           
                //StringPass.DrId = Convert.ToString(Session["D1"]);
            if (!IsPostBack)
            {
                Drpro();
            }
           
            //else { Response.Redirect("Home.aspx"); }


        }
        public void Drpro()
        {
            string y = Convert.ToString(Session["D1"]);
            string x = Convert.ToString(Session["DUN"]);

               if (y != "" && x != "")
                   {
                       DrProLabel.Text = x;
                       DrProLabel.Visible = true;
                       string imgsq = "select DrImage from DrImage_tb where DrId='" + y + "'";
                       con.Open();
                       SqlCommand com = new SqlCommand(imgsq, con);
                       string imgpath = com.ExecuteScalar().ToString();
                       con.Close();
                       DrProImg.ImageUrl = imgpath;

            
                   }     
        }

        protected void DrProLogOutButton_Click(object sender, EventArgs e)
        {

            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Redirect("Home.aspx");
        }

        protected void DrProPaScheduleButton_Click(object sender, EventArgs e)
        {
            Pasch();
        }
        public void Pasch()
        {
            string y = Convert.ToString(Session["D1"]);
            string selectQuery = "select PaId,PaName,Date,Time from PaSchedule_tb where DrId='" + y + "'";
            SqlDataAdapter adp = new SqlDataAdapter(selectQuery, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            //GridView1.DataSource = dt;
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Write(GridView1.SelectedRow.Cells[2].Text);
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "PaList")
            {
                string q1 = "select COUNT(PaId) from PatientList_tb where PaId='"+e.CommandArgument+"'";
                string q2 = "select PaName from PaSchedule_tb where PaId='"+e.CommandArgument+"'";
                string q3 = "select DrId from PaSchedule_tb where PaId='" + e.CommandArgument + "'";

                con.Open();
                SqlCommand cmd = new SqlCommand(q2, con);
                string x = cmd.ExecuteScalar().ToString();
                cmd = new SqlCommand(q3, con);
                string z = cmd.ExecuteScalar().ToString();
                cmd = new SqlCommand(q1, con);
                int y = Convert.ToInt16(cmd.ExecuteScalar().ToString());
                if (y > 0)
                {
                    
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Patient already axist...');", true);
                }
                else
                {
                    string q4 = "insert into PatientList_tb values('" + e.CommandArgument + "','" + x + "','"+ z +"')";
                    cmd = new SqlCommand(q4, con);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("PatientForm1.aspx");
                }
            }
        }

        protected void DrProDocumentButton_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Data Insert Successfully...');", true);
        }

        protected void DrProPaListButton_Click(object sender, EventArgs e)
        {
            string y = Convert.ToString(Session["D1"]);
            string selectQuery = "select PaId,PaName from PatientList_tb where DrId='" + y + "'";
            SqlDataAdapter adp = new SqlDataAdapter(selectQuery, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            DataList2.DataSource = dt;
            DataList2.DataBind();
        }

        protected void DrProTimer_Tick(object sender, EventArgs e)
        {
            timaerlbl.Text = System.DateTime.Now.ToString();
            
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Paname")
            {
                Session["DrPaPaId"] = e.CommandArgument;
                Response.Redirect("CheckPatient.aspx");
            }
        }
    }
}