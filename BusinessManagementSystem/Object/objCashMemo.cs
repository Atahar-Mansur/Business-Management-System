using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.Object
{
    public class objCashMemo
    {
        public int intCashMemoID { get; set; }
        public int intBillId { get; set; }
        public string strPartyName { get; set; }
        public DateTime dteCashMemoDate { get; set; }
        public string strChequeNo { get; set; }
        public DateTime dteChequeIssueDate { get; set; }
        public double monPaid { get; set; }
        public double monDue { get; set; }
        public double monTAX { get; set; }
        public double monDiscount { get; set; }
        public double monTotal { get; set; }
    }
}