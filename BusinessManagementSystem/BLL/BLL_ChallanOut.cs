using BusinessManagementSystem.DAL.DAL_ChallanInTableAdapters;
using BusinessManagementSystem.DAL.DAL_ChallanOutTableAdapters;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_ChallanOut
    {
        public List<NewProduct> GetProductData()
        {
            tblChallanInTableAdapter adp = new tblChallanInTableAdapter();
            List<NewProduct> showList = new List<NewProduct>();

            foreach (var x in adp.GetProductData())
            {
                NewProduct product = new NewProduct();

                product.intProductId = Convert.ToInt32(x.intProductId);
                product.strName = x.strProductName;

                showList.Add(product);
            }

            return showList;
        }

        public string GetChallanNo()
        {
            tblGetChallanNoTableAdapter adp = new tblGetChallanNoTableAdapter();
            long challanNo = 0;
            foreach (var x in adp.GetChallanNo())
            {
                challanNo = x.intChallanId;
            }
            challanNo++;
            return challanNo.ToString();
        }

        public string PutData(List<ChallanOut> records, int intChallanNo, string strPartyName, string strAddress, DateTime dteDate, string strLCNo, DateTime dteLCDate)
        {
            try
            {
                tblChallanOutTableAdapter adp = new tblChallanOutTableAdapter();
                sprInsertStockRegisterTableAdapter adp2 = new sprInsertStockRegisterTableAdapter();

                foreach (var x in records)
                {
                    adp.PutData(intChallanNo, strPartyName, strAddress, dteDate, x.strDetails, x.intQuantity, x.strRemarks, x.strPurchNo, x.dtePurchDate, strLCNo, dteLCDate);
                    adp2.PutBalanceData(2, intChallanNo, strPartyName, dteDate, x.strDetails, x.intQuantity, x.strRemarks);
                }

                return "Challan is created Successfully.";
            }
            catch (Exception e)
            {
                return "error";
            }

        }

        public string GetCurrentBalance(string strProductName)
        {
            tblStockRegisterTableAdapter adp = new tblStockRegisterTableAdapter();
            string strCurrentBalance = "";
            foreach (var x in adp.GetCurrentBalanceData(strProductName))
            {
                strCurrentBalance = x.intBalance.ToString();
            }
            return strCurrentBalance;
        }
    }
}