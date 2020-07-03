using BusinessManagementSystem.DAL.DAL_BillTableAdapters;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_Bill
    {
        public string GetBillNo()
        {
            tblBillTableAdapter adp = new tblBillTableAdapter();
            long billNo = 0;
            foreach (var x in adp.GetBillNo())
            {
                billNo = x.intBillId;
            }
            billNo++;
            return billNo.ToString();
        }

        public List<NewProduct> GetCurrencyData()
        {
            List<NewProduct> currency = new List<NewProduct>();
            tblCurrencyTableAdapter adp = new tblCurrencyTableAdapter();

            foreach (var x in adp.GetCurrencyData())
            {
                NewProduct singleCurrency = new NewProduct();

                singleCurrency.strName = x.strCurrency;
                singleCurrency.strUnit = x.strCurrencyIcon;

                currency.Add(singleCurrency);
            }

            return currency;
        }

        public List<NewClient> GetChallanList(string strPartyName)
        {
            tblChallanListTableAdapter adp = new tblChallanListTableAdapter();
            List<NewClient> showList = new List<NewClient>();

            foreach (var x in adp.GetChallanList(strPartyName))
            {
                NewClient client = new NewClient();

                client.strName = x.strPartyNameDetails;
                client.intClientId = Convert.ToInt32(x.intChallanId);

                showList.Add(client);
            }

            return showList;
        }

        public DataTable GetTableData(string challans)
        {
            DataTable dt = new DataTable();
            tblBillDataTableAdapter adp = new tblBillDataTableAdapter();

            dt = adp.GetTableData(challans);

            return dt;
        }

        public void UpdateTableRow(string strChallanNo, string strDetails, Double monUnitPrice, Double monPrice)
        {
            updateRowDataTableAdapter adp = new updateRowDataTableAdapter();
            adp.UpdateTableRow(monUnitPrice, monPrice, Convert.ToInt32(strChallanNo), strDetails);
        }

        public string UpdateBill(objBill aBill, string challans, string total)
        {
            try
            {
                updateBillTableAdapter adp = new updateBillTableAdapter();
                insertToCashMemoTableAdapter adp2 = new insertToCashMemoTableAdapter();

                adp.UpdateBill(aBill.intBillId, aBill.dteDate, aBill.strBOE, aBill.strPartyAddress, aBill.strCurrency, aBill.strRemark, challans);
                adp2.InsertToCashMemo(aBill.intBillId, aBill.strPartyName, Convert.ToDouble(total));

                return "Bill is created successfully.";
            }
            catch (Exception e)
            {
                return "error";
            }
        }

        public string GetTotal(string challans)
        {
            tblBillDataTableAdapter adp = new tblBillDataTableAdapter();
            Double total = 0;

            foreach(var x in adp.GetTableData(challans))
            {
                total = total + x.monTotalPrice;
            }

            return total.ToString();
        }
    }
}