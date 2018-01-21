using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.MODAL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.Configuration;

namespace WebApplication1.DAL
{
    public class PatientGetway
    {
        SqlConnection con;
        public PatientGetway()
        {
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
        }
        public int Save(PatientInfo aPaInfo)
        {
            string insertQuery = string.Format("INSERT INTO PatientTable(PaName,PaUserName,PaPasword,PaGender,PaPresentAddress,PaEmail,PaMobile,PaBirthDate,PaAge) VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')", aPaInfo.PaName, aPaInfo.PaUserName, aPaInfo.PaPassword, aPaInfo.PaGender, aPaInfo.PaPreAdd, aPaInfo.PaEmail, aPaInfo.PaMob, aPaInfo.PaBDate, aPaInfo.PaAge);
            SqlCommand com = new SqlCommand(insertQuery, con);
            con.Open();
            int rowaffeced = com.ExecuteNonQuery();
            return rowaffeced;
        }
    }
}