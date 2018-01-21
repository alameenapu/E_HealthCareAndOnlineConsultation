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
    public partial class Clinic : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        PagedDataSource pds = new PagedDataSource();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dcLocation();
            }

        }
        public void dcLocation()
        {
            con.Open();
            SqlCommand com = new SqlCommand("select LocId,LocName from Location_tb", con);
            SqlDataReader dr = com.ExecuteReader();
            ClinicDropList.DataSource = dr;
            ClinicDropList.Items.Clear();
            ClinicDropList.Items.Add("....Select Treatment....");
            ClinicDropList.DataTextField = "LocName";
            ClinicDropList.DataValueField = "LocId";
            ClinicDropList.DataBind();
            con.Close();


        }

        protected void ClinicSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void ClinicDataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Clinic")
            {
                string q1 = "select Category,Speciality,Address,Phone from Clinic_tb where ClinicId='"+e.CommandArgument+"' ";
                string q2 = "select ClinicLati from Clinic_tb where ClinicId='" + e.CommandArgument + "'";
                string q3 = "select ClinicLongi from Clinic_tb where ClinicId='" + e.CommandArgument + "'";
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(q1, con);
                DataSet ds = new DataSet();
                da.Fill(ds, "imp");
                ClinicInfoDataList.DataSource = ds;
                ClinicInfoDataList.DataBind();
                SqlCommand cmd = new SqlCommand(q2, con);
                string lati = cmd.ExecuteScalar().ToString();
                cmd = new SqlCommand(q3, con);
                string longi = cmd.ExecuteScalar().ToString();
                System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "mousOver",
                    "mouseOver('" + lati + "','" + longi + "');", true);
            }
        }
        public void BindData()
        {

            string q = "select ClinicName,ClinicImg,ClinicId from Clinic_tb where LocId='" + ClinicDropList.SelectedValue + "'";
            con.Open();
            
            SqlDataAdapter da = new SqlDataAdapter(q,con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 3;
            pds.CurrentPageIndex = CurrentPage;
            lnkbtnNext.Visible = true;
            lnkbtnPrevious.Visible = true;
            lnkbtnNext.Enabled = !pds.IsLastPage;
            lnkbtnPrevious.Enabled = !pds.IsFirstPage;

            ClinicDataList1.DataSource = pds;
            ClinicDataList1.DataBind();
            doPaging();
        }

        public int CurrentPage
        {

            get
            {
                if (this.ViewState["CurrentPage"] == null)
                    return 0;
                else
                    return Convert.ToInt16(this.ViewState["CurrentPage"].ToString());
            }

            set
            {
                this.ViewState["CurrentPage"] = value;
            }

        }
        private void doPaging()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            for (int i = 0; i < pds.PageCount; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            dlPaging.DataSource = dt;
            dlPaging.DataBind();
        }

        protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("lnkbtnPaging"))
            {
                CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
                BindData();
            }
        }

        protected void lnkbtnNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindData();
            ClinicInfoDataList.DataSource = null;
            ClinicInfoDataList.DataBind();
        }

        protected void lnkbtnPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindData();
            ClinicInfoDataList.DataSource = null;
            ClinicInfoDataList.DataBind();
        }

        protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
            if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkbtnPage.Enabled = false;
                lnkbtnPage.Font.Bold = true;
            }
        }
    }
}