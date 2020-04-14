using BusinessManagementSystem.DAL.DAL_StockRegisterTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_StockRegister
    {
        public DataTable GetStockData(string strProduct, DateTime fromDate, DateTime toDate)
        {
            tblStockRegisterTableAdapter adp = new tblStockRegisterTableAdapter();
            DataTable dt = adp.GetData(strProduct, fromDate, toDate);
            return dt;
        }
    }
}