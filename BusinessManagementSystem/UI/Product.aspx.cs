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
                Session["List"] = new List<NewProduct>();
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
                aProduct.strProductURL = txtProductImageURL.Text;
                records.Add(aProduct);

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
            records = (List<NewProduct>)Session["List"];
            string sms = objData.PutData(records);

            if (sms != "error")
            {
                Session["List"] = new List<NewProduct>();
                records = (List<NewProduct>)Session["List"];
                dgv.DataSource = records;
                dgv.DataBind();
                btnCreateChallan.Visible = false;
                clearData();
            }
            else sms = "Failed to add the item";

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sms + "')", true);
        }

        protected Boolean addButtonVerification()
        {
            if (txtName.Text == "") return false;
            if (txtDetails.Text == "") return false;
            return true;
        }

        protected void clearData()
        {
            txtName.Text = "";
            txtDetails.Text = "";
            txtProductImageURL.Text = "";
        }
    }
}