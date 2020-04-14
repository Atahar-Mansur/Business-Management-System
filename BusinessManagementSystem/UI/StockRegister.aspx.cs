using BusinessManagementSystem.BLL;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusinessManagementSystem.UI
{
    public partial class StockRegister : System.Web.UI.Page
    {
        BLL_ChallanIn objData = new BLL_ChallanIn();
        BLL_StockRegister objData2 = new BLL_StockRegister();
        DataTable dt = new DataTable();
        List<NewProduct> products = new List<NewProduct>();
        protected void Page_Load(object sender, EventArgs e)
        {
            products = objData.GetProductData();
            drpProducts.DataSource = products;
            drpProducts.DataBind();
            drpProducts.DataTextField = "strName";
            drpProducts.DataValueField = "strName";
            drpProducts.DataBind();
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            dt = objData2.GetStockData(drpProducts.Text, Convert.ToDateTime(txtFromDate.Text), Convert.ToDateTime(txtToDate.Text));

            dgv.DataSource = dt;
            dgv.DataBind();
        }
    }
}