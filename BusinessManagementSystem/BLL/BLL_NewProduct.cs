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
        public string PutData(List<NewProduct> records)
        {
            try
            {
                tblProductTableAdapter adp = new tblProductTableAdapter();

                foreach (var x in records)
                {
                    if (x.strProductURL != "") adp.PutData(x.strName, x.strDetails, x.strProductURL);
                    else adp.PutData(x.strName, x.strDetails, "http://localhost:53979/UI/ProductImage/defaultProduct.jpg");
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