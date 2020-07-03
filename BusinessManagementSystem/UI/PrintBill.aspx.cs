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
    public partial class PrintBill : System.Web.UI.Page
    {
        BLL_ChallanOut objData = new BLL_ChallanOut();
        BLL_PrintBill objData2 = new BLL_PrintBill();
        ConvertNumberToWord objdata3 = new ConvertNumberToWord();
        DataTable dt = new DataTable();
        List<NewClient> clients = new List<NewClient>();

        protected void Page_Load(object sender, EventArgs e)
        {
            clients = objData.GetClientData();
            drpPartyName.DataSource = clients;
            drpPartyName.DataBind();
            drpPartyName.DataTextField = "strName";
            drpPartyName.DataValueField = "strName";
            drpPartyName.DataBind();
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            if (showButtonVerification())
            {
                if (btnShow.Text == "Search") searchVisible();
                else backVisible();

                string partyName = drpPartyName.Text;
                if (partyName == "--Select a Client--") partyName = "";

                dt = objData2.GetChallanBasicData(partyName, txtBillNo.Text, txtBOENo.Text);

                dgv.DataSource = dt;
                dgv.DataBind();
            }
            else ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill all required.')", true);
        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dgv.Visible = false;
            containerPrint.Visible = true;
            btnPrint.Visible = true;
            btnDelete.Visible = true;

            string partyName = drpPartyName.Text;
            if (partyName == "--Select a Client--") partyName = "";

            dt = objData2.GetChallanBasicData(partyName, txtBillNo.Text, txtBOENo.Text);

            lblBillNo.Text = dt.Rows[e.RowIndex].Field<long>("intBillId").ToString();
            lblBillDate.Text = dt.Rows[e.RowIndex].Field<string>("dteBillDate");
            lblPartyName.Text = dt.Rows[e.RowIndex].Field<string>("strPartyName");
            lblPartyAddress.Text = dt.Rows[e.RowIndex].Field<string>("strPartyAddress");
            lblBOENo.Text = dt.Rows[e.RowIndex].Field<string>("strBOE").ToString();

            dt = objData2.GetTableData(lblPartyName.Text, lblBillNo.Text, lblBOENo.Text);
            dgv2.DataSource = dt;
            dgv2.DataBind();

            lblTotal.InnerText = objData2.GetTotal(lblPartyName.Text, lblBillNo.Text, lblBOENo.Text).ToString();
            lblCurrency.InnerText = objData2.GetCurrency(lblPartyName.Text, lblBillNo.Text, lblBOENo.Text);
            lblPiW.InnerText = lblCurrency.InnerText + " " + objdata3.ConvertAmount(Convert.ToDouble(lblTotal.InnerText)) + " Only.";

            lblChallans.Text = objData2.GetChallansNo(lblPartyName.Text, lblBillNo.Text, lblBOENo.Text);
            lblChallansDate.Text = objData2.GetChallansDate(lblPartyName.Text, lblBillNo.Text, lblBOENo.Text);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            txtDeleteReason.Visible = true;
            btnConfirm.Visible = true;
            btnDelete.Visible = false;
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            string msg;

            msg = objData2.DeleteChallan(lblPartyName.Text, lblBillNo.Text, lblBOENo.Text, txtDeleteReason.Text);

            backVisible();

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

        protected Boolean showButtonVerification()
        {
            return true;
        }

        protected void searchVisible()
        {
            btnShow.Text = "Back";
            btnShow.CssClass = "btn btn-danger pr-5 pl-5 text-right";
            infoDiv.Visible = false;

            dgv.Visible = true;
            containerPrint.Visible = false;
            btnPrint.Visible = false;
            btnDelete.Visible = false;
            txtDeleteReason.Visible = false;
            btnConfirm.Visible = false;
        }

        protected void backVisible()
        {
            btnShow.Text = "Search";
            btnShow.CssClass = "btn btn-info pr-5 pl-5 text-right";
            infoDiv.Visible = true;

            dgv.Visible = false;
            containerPrint.Visible = false;
            btnPrint.Visible = false;
            btnDelete.Visible = false;
            txtDeleteReason.Visible = false;
            btnConfirm.Visible = false;
        }
    }
}