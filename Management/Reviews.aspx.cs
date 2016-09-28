using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_Reviews : System.Web.UI.Page
{
    protected string GetBooleanText (object booleanValue)
    {
        bool authorized = (bool)booleanValue;
        if(authorized)
        {
            return "Yes";
        }
        else
        {
            return "No";
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string genreId = Request.QueryString.Get("Id");
            if (!string.IsNullOrEmpty(genreId))
            {
                DropDownList1.DataBind();
                ListItem myItem = DropDownList1.Items.FindByValue(genreId);
                if (myItem != null)
                    myItem.Selected = true;
            }
        }        
    }
}