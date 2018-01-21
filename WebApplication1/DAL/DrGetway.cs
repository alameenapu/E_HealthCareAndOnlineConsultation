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
   

    public class DrGetway
    {
        SqlConnection con;
        public DrGetway()
        {
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);

        }
        public int Save(DrInfo aDrInfo)
        {

            string insertQuery = string.Format("INSERT INTO DrInfo1_tb(DrName,SpecId,DrDegg,LocId,DrUname,DrPass,DrEmail,DrLati,DrLongi) VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}')", aDrInfo.DrName, aDrInfo.DrSpec, aDrInfo.DrDrg, aDrInfo.DrLoc, aDrInfo.UserName, aDrInfo.DrPass, aDrInfo.DrEmail, aDrInfo.DrLatitude, aDrInfo.DrLongitude);
            SqlCommand com = new SqlCommand(insertQuery, con);
            con.Open();
            int rowaffeced = com.ExecuteNonQuery();
            return rowaffeced;
        }
    }

    
}