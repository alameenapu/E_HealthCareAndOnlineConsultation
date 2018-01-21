using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace WebApplication1.UI
{
    /// <summary>
    /// Summary description for DiseaseService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class DiseaseService : System.Web.Services.WebService
    {

        [WebMethod(enableSession: false)]
        public string GetDisease(String symptoms_name)
        {
            List<disease> listDisease = new List<disease>();

            string CS = ConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("sendDisease", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "@symptoms";
                parameter.Value = symptoms_name;
                cmd.Parameters.Add(parameter);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    disease dis = new disease();
                    dis.Disease = rdr["DiseaseName"].ToString();
                    listDisease.Add(dis);

                }
                String serializedList = JsonConvert.SerializeObject(listDisease);
                return serializedList;


            }


        }
    }
}
