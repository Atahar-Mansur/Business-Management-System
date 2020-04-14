using BusinessManagementSystem.DAL.DAL_CurrentBalanceTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_CurrentBalance
    {
        public DataTable GetCurrentBalanceData()
        {
            TableAdapterCurrentBalance adp = new TableAdapterCurrentBalance();
            DataTable dt = adp.GetCurrentBalanceData();
            return dt;
        }
    }
}