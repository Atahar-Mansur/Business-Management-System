using BusinessManagementSystem.DAL.DAL_ChallanInTableAdapters;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_ChallanIn
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

        public string PutData(List<ChallanIn> records, int intChallanID, string strPartyName, string strAddress, DateTime dteDate)
        {
            try
            {
                tblChallanInPutDataTableAdapter adp = new tblChallanInPutDataTableAdapter();

                foreach (var x in records)
                {
                    adp.PutData(intChallanID, strPartyName, strAddress, dteDate, x.strDetails, x.intQuantity, x.strRemarks);
                }

                return "Challan is stocked in Successfully.";
            }
            catch (Exception e)
            {
                return "error";
            }
            
        }
    }
}