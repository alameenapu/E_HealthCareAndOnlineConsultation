using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Security;
using System.Net.Mail;
using System.IO;

namespace WebApplication1.UI
{
    /// <summary>
    /// Summary description for FileCS
    /// </summary>
    public class FileCS : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            string file = Convert.ToString(context.Request.QueryString["Id"]);
            byte[] bytes;
            string fileName;
            string constr = ConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT  data FROM PatientFile WHERE filename=@Id";
                    cmd.Parameters.AddWithValue("@Id", file);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["data"];
                        
                        //fileName = file;
                    }
                    con.Close();
                }
            }

            context.Response.Buffer = true;
            context.Response.Charset = "";
            if (context.Request.QueryString["download"] == "1")
            {
                context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + file);
            }
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.ContentType = "application/pdf";
            context.Response.BinaryWrite(bytes);
            context.Response.Flush();
            context.Response.End();
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}