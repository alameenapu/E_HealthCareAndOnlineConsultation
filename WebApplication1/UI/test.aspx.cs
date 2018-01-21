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
    public partial class test : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
          gg();
        }
        public void gg()
        {
            string SymPaId = Convert.ToString(Session["SymPaId"]);
            string q1 = "select PaUserName from PatientTable where PaId='" + SymPaId + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(q1, con);
            string PaUname = cmd.ExecuteScalar().ToString();
            PaUsName.Text = PaUname;

        }

        protected void button1_Click(object sender, EventArgs e)
        {
            string a = StringPass.organ;
            lbl1.Text = a;
        }

        protected void Back_Click(object sender, EventArgs e)
        {

        }

        protected void PaLogOut_Click(object sender, EventArgs e)
        {

        }
    }
}