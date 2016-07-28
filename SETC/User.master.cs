using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class User : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["RoleID"] == null || Session["UserID"] == null)
            {
                Util.ShowMessage("用户登录超时，请重新登录！", "Login.aspx");
            }
            else
            {
                int roleID = Convert.ToInt16(Session["RoleID"].ToString());
                AvatarImage.ImageUrl = Session["Avatar"].ToString();
                AvatarImage1.ImageUrl = Session["Avatar"].ToString(); 
              
            }
        }
        
    }
}
  

