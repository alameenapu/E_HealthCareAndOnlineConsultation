using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.MODAL;
using WebApplication1.DAL;

namespace WebApplication1.BLL
{
    public class DrManager
    {
        private DrGetway aDrGetway;
        public bool Save(DrInfo aDrInfo)
        {
            aDrGetway = new DrGetway();
            return aDrGetway.Save(aDrInfo) > 0;
        }
    }
}