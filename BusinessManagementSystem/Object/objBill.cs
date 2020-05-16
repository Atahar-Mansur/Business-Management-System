using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.Object
{
    public class objBill
    {
        public int intBillId { get; set; }
        public DateTime dteDate { get; set; }
        public string strBOE { get; set; }
        public string strPartyName { get; set; }
        public string strPartyAddress { get; set; }
        public string strCurrency { get; set; }
        public string strRemark { get; set; }
    }
}