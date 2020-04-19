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
    public partial class Client : System.Web.UI.Page
    {
        BLL_NewClient objData = new BLL_NewClient();
        DataTable dt = new DataTable();
        List<NewClient> records = new List<NewClient>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["List"] = new List<NewClient>();
            }
        }

        protected void dgv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (Session["List"] != null)
            {
                records = (List<NewClient>)Session["List"];
                records.RemoveAt(e.RowIndex);
                dgv.DataSource = records;
                dgv.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (addButtonVerification())
            {
                if (Session["List"] == null) records = new List<NewClient>();
                else records = (List<NewClient>)Session["List"];

                NewClient aClient = new NewClient();
                aClient.strName = txtName.Text;
                aClient.strEmail = txtEmail.Text;
                aClient.strMobileNo = txtPhoneNumber.Text;
                aClient.strAddress = txtAddress.Text;
                records.Add(aClient);

                dgv.DataSource = records;
                dgv.DataBind();

                if (Session["List"] != null) btnCreateChallan.Visible = true;

                clearData();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please fill Name and Mobile No fields.')", true);
            }
        }

        protected void btnCreateChallan_Click(object sender, EventArgs e)
        {
            records = (List<NewClient>)Session["List"];
            string sms = objData.PutData(records);

            if (sms != "error")
            {
                Session["List"] = new List<NewClient>();
                records = (List<NewClient>)Session["List"];
                dgv.DataSource = records;
                dgv.DataBind();
                btnCreateChallan.Visible = false;
                clearData();
            }
            else sms = "Failed to enter the clients";

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + sms + "')", true);
        }

        protected Boolean addButtonVerification()
        {
            if (txtName.Text == "") return false;
            if (txtPhoneNumber.Text == "") return false;
            return true;
        }

        protected void clearData()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhoneNumber.Text = "";
            txtAddress.Text = "";
        }
    }
}