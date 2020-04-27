using BusinessManagementSystem.DAL.DAL_PrintChallanTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_PrintChallan
    {
        public DataTable GetChallanBasicData(string strPartyName, string strChallanNo, string strLCNo)
        {
            tblChallanOutTableAdapter adp = new tblChallanOutTableAdapter();

            if (strChallanNo == "") strChallanNo = strChallanNo + "2";
            DataTable dt = adp.GetChallanBasicData(strPartyName, Convert.ToInt32(strChallanNo), strLCNo);
            return dt;
        }

        public DataTable GetTableData(string strPartyName, string strChallanNo, string strLCNo)
        {
            getTableTableAdapter adp = new getTableTableAdapter();
            DataTable dt = adp.GetTableData(strPartyName, Convert.ToInt32(strChallanNo), strLCNo);
            return dt;
        }

        public string GetPurchaseNo(string strPartyName, string strChallanNo, string strLCNo)
        {
            getPurchaseNoTableAdapter adp = new getPurchaseNoTableAdapter();
            string r = "";
            bool flag = true;

            foreach (var x in adp.GetPurchaseNo(strPartyName, Convert.ToInt32(strChallanNo), strLCNo))
            {
                if (flag) flag = false;
                else r = r + ", ";

                r = r + x.strPurchNo;
            }
            return r;
        }

        public string GetPurchaseDate(string strPartyName, string strChallanNo, string strLCNo)
        {
            getPurchaseDateTableAdapter adp = new getPurchaseDateTableAdapter();
            string r = "";
            bool flag = true;

            foreach (var x in adp.GetPurchaseDate(strPartyName, Convert.ToInt32(strChallanNo), strLCNo))
            {
                if (flag) flag = false;
                else r = r + ", ";

                r = r + x.dtePurchDate;
            }
            return r;
        }

        public string DeleteChallan(string strPartyName, string strChallanNo, string strLCNo)
        {
            try
            {
                deleteChallanOutDataTableAdapter adp = new deleteChallanOutDataTableAdapter();
                sprDeleteFromStockRegisterTableAdapter adp2 = new sprDeleteFromStockRegisterTableAdapter();
                getTableTableAdapter adp3 = new getTableTableAdapter();

                foreach (var x in adp3.GetTableData(strPartyName, Convert.ToInt32(strChallanNo), strLCNo))
                {
                    adp2.DeleteStockData(Convert.ToInt32(strChallanNo), strPartyName, x.strDetails, Convert.ToInt32(x.intQuantity));
                }

                adp.DeleteChallanOutData(Convert.ToInt32(strChallanNo), strPartyName, strLCNo);

                return "Delete Successfully";
            }
            catch(Exception e)
            {
                return "The Challan is not delete Successfully !!!";
            }
        }
    }
}