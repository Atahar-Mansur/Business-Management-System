using BusinessManagementSystem.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BusinessManagementSystem.UI
{
    public partial class CurrentBalance : System.Web.UI.Page
    {
        BLL_CurrentBalance objData = new BLL_CurrentBalance();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            dt = objData.GetCurrentBalanceData();

            dgv.DataSource = dt;
            dgv.DataBind();
        }
    }
}