using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.MODAL;
using WebApplication1.DAL;

namespace WebApplication1.BLL
{
    public class PatientManager
    {
        private PatientGetway aPatientGetway;
        public bool Save(PatientInfo aPaInfo)
        {
            aPatientGetway = new PatientGetway();
            return aPatientGetway.Save(aPaInfo) > 0;
        }
    }
}