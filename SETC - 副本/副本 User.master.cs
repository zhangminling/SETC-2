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
        if (Session["RoleID"] == null)
        {
            Util.ShowMessage("用户登录超时，请重新登录！", "Login.aspx");
        }
        else {
            int roleID = Convert.ToInt16(Session["RoleID"].ToString());
            AvatarImage.ImageUrl = Session["Avatar"].ToString();
            // RoleID=1,Administrator;RoleID=2,Editor;RoleID=3,Contributor;RoleID=4,Author;
            switch (roleID)
            {
                case 1 : 
                    LiArticles.Visible = true;                    
                    btn_create.Visible = true;
                    LiUsers.Visible = true;
                    break;
                case 2:
                    LiArticles.Visible = true;                    
                    btn_create.Visible = true;
                    LiUsers.Visible = true;
                    break;
                case 3:
                    LiArticles.Visible = true;
                    btn_create.Visible = true;
                    LiUsers.Visible = false;
                    break;
                default:
                    LiArticles.Visible = false;
                    btn_create.Visible = false;
                    LiUsers.Visible = false;
                    break;

            }
            if (!IsPostBack)
            {                
            }
        }
    }
}
