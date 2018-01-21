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
    public partial class DrScheduleUI : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            string tq = "DELETE FROM PaSchedule_tb WHERE Date < GETDATE() - 1";
            SqlCommand cmd1 = new SqlCommand(tq,con);
            cmd1.ExecuteNonQuery();
            con.Close();
            string DrId = Convert.ToString(Session["DrId"]);
            string selectQuery = "select serino,PaId,PaName,Date,Time from PaSchedule_tb where DrId='" + DrId+"'";
            SqlDataAdapter adp = new SqlDataAdapter(selectQuery, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            GridView1.DataSource = dt;
            DataBind();

            if (!IsPostBack)
            {
                DrScheduleFunc();
            }
            con.Open();
            SqlCommand cmd = new SqlCommand("select count(Id) as NumberOfUsers,sum(Rating) as Total from Rating_tb where DrId='" + DrId + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt1 = new DataTable();
            da.Fill(dt1);
            float count = 0, rating = 0, result = 0;

            if (Convert.ToInt32(dt1.Rows[0]["NumberOfUsers"].ToString()) != 0)
            {
                count = float.Parse(dt1.Rows[0]["NumberOfUsers"].ToString());
                rating = float.Parse(dt1.Rows[0]["Total"].ToString());
                result = Convert.ToInt32(Math.Ceiling((rating / count) * 18));
                avgrating.InnerText = Math.Round((rating / count), 1).ToString();
            }
            else
            {
                avgrating.InnerText = "0";
            }
            testSpan.Style.Add("width", result + "px");
            userscount.InnerText = count.ToString();
            con.Close();
        }

        public void DrScheduleFunc()
        {
            string DrId = Convert.ToString(Session["DrId"]);
            string q1 = "select DrName,DrDegg,SpecName,DrEmail from DrInfo1_tb inner join Speciality_tb on DrInfo1_tb.SpecId=Speciality_tb.SpecId where DrId='" + DrId+"'";
            string q2 = "select DrLati from DrInfo1_tb where DrId='"+DrId+"'";
            string q3 = "select DrLongi from DrInfo1_tb where DrId='" + DrId + "'";
            string q4 = "select DrImage from DrImage_tb where DrId='"+DrId+"'"; 
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(q1, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DrSchDatalist.DataSource = ds;
            DrSchDatalist.DataBind();
            SqlCommand com = new SqlCommand(q4, con);
            string img = com.ExecuteScalar().ToString();
            DrImageView1.ImageUrl = img;

            SqlCommand com2 = new SqlCommand(q2, con);
            string lati = com2.ExecuteScalar().ToString();
            SqlCommand com1 = new SqlCommand(q3, con);
            string longi = com1.ExecuteScalar().ToString();



            ScriptManager.RegisterStartupScript(this, this.GetType(), "mousOver",
                "mouseOver('" + lati + "','" + longi + "');", true);
            con.Close();

        }

        protected void GetSchedule_Click(object sender, EventArgs e)
        {
            string x = Convert.ToString(Session["pauname"]);
            string y = Convert.ToString(Session["paid"]);
            string DrId = Convert.ToString(Session["DrId"]);
            string q = "select PaName from PatientTable where PaId='" + y + "'";
            string checkq = "select COUNT(PaName) from PaSchedule_tb where PaId='"+y+"' and DrId='"+DrId+"'";
            string q5 = "select COUNT(*) from PaSchedule_tb where DrId='" + DrId + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(checkq,con);
            int cnt=Convert.ToInt32(cmd.ExecuteScalar());
            cmd = new SqlCommand(q5,con);
            int cnt1 = Convert.ToInt32(cmd.ExecuteScalar());

            if (cnt1 <= 20)
            {
                if (cnt <= 0)
                {
                    cnt1 += 1;
                    cmd = new SqlCommand(q, con);
                    string PaName = cmd.ExecuteScalar().ToString();
                    string q1 = "insert into PaSchedule_tb values('" + y + "','" + DrId + "','" + PaName + "','" + System.DateTime.Now.ToString("h:mm:ss tt") + "','" + System.DateTime.Now.ToString("yyyy-MM-dd") + "','"+cnt1+"')";
                    cmd = new SqlCommand(q1, con);
                    cmd.ExecuteNonQuery();
                    string selectQuery = "select serino,PaId,PaName,Date,Time from PaSchedule_tb where DrId='" + DrId + "'";
                    SqlDataAdapter adp = new SqlDataAdapter(selectQuery, con);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);
                    GridView1.DataSource = dt;
                    DataBind();
                    cnt1 -= 1;
                }
                else
                {
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "popup()", true);
                }
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "popupnext", "popupnext()", true);
            }

            //Response.Redirect("~/UI/DrScheduleUI.aspx");

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            timerLabel.Text = System.DateTime.Now.ToString();
        }

        protected void DeleteSchedule_Click(object sender, EventArgs e)
        {
            string y = Convert.ToString(Session["paid"]);
            string DrId = Convert.ToString(Session["DrId"]);
            string q = " delete from PaSchedule_tb where PaId='"+y+"'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();
            string selectQuery = "select serino,PaId,PaName,Date,Time from PaSchedule_tb where DrId='" + DrId + "'";
            SqlDataAdapter adp = new SqlDataAdapter(selectQuery, con);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            GridView1.DataSource = dt;
            DataBind();
            con.Close();
        }

        protected void MakeReviewButton1_Click(object sender, EventArgs e)
        {
            string y = Convert.ToString(Session["paid"]);
            string DrId = Convert.ToString(Session["DrId"]);
            Session["ReviewPaId"] = y;
            Session["ReviewDrId"]=DrId;
            Response.Redirect("AddRateDr.aspx");
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex= e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}