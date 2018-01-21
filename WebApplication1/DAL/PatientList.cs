using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data.Sql;

namespace WebApplication1.DAL
{
    public class Patient
    {
        public string PaId { get; set; }
        public string PaName { get; set; }
        public string Time { get; set; }
        public string Date { get; set; }

    }
    public class PatientList
    {
        public void AddPatient(string PaId, string PaName)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
            try
            {
                connection.Open();
                string qry = "insert into PatientList_tb(PaId, PaName) values ('" + PaId + "','" + PaName + "')";
                SqlCommand cmd = new SqlCommand(qry, connection);
                cmd.ExecuteNonQuery();
            }
            catch
            { }
            finally
            {
                connection.Close();
            }
        }
        public static List<Patient> GetAllPatients()
        {
            List<Patient> listPatient = new List<Patient>();
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["EhealthConnectionString"].ConnectionString);
            try
            {
                connection.Open();
                string qry = "select PaId,PaName,Time,Date from PaSchedule_tb where DrId='" + StringPass.DrId + "'";
                SqlCommand cmd = new SqlCommand(qry, connection);
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Patient patient = new Patient();
                    patient.PaId = rdr[0].ToString();
                    patient.PaName = rdr[1].ToString();
                    patient.Time = rdr[2].ToString();
                    patient.Date = rdr[3].ToString();
                    listPatient.Add(patient);
                }                
            }
            catch
            { }
            finally
            {
                connection.Close();
            }
            return listPatient;
        }
    }
}