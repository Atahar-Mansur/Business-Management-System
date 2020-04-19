using BusinessManagementSystem.BLL;
using BusinessManagementSystem.Object;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace BusinessManagementSystem.UI
{
    public partial class InChallan : System.Web.UI.Page
    {
        BLL_ChallanIn objData = new BLL_ChallanIn();
        DataTable dt = new DataTable();
        List<ChallanIn> records = new List<ChallanIn>();
        List<NewProduct> products = new List<NewProduct>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["List"] = new List<ChallanIn>();

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
                records = (List<ChallanIn>)Session["List"];
                records.RemoveAt(e.RowIndex);
                dgv.DataSource = records;
                dgv.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (addButtonVerification())
            {
                if (Session["List"] == null) records = new List<ChallanIn>();
                else records = (List<ChallanIn>)Session["List"];

                ChallanIn aChallan = new ChallanIn();
                aChallan.strDetails = drpDetails.Text;
                aChallan.intQuantity = Convert.ToInt32(txtQuantity.Text);
                aChallan.strRemarks = txtRemark.Text;
                records.Add(aChallan);

                dgv.DataSource = records;
                dgv.DataBind();

                if (Session["List"] != null) btnCreateChallan.Visible = true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill Details and Quantity fields.')", true);
            }
        }

        protected void btnCreateChallan_Click(object sender, EventArgs e)
        {
            if(createChallanButtonVerification())
            {
                records = (List<ChallanIn>)Session["List"];
                string sms = objData.PutData(records, Convert.ToInt32(txtChallanNo.Text), txtChallanInName.Text, txtChallanInAddress.Text, DateTime.Parse(txtChallanInDate.Text));

                if (sms != "error")
                {
                    Session["List"] = new List<ChallanIn>();
                    records = (List<ChallanIn>)Session["List"];
                    dgv.DataSource = records;
                    dgv.DataBind();
                    btnCreateChallan.Visible = false;
                    clearData();
                }
                else sms = "Failed to enter challan";

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+ sms +"')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Fields can not be empty!!!.')", true);
            }
        }

        protected Boolean addButtonVerification()
        {
            if (txtQuantity.Text == "") return false;
            if (drpDetails.Text == "--Select a Product--") return false;
            return true;
        }

        protected Boolean createChallanButtonVerification()
        {
            if (txtChallanInName.Text == "" && txtChallanNo.Text == "") return false;
            if (txtChallanInDate.Text == "") return false;
            return true;
        }

        protected void clearData()
        {
            txtChallanNo.Text = "";
            txtChallanInName.Text = "";
            txtChallanInAddress.Text = "";
            txtChallanInDate.Text = "";
            txtQuantity.Text = "";
            txtRemark.Text = "";
        }
    }
}