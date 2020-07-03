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
    public partial class Bill : System.Web.UI.Page
    {
        BLL_ChallanOut objData = new BLL_ChallanOut();
        BLL_Bill objBill = new BLL_Bill();
        DataTable dt = new DataTable();
        List<NewClient> clients = new List<NewClient>();
        List<NewProduct> currency = new List<NewProduct>();
        List<Bill> bills = new List<Bill>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblBillNo.Text = objBill.GetBillNo();

                clients = objData.GetClientData();
                drpChallanInName.DataSource = clients;
                drpChallanInName.DataBind();
                drpChallanInName.DataTextField = "strName";
                drpChallanInName.DataValueField = "strName";
                drpChallanInName.DataBind();

                currency = objBill.GetCurrencyData();
                drpCurrency.DataSource = currency;
                drpCurrency.DataBind();
                drpCurrency.DataTextField = "strName";
                drpCurrency.DataValueField = "strName";
                drpCurrency.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            hdnChallanNo.Text = hdnChallanNo.Text + "," + drpChallanNo.Text;

            dgv.DataSource = objBill.GetTableData(hdnChallanNo.Text);
            dgv.DataBind();

            lblTotal.InnerText = objBill.GetTotal(hdnChallanNo.Text);

            btnCreateChallan.Visible = true;
            divTotal.Visible = true;
        }

        protected void btnCreateChallan_Click(object sender, EventArgs e)
        {
            objBill aBill = new objBill();
            string sms = "";

            if (createBillButtonVerification())
            {
                aBill.intBillId = Convert.ToInt32(lblBillNo.Text);
                aBill.dteDate = Convert.ToDateTime(txtBillDate.Text);
                aBill.strBOE = txtBOE.Text;
                aBill.strPartyName = drpChallanInName.Text;
                aBill.strPartyAddress = txtChallanInAddress.Text;
                aBill.strCurrency = drpCurrency.Text;
                aBill.strRemark = txtRemark.Text;

                sms = objBill.UpdateBill(aBill, hdnChallanNo.Text, lblTotal.InnerText);

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sms + "')", true);

                clearData();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fields can not be empty!!!.')", true);
            }
            
        }

        protected void drpDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtChallanInAddress.Text = objData.GetClientAddress(drpChallanInName.Text);

            clients = objBill.GetChallanList(drpChallanInName.Text);
            drpChallanNo.DataSource = clients;
            drpChallanNo.DataBind();
            drpChallanNo.DataTextField = "strName";
            drpChallanNo.DataValueField = "intClientId";
            drpChallanNo.DataBind();
        }

        protected void dgv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                dgv.EditIndex = rowIndex;
                dgv.DataSource = objBill.GetTableData(hdnChallanNo.Text);
                dgv.DataBind();
            }
            else if (e.CommandName == "DeleteRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                string strChallanNo = ((Label)dgv.Rows[rowIndex].FindControl("lblChallanNo")).Text;

                string str = hdnChallanNo.Text;

                hdnChallanNo.Text = str.Replace(strChallanNo,"");
                
                dgv.DataSource = objBill.GetTableData(hdnChallanNo.Text);
                dgv.DataBind();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                dgv.EditIndex = -1;
                dgv.DataSource = objBill.GetTableData(hdnChallanNo.Text);
                dgv.DataBind();
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

                string strChallanNo = ((Label)dgv.Rows[rowIndex].FindControl("lblChallanNo")).Text;
                string strDetails = ((Label)dgv.Rows[rowIndex].FindControl("lblDetails")).Text;

                if (((TextBox)dgv.Rows[rowIndex].FindControl("txtUnitPrice")).Text == "") ((TextBox)dgv.Rows[rowIndex].FindControl("txtUnitPrice")).Text = "0";
                Double monUnitPrice = Convert.ToDouble(((TextBox)dgv.Rows[rowIndex].FindControl("txtUnitPrice")).Text);
                Double monPrice = Convert.ToDouble(((TextBox)dgv.Rows[rowIndex].FindControl("txtUnitPrice")).Text) * Convert.ToInt32(((Label)dgv.Rows[rowIndex].FindControl("lblQuantity")).Text);

                objBill.UpdateTableRow(strChallanNo, strDetails, monUnitPrice, monPrice);

                dgv.EditIndex = -1;
                dgv.DataSource = objBill.GetTableData(hdnChallanNo.Text);
                dgv.DataBind();

                lblTotal.InnerText = objBill.GetTotal(hdnChallanNo.Text);
            }
        }

        protected Boolean createBillButtonVerification()
        {
            if (txtBillDate.Text == "") return false;
            if (txtBOE.Text == "") return false;
            if (txtChallanInAddress.Text == "") return false;
            if (drpChallanInName.Text == "--Select a Client--") return false;
            return true;
        }

        protected void clearData()
        {
            hdnChallanNo.Text = "";
            dgv.DataSource = objBill.GetTableData(hdnChallanNo.Text);
            dgv.DataBind();
            btnCreateChallan.Visible = false;
            divTotal.Visible = false;
            clients = objBill.GetChallanList(drpChallanInName.Text);
            drpChallanNo.DataSource = clients;
            drpChallanNo.DataBind();
            drpChallanNo.DataTextField = "strName";
            drpChallanNo.DataValueField = "intClientId";
            drpChallanNo.DataBind();
        }
    }
}