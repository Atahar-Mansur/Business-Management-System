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
    public partial class PrintChallan : System.Web.UI.Page
    {
        BLL_ChallanOut objData = new BLL_ChallanOut();
        DataTable dt = new DataTable();
        List<NewClient> clients = new List<NewClient>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clients = objData.GetClientData();
                drpPartyName.DataSource = clients;
                drpPartyName.DataBind();
                drpPartyName.DataTextField = "strName";
                drpPartyName.DataValueField = "strName";
                drpPartyName.DataBind();
            } 
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {

        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}