using BusinessManagementSystem.DAL.DAL_LedgerTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_Ledger
    {
        public DataTable GetBillReport(string strPartyName, int leng)
        {
            getBillReportTableAdapter adp = new getBillReportTableAdapter();
            DataTable dt = adp.GetBillReport(leng, strPartyName);
            return dt;
        }

        public DataTable GetCashMemoReport(string strPartyName, int leng)
        {
            getCashMemoReportTableAdapter adp = new getCashMemoReportTableAdapter();
            DataTable dt = adp.GetCashMemoReport(leng, strPartyName);
            return dt;
        }

        public DataTable GetLedgerReport(string strPartyName, int leng)
        {
            getLedgerReportTableAdapter adp = new getLedgerReportTableAdapter();
            DataTable dt = adp.GetLedgerReport(leng, strPartyName);
            return dt;
        }

        public string GetCurrentBalance(string strPartyName)
        {
            getCurrentBalanceTableAdapter adp = new getCurrentBalanceTableAdapter();
            string r = "";
            foreach( var x in adp.GetCurrentBalance(strPartyName))
            {
                r = x.CurrentBalance.ToString();
            }
            return r;
        }

        public string GetBills(string strPartyName)
        {
            getDueBillsTableAdapter adp = new getDueBillsTableAdapter();
            string r = "";
            int f = 0;
            foreach (var x in adp.GetDueBills(strPartyName))
            {
                if (f != 0) r = r + ", ";
                else f = 1;
                r = r + x.intBillId.ToString();
            }
            return r;
        }
    }
}