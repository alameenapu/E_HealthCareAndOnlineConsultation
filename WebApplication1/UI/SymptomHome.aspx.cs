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
    public partial class SymptomHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Painfo();
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string SymPaId = Convert.ToString(Session["SymPaId"]);
            Session["Sym1PaId"] = SymPaId;
            Response.Redirect("test.aspx");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Back_Click(object sender, EventArgs e)
        {

        }

        protected void PaLogOut_Click(object sender, EventArgs e)
        {

        }

        public void Painfo()
        {
            string SymPaId = Convert.ToString(Session["SymPaId"]);
            string q1 = "select PaUserName from PatientTable where PaId='" + SymPaId + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q1, con);
            string PaUname = cmd.ExecuteScalar().ToString();
            PaUsName.Text = PaUname;
        }
    }
}