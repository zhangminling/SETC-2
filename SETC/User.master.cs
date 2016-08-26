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
                string username = Convert.ToString(Session["UserName"]);
                int roleID = Util.UpdateAvatar(username);
                AvatarImage.ImageUrl = Session["Avatar"].ToString();
                AvatarImage1.ImageUrl = Session["Avatar"].ToString();
                if (roleID == 1)
                {
                    AdminUser.Visible = true;
                    EditorArctile.Visible = true;
                    FilePanel.Visible = true;
                    ClassPanel.Visible = true;
                    FocusPanel.Visible = true;
                    MenuPanel.Visible = true;
                    UserTagPanel.Visible = true;
                  
                }
                else if (roleID == 2)
                {
                    
                    AdminUser.Visible = false;
                    EditorArctile.Visible = true;
                    FilePanel.Visible = false;
                    ClassPanel.Visible = true;
                    FocusPanel.Visible = false;
                    MenuPanel.Visible = true;
                    UserTagPanel.Visible = false;
                  
                }
                else if (roleID == 3)
                {
                    AdminUser.Visible = false;
                    EditorArctile.Visible = false;
                    FilePanel.Visible = false;
                    ClassPanel.Visible = false;
                    FocusPanel.Visible = false;
                    MenuPanel.Visible = false;
                    UserTagPanel.Visible = false;
                 
                }
                else if (roleID == 4)
                {
                    AdminUser.Visible = false;
                    EditorArctile.Visible = false;
                    FilePanel.Visible = false;
                    ClassPanel.Visible = false;
                    FocusPanel.Visible = false;
                    MenuPanel.Visible = false;
                    UserTagPanel.Visible = false;
                   
                }
                else 
                {
                    AdminUser.Visible = false;
                    EditorArctile.Visible = false;
                    FilePanel.Visible = false;
                    ClassPanel.Visible = false;
                    FocusPanel.Visible = false;
                    MenuPanel.Visible = false;
                    UserTagPanel.Visible = false;
                   
                }
              
            }
        }
       
        
    }
}
  

