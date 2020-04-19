using BusinessManagementSystem.DAL.DAL_NewClientTableAdapters;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_NewClient
    {
        public string PutData(List<NewClient> records)
        {
            try
            {
                tblClientTableAdapter adp = new tblClientTableAdapter();

                foreach (var x in records)
                {
                    adp.PutData(x.strName, x.strEmail, x.strMobileNo, x.strAddress);
                }

                return "New Clients Are Entered Successfully.";
            }
            catch (Exception e)
            {
                return "error";
            }

        }
    }
}