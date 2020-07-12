using BusinessManagementSystem.DAL.DAL_ChallanInTableAdapters;
using BusinessManagementSystem.DAL.DAL_ProductionTableAdapters;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BusinessManagementSystem.BLL
{
    public class BLL_Production
    {
        public double GetUnitPerKG(string strProductName)
        {
            double UnitPerKG = 1;
            getUnitPerKGTableAdapter adp = new getUnitPerKGTableAdapter();
            
            foreach(var x in adp.GetUnitPerKG(strProductName))
            {
                UnitPerKG = x.decUnitPerKG;
            }

            return UnitPerKG;
        }

        public string PutData(DateTime dteProductionDate, string strRowMet, double decRowMet, string strRemarkRow, List<NewProduct> records)
        {
            try
            {
                insertIntoProductionTableAdapter adp = new insertIntoProductionTableAdapter();
                sprInsertStockRegisterTableAdapter adp2 = new sprInsertStockRegisterTableAdapter();

                adp.InsertIntoProduction(dteProductionDate, strRowMet, decRowMet, strRemarkRow, "OUT");
                adp2.PutBalanceData(4, 50, "Production", dteProductionDate, strRowMet, Convert.ToInt32(decRowMet), strRemarkRow);
                foreach (var x in records)
                {
                    adp.InsertIntoProduction(dteProductionDate, x.strDetails, x.intQuantity, x.strRemark, "IN");
                    adp2.PutBalanceData(3, 50, "Production", dteProductionDate, x.strDetails, x.intQuantity, x.strRemark);
                }

                return "Bill is created successfully.";
            }
            catch (Exception e)
            {
                return "error";
            }
        }
    }
}