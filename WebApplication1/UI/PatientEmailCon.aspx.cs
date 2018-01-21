using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.UI
{
    public partial class PatientEmailCon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnhome_Click(object sender, EventArgs e)
        {

        }

        protected void goPro_Click(object sender, EventArgs e)
        {
            String s = Request.QueryString["Id"];
            Session["PaId"] = s;
            Response.Redirect("PaPro.aspx");
        }
    }
}