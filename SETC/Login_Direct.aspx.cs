using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login_Direct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            /*
            if (Util.DoLogin("admin", "office38265027") > 0)
            {
                Response.Redirect("User_Center.aspx");
                //Response.Redirect("Login.aspx");
            }
            */
        }
    }
}
