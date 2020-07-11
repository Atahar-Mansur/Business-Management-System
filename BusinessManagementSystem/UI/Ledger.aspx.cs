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
    public partial class Ledger : System.Web.UI.Page
    {
        BLL_ChallanOut objData = new BLL_ChallanOut();
        BLL_Ledger objData2 = new BLL_Ledger();
        List<NewClient> clients = new List<NewClient>();
        DataTable dt = new DataTable();

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
            if (showButtonVerification())
            {
                hideAllReports();

                if (drpReport.Text == "Bill")
                {
                    dt = objData2.GetBillReport(drpPartyName.Text, 10);

                    dgvBill.DataSource = dt;
                    dgvBill.DataBind();

                    headerBill.InnerText = "Last 10 Bill Transections";

                    divBill.Visible = true;
                }
                else if (drpReport.Text == "Cash Memo")
                {
                    dt = objData2.GetCashMemoReport(drpPartyName.Text, 10);

                    dgvCashMemo.DataSource = dt;
                    dgvCashMemo.DataBind();

                    headerCashMemo.InnerText = "Last 10 Cash Memo";

                    divCashMemo.Visible = true;
                }
                else if (drpReport.Text == "Compare Bill and Cash Memo")
                {
                    dt = objData2.GetLedgerReport(drpPartyName.Text, 10);

                    dgvLedger.DataSource = dt;
                    dgvLedger.DataBind();

                    headerLedger.InnerText = "Last 10 Transections";

                    divLedger.Visible = true;
                }
                else
                {
                    txtDueBalance.InnerText = objData2.GetCurrentBalance(drpPartyName.Text);
                    if (Convert.ToDouble(txtDueBalance.InnerText) <= 0) txtCurrentStatus.InnerText = "Clear Payment";
                    else txtCurrentStatus.InnerText = "Due Payment";
                    txtDueBills.InnerText = objData2.GetBills(drpPartyName.Text);

                    dt = objData2.GetBillReport(drpPartyName.Text, 1);

                    dgvBill.DataSource = dt;
                    dgvBill.DataBind();

                    headerBill.InnerText = "Last Bill Transections";

                    dt = objData2.GetCashMemoReport(drpPartyName.Text, 1);

                    dgvCashMemo.DataSource = dt;
                    dgvCashMemo.DataBind();

                    headerCashMemo.InnerText = "Last Cash Memo";

                    divCurrentStatus.Visible = true;
                    divBill.Visible = true;
                    divCashMemo.Visible = true;
                }
            }
            else ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill all required.')", true);
        }

        protected void btnBill_Click(object sender, EventArgs e)
        {
            dt = objData2.GetBillReport(drpPartyName.Text, 1000);

            dgvBill.DataSource = dt;
            dgvBill.DataBind();

            headerBill.InnerText = "Al Bill Transections";
        }

        protected void btnCashMemo_Click(object sender, EventArgs e)
        {
            dt = objData2.GetCashMemoReport(drpPartyName.Text, 1000);

            dgvCashMemo.DataSource = dt;
            dgvCashMemo.DataBind();

            headerCashMemo.InnerText = "All Cash Memo";
        }

        protected void btnLedger_Click(object sender, EventArgs e)
        {
            dt = objData2.GetLedgerReport(drpPartyName.Text, 10);

            dgvLedger.DataSource = dt;
            dgvLedger.DataBind();

            headerLedger.InnerText = "All Transections";
        }

        protected Boolean showButtonVerification()
        {
            if (drpPartyName.Text == "--Select a Client--") return false;
            return true;
        }

        protected void hideAllReports()
        {
            divBill.Visible = false;
            divCashMemo.Visible = false;
            divCurrentStatus.Visible = false;
            divLedger.Visible = false;
        }
    }
}