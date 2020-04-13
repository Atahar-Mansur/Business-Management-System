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
    public partial class OutChallan : System.Web.UI.Page
    {
        BLL_ChallanOut objData = new BLL_ChallanOut();
        DataTable dt = new DataTable();
        List<ChallanOut> records = new List<ChallanOut>();
        List<NewProduct> products = new List<NewProduct>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["List"] = new List<ChallanOut>();

                lblChallanNo.Text = objData.GetChallanNo();

                products = objData.GetProductData();
                drpDetails.DataSource = products;
                drpDetails.DataBind();
                drpDetails.DataTextField = "strName";
                drpDetails.DataValueField = "strName";
                drpDetails.DataBind();
            }
        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["List"] != null)
            {
                records = (List<ChallanOut>)Session["List"];
                records.RemoveAt(e.RowIndex);
                dgv.DataSource = records;
                dgv.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (addButtonVerification())
            {
                if (Session["List"] == null) records = new List<ChallanOut>();
                else records = (List<ChallanOut>)Session["List"];

                ChallanOut aChallan = new ChallanOut();
                aChallan.strDetails = drpDetails.Text;
                aChallan.intQuantity = Convert.ToInt32(txtQuantity.Text);
                aChallan.strRemarks = txtRemark.Text;
                aChallan.strPurchNo = txtPurchNo.Text;
                aChallan.dtePurchDate = DateTime.Parse(txtPurchDate.Text);
                records.Add(aChallan);

                dgv.DataSource = records;
                dgv.DataBind();

                if (Session["List"] != null) btnCreateChallan.Visible = true;

                clearAddData();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill Details and Quantity fields.')", true);
            }
        }

        protected void btnCreateChallan_Click(object sender, EventArgs e)
        {
            if (createChallanButtonVerification())
            {
                records = (List<ChallanOut>)Session["List"];
                string sms = objData.PutData(records, Convert.ToInt32(lblChallanNo.Text), txtChallanInName.Text, txtChallanInAddress.Text, DateTime.Parse(txtChallanInDate.Text), txtLCNo.Text, DateTime.Parse(txtLCdate.Text));

                if (sms != "error")
                {
                    Session["List"] = new List<ChallanOut>();
                    records = (List<ChallanOut>)Session["List"];
                    dgv.DataSource = records;
                    dgv.DataBind();
                    btnCreateChallan.Visible = false;
                    clearData();
                    lblChallanNo.Text = (Convert.ToInt32(lblChallanNo.Text)+1).ToString();
                }
                else sms = "Failed to create challan";

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sms + "')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fields can not be empty!!!.')", true);
            }
        }

        protected Boolean addButtonVerification()
        {
            if (txtQuantity.Text == "") return false;
            if (txtPurchNo.Text == "") return false;
            if (txtPurchDate.Text == "") return false;
            return true;
        }

        protected Boolean createChallanButtonVerification()
        {
            if (txtChallanInName.Text == "") return false;
            if (txtChallanInDate.Text == "") return false;
            if (txtLCNo.Text == "") return false;
            if (txtLCdate.Text == "") return false;
            return true;
        }

        protected void clearData()
        {
            txtChallanInName.Text = "";
            txtChallanInAddress.Text = "";
            txtChallanInDate.Text = "";
            txtQuantity.Text = "";
            txtRemark.Text = "";
            txtPurchNo.Text = "";
            txtPurchDate.Text = "";
            txtLCNo.Text = "";
            txtLCdate.Text = "";
        }

        protected void clearAddData()
        {
            txtQuantity.Text = "";
            txtRemark.Text = "";
            txtPurchNo.Text = "";
            txtPurchDate.Text = "";
        }
    }
}