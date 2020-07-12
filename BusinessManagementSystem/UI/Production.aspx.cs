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
    public partial class Production : System.Web.UI.Page
    {
        BLL_ChallanIn objData = new BLL_ChallanIn();
        BLL_Production objProduction = new BLL_Production();
        DataTable dt = new DataTable();
        List<NewProduct> records = new List<NewProduct>();
        List<NewProduct> products = new List<NewProduct>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["List"] = new List<NewProduct>();

                products = objData.GetProductData();

                drpDetails.DataSource = products;
                drpDetails.DataBind();
                drpDetails.DataTextField = "strName";
                drpDetails.DataValueField = "strName";
                drpDetails.DataBind();

                drpRowPro.DataSource = products;
                drpRowPro.DataBind();
                drpRowPro.DataTextField = "strName";
                drpRowPro.DataValueField = "strName";
                drpRowPro.DataBind();
            }
        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["List"] != null)
            {
                records = (List<NewProduct>)Session["List"];
                records.RemoveAt(e.RowIndex);
                dgv.DataSource = records;
                dgv.DataBind();

                double total = 0;
                foreach (var x in records) total += x.decTotal;
                lblTotal.InnerText = "Total " + drpRowPro.Text + " is used = " + Math.Round(total, 3).ToString() + " KG";
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (addButtonVerification())
            {
                if (Session["List"] == null) records = new List<NewProduct>();
                else records = (List<NewProduct>)Session["List"];

                NewProduct aProduct = new NewProduct();
                aProduct.strDetails = drpDetails.Text;
                aProduct.intQuantity = Convert.ToInt32(txtQuantity.Text);
                aProduct.decUnitPerKG = objProduction.GetUnitPerKG(drpDetails.Text);
                aProduct.decTotal = Math.Round(aProduct.intQuantity / aProduct.decUnitPerKG , 3);
                aProduct.strRemark = txtRemark.Text;
                records.Add(aProduct);

                dgv.DataSource = records;
                dgv.DataBind();

                double total = 0;
                foreach (var x in records) total += x.decTotal;
                lblTotal.InnerText = "Total " + drpRowPro.Text + " is used = " + Math.Round(total, 3).ToString() + " KG";

                divTotal.Visible = true;
                if (Session["List"] != null) btnCreateChallan.Visible = true;
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Some fields needs to fill up.')", true);
            }
        }

        protected void btnCreateChallan_Click(object sender, EventArgs e)
        {
            if (createChallanButtonVerification())
            {
                records = (List<NewProduct>)Session["List"];
                string sms = "";

                double total = 0;
                foreach (var x in records) total += x.decTotal;

                sms = objProduction.PutData(DateTime.Parse(txtProductionDate.Text), drpRowPro.Text, total, txtRowRemark.Text, records);

                if (sms != "error")
                {
                    Session["List"] = new List<NewProduct>();
                    records = (List<NewProduct>)Session["List"];
                    dgv.DataSource = records;
                    dgv.DataBind();
                    clearData();
                }
                else sms = "Failed to enter Production";

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
            if (drpDetails.Text == "--Select a Product--") return false;
            if (drpRowPro.Text == "--Select a Product--") return false;
            return true;
        }

        protected Boolean createChallanButtonVerification()
        {
            if (txtProductionDate.Text == "") return false;
            return true;
        }

        protected void clearData()
        {
            txtProductionDate.Text = "";
            txtRowRemark.Text = "";
            txtQuantity.Text = "";
            txtRemark.Text = "";

            btnCreateChallan.Visible = false;
            divTotal.Visible = false;
        }
    }
}