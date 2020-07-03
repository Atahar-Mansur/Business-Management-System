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
    public partial class CashMemo : System.Web.UI.Page
    {
        BLL_ChallanOut objData = new BLL_ChallanOut();
        BLL_CashMemo objCashMemo = new BLL_CashMemo();
        DataTable dt = new DataTable();
        List<NewClient> clients = new List<NewClient>();
        List<objCashMemo> billList = new List<objCashMemo>();
        List<objCashMemo> records = new List<objCashMemo>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["List"] = new List<objCashMemo>();

                clients = objData.GetClientData();
                drpPartyName.DataSource = clients;
                drpPartyName.DataBind();
                drpPartyName.DataTextField = "strName";
                drpPartyName.DataValueField = "strName";
                drpPartyName.DataBind();

                foreach( var x in objCashMemo.GetChallanList(drpPartyName.Text))
                    if (x.intBillId.ToString() == drpBill.Text) lblDueBalance.Text = x.monDue.ToString();
            }
        }

        protected void drpDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtPartyAddress.Text = objData.GetClientAddress(drpPartyName.Text);

            billList = objCashMemo.GetChallanList(drpPartyName.Text);
            drpBill.DataSource = billList;
            drpBill.DataBind();
            drpBill.DataTextField = "strPartyName";
            drpBill.DataValueField = "intBillId";
            drpBill.DataBind();

            foreach (var x in objCashMemo.GetChallanList(drpPartyName.Text))
                if (x.intBillId.ToString() == drpBill.Text) lblDueBalance.Text = x.monDue.ToString();
        }

        protected void drpPayType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(drpPayType.Text == "Cash")
            {
                divCheckNo.Visible = false;
                divCheckDate.Visible = false;
            }
            else
            {
                lblCheckNo.InnerText = drpPayType.Text + " No";

                divCheckNo.Visible = true;
                divCheckDate.Visible = true;
            }
        }
        protected void drpBill_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (var x in objCashMemo.GetChallanList(drpPartyName.Text))
                if (x.intBillId.ToString() == drpBill.Text) lblDueBalance.Text = x.monDue.ToString();
        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["List"] != null)
            {
                records = (List<objCashMemo>)Session["List"];
                records.RemoveAt(e.RowIndex);
                dgv.DataSource = records;
                dgv.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (addButtonVerification())
            {
                if (Session["List"] == null) records = new List<objCashMemo>();
                else records = (List<objCashMemo>)Session["List"];

                objCashMemo aCashMemo = new objCashMemo();
                aCashMemo.intBillId = Convert.ToInt32(drpBill.Text);
                aCashMemo.monTotal = Convert.ToDouble(lblDueBalance.Text);
                if (txtPaidAmount.Text != "") aCashMemo.monPaid = Convert.ToDouble(txtPaidAmount.Text);
                else aCashMemo.monPaid = 0;
                if (txtTAX.Text != "") aCashMemo.monTAX = Convert.ToDouble(txtTAX.Text);
                else aCashMemo.monTAX = 0;
                if(drpDiscount.Text == "Rest is Due")
                {
                    aCashMemo.monDiscount = 0;
                    aCashMemo.monDue = Math.Round(aCashMemo.monTotal - (aCashMemo.monPaid + aCashMemo.monTAX), 2);
                }
                else
                {
                    aCashMemo.monDue = 0;
                    aCashMemo.monDiscount = Math.Round(aCashMemo.monTotal - (aCashMemo.monPaid + aCashMemo.monTAX), 2);
                }
                records.Add(aCashMemo);

                dgv.DataSource = records;
                dgv.DataBind();

                if (Session["List"] != null) btnCreateCashMemo.Visible = true;
                else btnCreateCashMemo.Visible = false;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill Client fields.')", true);
            }
        }

        protected void btnCreateChallan_Click(object sender, EventArgs e)
        {
            if (createChallanButtonVerification())
            {
                if (txtCheckDate.Text == "") txtCheckDate.Text = "2020-06-29 00:00:11.900";

                records = (List<objCashMemo>)Session["List"];
                string sms = objCashMemo.UpdateData(records, Convert.ToInt32(txtReceiptNo.Text), drpPartyName.Text, Convert.ToDateTime(txtCashMemoDate.Text), txtCheckNo.Text, Convert.ToDateTime(txtCheckDate.Text));

                if (sms != "error")
                {
                    Session["List"] = new List<objCashMemo>();
                    records = (List<objCashMemo>)Session["List"];
                    dgv.DataSource = records;
                    dgv.DataBind();
                    btnCreateCashMemo.Visible = false;
                    clearData();
                }
                else sms = "Failed to create Cash Memo";

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sms + "')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fields can not be empty!!!.')", true);
            }
        }

        protected Boolean addButtonVerification()
        {
            if (drpPartyName.Text == "--Select a Client--") return false;
            return true;
        }

        protected Boolean createChallanButtonVerification()
        {
            if (txtReceiptNo.Text == "") return false;
            if (txtCashMemoDate.Text == "") return false;
            if (drpPartyName.Text == "--Select a Client--") return false;
            return true;
        }

        protected void clearData()
        {
            txtReceiptNo.Text = "";
            txtCashMemoDate.Text = "";
            txtCheckNo.Text = "";
            txtCheckDate.Text = "";
            txtPaidAmount.Text = "";
            txtTAX.Text = "";
            lblDueBalance.Text = "";
        }
    }
}