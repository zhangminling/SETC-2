using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Configuration;

public partial class User_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        UserName.Focus();
       
        using (SqlConnection conn = new DB().GetConnection())
        {
            string userid = Convert.ToString(Session["UserID"]);
            string sql1 = "select * from Roles order by ID asc";
            SqlCommand cmd1 = new SqlCommand(sql1, conn);
            conn.Open();
            SqlDataReader rd1 = cmd1.ExecuteReader();
            Role.DataSource = rd1;
            Role.DataTextField = "RoleName";
            Role.DataValueField = "ID";
            Role.DataBind();
            rd1.Close();

            string sql = "select * from UserTags where UserID = @UserID order by ID desc";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserID", userid);
            SqlDataReader rd = cmd.ExecuteReader();
            TagsList.DataSource = rd;
            TagsList.DataTextField = "TagName";
            TagsList.DataValueField = "ID";
            TagsList.DataBind();
            rd.Close();
        }
      
        }
    }
  

    protected void Button1_Click(object sender, EventArgs e)
    {
        ErrorLabel.Text = "";
        int i = 0;
        string p = Password.Text.Trim();
        using (SqlConnection conn = new DB().GetConnection()) 
        {
            StringBuilder sb = new StringBuilder("insert into [Users]( UserName,TrueName,Password,Email,TelePhone,Status,RoleID,RoleName,RegisterDateTime,LastLoginDateTime,Valid)");
            sb.Append(" values ( @UserName,@TrueName,@Password,@Email,@TelePhone,@Status,@RoleID,@RoleName,@RegisterDateTime,@LastLoginDateTime,@Valid ) ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@UserName", UserName.Text.Trim());
            cmd.Parameters.AddWithValue("@TrueName", TrueName.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", Util.GetHash(p));
            cmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
            cmd.Parameters.AddWithValue("@TelePhone", TelePhone.Text.Trim());
            cmd.Parameters.AddWithValue("@Status", Status.Text);
            cmd.Parameters.AddWithValue("@RoleID", Role.SelectedValue);
            cmd.Parameters.AddWithValue("@RoleName", Role.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@RegisterDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@LastLoginDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@Valid", 1);

            StringBuilder sb1 = new StringBuilder("insert into [Users_UserTags]( UserName,TrueName,Password,Email,TelePhone,Status,RoleID,RoleName,RegisterDateTime,LastLoginDateTime,Valid)");
            conn.Open();
            i=cmd.ExecuteNonQuery();
            cmd.Dispose();

         
        }
        if (i == 1)
        {
            ErrorLabel.Text = "用户信息更新成功！";
            RegisterDateTime.Text = DateTime.Now.ToString();
            LastLoginDateTime.Text = DateTime.Now.ToString();
        }
        else
        {
            ErrorLabel.Text = "用户信息更新失败，请重试！";
        }
    }
  
}