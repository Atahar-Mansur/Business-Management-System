using BusinessManagementSystem.DAL.DAL_ProductsTableAdapters;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_NewProduct
    {
        public List<NewProduct> GetUnitData()
        {
            tblMeasurementUnitTableAdapter adp = new tblMeasurementUnitTableAdapter();
            List<NewProduct> showList = new List<NewProduct>();

            foreach (var x in adp.GetUnitData())
            {
                NewProduct product = new NewProduct();
                
                product.strUnit = x.strMeasurementUnit;

                showList.Add(product);
            }

            return showList;
        }

        public string PutData(List<NewProduct> records)
        {
            try
            {
                tblProductTableAdapter adp = new tblProductTableAdapter();

                foreach (var x in records)
                {
                    if (x.strProductURL != "") adp.PutData(x.strName, x.strDetails, x.strUnit, x.decUnitPerKG, x.strProductURL);
                    else adp.PutData(x.strName, x.strDetails, x.strUnit, x.decUnitPerKG, "http://localhost:53979/UI/ProductImage/defaultProduct.jpg");
                }

                return "New Product Is Added Successfully.";
            }
            catch (Exception e)
            {
                return "error";
            }

        }

        public string PutDataStock(List<NewProduct> records)
        {
            try
            {
                tblStockTableAdapter adp = new tblStockTableAdapter();
                tblStockRegisterTableAdapter adp2 = new tblStockRegisterTableAdapter();

                foreach (var x in records)
                {
                    adp.PutStockData(x.strName, x.intQuantity, x.strRemark);
                    adp2.PutBalanceData(x.strName, x.intQuantity, x.strRemark);
                }

                return "New Product Is Added Successfully.";
            }
            catch (Exception e)
            {
                return "error";
            }

        }
    }
}