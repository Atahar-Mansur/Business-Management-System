using BusinessManagementSystem.DAL.DAL_PrintBillTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_PrintBill
    {
        public DataTable GetChallanBasicData(string strPartyName, string strBillNo, string strBOENo)
        {
            DataTable dt = new DataTable();
            tblBillTableAdapter adp = new tblBillTableAdapter();

            if (strBillNo == "") strBillNo = strBillNo + "2";
            dt = adp.GetBillList(strPartyName, Convert.ToInt32(strBillNo), strBOENo);
            return dt;
        }

        public DataTable GetTableData(string strPartyName, string strBillNo, string strBOENo)
        {
            DataTable dt = new DataTable();
            tblGetTableDataTableAdapter adp = new tblGetTableDataTableAdapter();
            dt = adp.GetTableData(strPartyName, Convert.ToInt32(strBillNo), strBOENo);
            return dt;
        }

        public double GetTotal(string strPartyName, string strBillNo, string strBOENo)
        {
            tblGetTableDataTableAdapter adp = new tblGetTableDataTableAdapter();
            double total = 0;
            foreach (var x in adp.GetTableData(strPartyName, Convert.ToInt32(strBillNo), strBOENo))
            {
                total += x.monTotalPrice;
            }

            Int64 amount_int = (Int64)total;
            Int64 amount_dec = (Int64)Math.Round((total - (double)(amount_int)) * 100);

            total = amount_int + ((double)(amount_dec) / 100);

            return total;
        }

        public string GetCurrency(string strPartyName, string strBillNo, string strBOENo)
        {
            string currency = "error";
            tblGetCurrencyTableAdapter adp = new tblGetCurrencyTableAdapter();
            foreach (var x in adp.GetCurrency(strPartyName, Convert.ToInt32(strBillNo), strBOENo))
            {
                currency = x.strCurrency;
            }
            return currency;
        }

        public string GetChallansNo(string strPartyName, string strBillNo, string strBOENo)
        {
            string r = "";
            bool flag = true;
            tblGetChallansNoTableAdapter adp = new tblGetChallansNoTableAdapter();

            foreach (var x in adp.GetChallansNo(strPartyName, Convert.ToInt32(strBillNo), strBOENo))
            {
                if (flag) flag = false;
                else r = r + ", ";

                r = r + x.intChallanId.ToString();
            }
            return r;
        }

        public string GetChallansDate(string strPartyName, string strBillNo, string strBOENo)
        {
            string r = "";
            bool flag = true;
            tblGetChallansDateTableAdapter adp = new tblGetChallansDateTableAdapter();

            foreach (var x in adp.GetChallansDate(strPartyName, Convert.ToInt32(strBillNo), strBOENo))
            {
                if (flag) flag = false;
                else r = r + ", ";

                r = r + x.dteChallanDate;
            }
            return r;
        }

        public string DeleteChallan(string strPartyName, string strBillNo, string strBOENo, string strReason)
        {
            try
            {
                tblDeleteBillTableAdapter adp = new tblDeleteBillTableAdapter();
                //sprDeleteFromStockRegisterTableAdapter adp2 = new sprDeleteFromStockRegisterTableAdapter();
                //getTableTableAdapter adp3 = new getTableTableAdapter();
                tblDeletedBillTableAdapter adp4 = new tblDeletedBillTableAdapter();

                //foreach (var x in adp3.GetTableData(strPartyName, Convert.ToInt32(strBillNo), strBOENo))
                //{
                //    adp2.DeleteStockData(Convert.ToInt32(strBillNo), strPartyName, x.strDetails, Convert.ToInt32(x.intQuantity));
                //}

                adp.DeleteBillData(Convert.ToInt32(strBillNo), strPartyName, strBOENo);

                adp4.InsertDeleteReason(Convert.ToInt32(strBillNo), strReason);

                return "Delete Successfully";
            }
            catch (Exception e)
            {
                return "The Challan is not delete Successfully !!!";
            }
        }
    }
}