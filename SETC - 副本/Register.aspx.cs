using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.IO;

public partial class Register : System.Web.UI.Page
{
    //chenxilian :定义UserId,默认值为0
    string UserID = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            UserName.Focus();
        }
    }
    private string Check()
    {
        int i=0;
        string [] s = new string[6];
        s[0] = "";
        s[1] = "用户名和密码不能为空！";
        s[2] = "用户名和密码的长度不能短于2个字符且不超过20个字符！";
        s[3] = "用户名和密码只能由中文、英文字母、数字及下划线_组成！";
        s[4] = "用户名已经存在，请输入另外一个用户名！";
        s[5] = "用户注册失败，系统原因，请与管理员联系！";
        string userNameStr = UserName.Text;
        string passwordStr = Password.Text;
        if ((!String.IsNullOrEmpty(userNameStr)) && (!String.IsNullOrEmpty(passwordStr)))
        {
            if (userNameStr.Trim().Length > 1 && userNameStr.Trim().Length < 21 && passwordStr.Trim().Length > 2 && passwordStr.Trim().Length < 21)
            {
                if (AlreadyExisted(userNameStr.Trim()))
                {
                    i = 4;//第五种情况，用户名已经存在
                }
                else
                {
                    int j = DoRegist(userNameStr.Trim(), passwordStr.Trim());
                    if (j == 1)
                    {                        
                        Util.DoLogin(userNameStr.Trim(), passwordStr.Trim());         
                        Util.ShowMessage("恭喜注册成功！", "User_Avatar.aspx");
                    }
                    else
                    {
                        i = 5;//第六种情况，系统原因，用户注册失败
                    }
                }
            }
            else
            {
                i = 2; //第三种情况
            }
        }
        else
        {
            i = 1;//第二种情况，用户名密码为空
        }
        return s[i];
    }

    private int DoRegist(string u,string p)
    {
        int i = 0;
        int r = new Random().Next(10);
        string avatar = @"images/avatars/" + r + ".png";
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("insert into [Users]( UserName,Password,Email,Avatar,Status,RoleID,RoleName,Grade,Shows,Articles,Credits,RegisterDateTime,LastLoginDateTime,Valid )");
            sb.Append(" values ( @UserName,@Password,@Email,@Avatar,@Status,@RoleID,@RoleName,@Grade,@Shows,@Articles,@Credits,@RegisterDateTime,@LastLoginDateTime,@Valid ) ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@UserName", u);
            cmd.Parameters.AddWithValue("@Password", Util.GetHash(p));//密码加密
            cmd.Parameters.AddWithValue("@Email", Email.Text);
            cmd.Parameters.AddWithValue("@Avatar", avatar);
            cmd.Parameters.AddWithValue("@Status", "");
            cmd.Parameters.AddWithValue("@RoleID", 4); // 角色中，RoleID为4
            cmd.Parameters.AddWithValue("@RoleName", "Author"); // 角色，RoleName为Author，即成员
            cmd.Parameters.AddWithValue("@Grade", "幼儿园");
            cmd.Parameters.AddWithValue("@Shows", 0);
            cmd.Parameters.AddWithValue("@Articles", 0);
            cmd.Parameters.AddWithValue("@Credits", 0);

            cmd.Parameters.AddWithValue("@RegisterDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@LastLoginDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@Valid", 1);
            conn.Open();
            i = cmd.ExecuteNonQuery();
            cmd.Dispose();
        }
        return i;
    }

    private bool AlreadyExisted(string param)
    {
        bool a = false;

        using (SqlConnection conn = new DB().GetConnection())
        {
            string sql = "select id from [Users] where UserName = @UserName";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserName", param);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                a = true;
            }
            rd.Close();
        }

        return a;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ErrorLabel.Text = Check();        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    
}
