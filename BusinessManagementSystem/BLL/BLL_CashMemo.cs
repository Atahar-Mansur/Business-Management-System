using BusinessManagementSystem.DAL.DAL_CashMemoTableAdapters;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_CashMemo
    {
        public List<objCashMemo> GetChallanList(string strPartyName)
        {
            tblCashMemoTableAdapter adp = new tblCashMemoTableAdapter();
            List<objCashMemo> showList = new List<objCashMemo>();

            foreach (var x in adp.GetBillList(strPartyName))
            {
                objCashMemo aCashMemo = new objCashMemo();

                aCashMemo.intBillId = x.intBillId;
                aCashMemo.monDue = Convert.ToDouble(x.monDue);
                aCashMemo.strPartyName = "Bill : " + x.intBillId.ToString() + " Due : " + x.monDue.ToString();

                showList.Add(aCashMemo);
            }

            return showList;
        }

        public string UpdateData(List<objCashMemo> records, int intCashMemoID, string strPartyName, DateTime dteCashMemoDate, string strChequeNo, DateTime dteChequeIssueDate)
        {
            try
            {
                updateCashMemoTableAdapter adp = new updateCashMemoTableAdapter();
                tblLedgerTableAdapter adp2 = new tblLedgerTableAdapter();

                foreach (var x in records)
                {
                    if(x.monDue == 0) adp.UpdateCashMemo(intCashMemoID, dteCashMemoDate, strChequeNo, dteChequeIssueDate, x.monPaid, x.monTAX, x.monDiscount, x.monDue, false, x.intBillId, strPartyName);
                    else adp.UpdateCashMemo(intCashMemoID, dteCashMemoDate, strChequeNo, dteChequeIssueDate, x.monPaid, x.monTAX, x.monDiscount, x.monDue, true, x.intBillId, strPartyName);
                    adp2.PutLedgerData(intCashMemoID, x.intBillId, strPartyName, dteCashMemoDate, strChequeNo, dteChequeIssueDate, x.monPaid, x.monTAX, x.monDiscount, x.monPaid + x.monTAX + x.monDiscount, x.monDue, "CASH");
                }

                return "Cash Memo is created Successfully.";
            }
            catch (Exception e)
            {
                return "error";
            }

        }
    }
}