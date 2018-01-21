using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WebApplication1
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
            string cntque = "select count(Id) from Rating_tb where PaId='" + StringPass.PaId + "' and DrId='" + StringPass.DrId + "'";
            con.Open();
            SqlCommand cmd = new SqlCommand(cntque, con);
            int cnt=Convert.ToInt32(cmd.ExecuteScalar());
            if (cnt <= 0)
            {
                
                cmd = new SqlCommand("insert into Rating_tb(Rating,DrId,PaId) values(@rating,@name,@nam)", con);
                cmd.Parameters.AddWithValue("@rating", context.Request.Form["rating"]);
                cmd.Parameters.AddWithValue("@name", StringPass.DrId);
                cmd.Parameters.AddWithValue("@nam", StringPass.PaId);
                cmd.ExecuteNonQuery();
                cmd = new SqlCommand("select count(Id) as NumberOfUsers,sum(Rating) as Total from Rating_tb where DrId='"+StringPass.DrId+"'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                float COUNT = float.Parse(dt.Rows[0]["NumberOfUsers"].ToString());
                float RATING = float.Parse(dt.Rows[0]["Total"].ToString());
                context.Response.ContentType = "text/plain";
                try
                {
                    float result = RATING / COUNT;
                    context.Response.Write(result.ToString("0.0"));
                }
                catch (Exception ex)
                {
                    context.Response.StatusCode = 202;
                    context.Response.Write(ex.Message);
                    context.Response.Flush();
                    context.Response.End();
                }
                //context.Response.ContentType = "text/plain";
                
            }
            else
            {
                context.Response.StatusCode = 202;
                context.Response.Write("You already rate this doctor!");
                context.Response.Flush();
                context.Response.End();
            }
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