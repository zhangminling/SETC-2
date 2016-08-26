using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {            
            ErrorLabel.Text = "";
            UserName.Focus();
            Session["UserID"] = null;
            Session["UserName"] = null;            
            ImageButton1.ImageUrl = "ValidateCode.aspx?ID=" + new Random().Next(100);
            this.Form.DefaultButton = Button1.UniqueID;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["ValidateCode"] != null && Session["ValidateCode"].ToString().Equals(ValidateCode.Text.Trim()))
        {
            //执行用户登录
            int roleID = Util.DoLogin(UserName.Text.Trim(), Password.Text.Trim());
           
            if ( roleID == -1 )
            {
                ErrorLabel.Text = "用户名或密码错误！";
                Util.ShowMessage("登录失败！", "Login.aspx");                
            }
            else 
            {
                if (roleID == 1){
                    Util.ShowMessage("登录成功！", "User_Center.aspx");
                }else
                {
                    Util.ShowMessage("登录成功！", "User_Center.aspx");
                }
            }
            
        }
        else
        {
            ErrorLabel.Text = "验证码输入错误！";
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }    
}
