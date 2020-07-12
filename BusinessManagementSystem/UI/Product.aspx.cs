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
    public partial class Product : System.Web.UI.Page
    {
        BLL_NewProduct objData = new BLL_NewProduct();
        DataTable dt = new DataTable();
        List<NewProduct> records = new List<NewProduct>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["List"] = new List<NewProduct>();

                records = objData.GetUnitData();
                drpUnit.DataSource = records;
                drpUnit.DataBind();
                drpUnit.DataTextField = "strUnit";
                drpUnit.DataValueField = "strUnit";
                drpUnit.DataBind();
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
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (addButtonVerification())
            {
                if (Session["List"] == null) records = new List<NewProduct>();
                else records = (List<NewProduct>)Session["List"];

                NewProduct aProduct = new NewProduct();
                aProduct.strName = txtName.Text;
                aProduct.strDetails = txtDetails.Text;
                aProduct.strUnit = drpUnit.Text;
                aProduct.decUnitPerKG = Convert.ToDouble(txtUnitPerKG.Text);
                aProduct.strProductURL = txtProductImageURL.Text;
                aProduct.intQuantity = Convert.ToInt32(txtQuantity.Text);
                aProduct.strRemark = txtProductRemark.Text;
                records.Add(aProduct);

                dgv.DataSource = records;
                dgv.DataBind();

                if (Session["List"] != null) btnCreateChallan.Visible = true;

                clearData();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill Details and Quantity fields.')", true);
            }
        }

        protected void btnCreateChallan_Click(object sender, EventArgs e)
        {
            records = (List<NewProduct>)Session["List"];
            string sms = objData.PutData(records);
            sms = objData.PutDataStock(records);

            if (sms != "error")
            {
                Session["List"] = new List<NewProduct>();
                records = (List<NewProduct>)Session["List"];
                dgv.DataSource = records;
                dgv.DataBind();
                btnCreateChallan.Visible = false;
                clearData();
            }
            else sms = "Failed to add the items";

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sms + "')", true);
        }

        protected Boolean addButtonVerification()
        {
            if (txtName.Text == "") return false;
            if (txtDetails.Text == "") return false;
            if (txtQuantity.Text == "") return false;
            if (txtUnitPerKG.Text == "") return false;
            return true;
        }

        protected void clearData()
        {
            txtName.Text = "";
            txtDetails.Text = "";
            txtProductImageURL.Text = "";
            txtQuantity.Text = "";
            txtUnitPerKG.Text = "";
            txtProductRemark.Text = "";
        }
    }
}