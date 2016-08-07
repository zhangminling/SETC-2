using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class User_Edit2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) 
        {
            string username = Convert.ToString(Session["UserName"]);
            int updateavatar = Util.UpdateAvatar(username);
            Image1.ImageUrl = Session["Avatar"].ToString();
            LabelUserID.Text = Request.QueryString["ID"];
            if (Session["RoleID"] != null && !String.IsNullOrEmpty(Session["RoleID"].ToString()) && (Session["RoleID"].ToString() == "1" || Session["RoleID"].ToString() == "2"))
            {
                Role.Enabled = true;
                PasswordPanel.Visible = true;
                init();
            }
            else
            {
                Role.Enabled = false;
                RolePanel.Visible = false;
                PasswordPanel.Visible = false;
            }
            using (SqlConnection conn = new DB().GetConnection()) 
            {
                string sql = "select * from Roles order by ID asc";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                Role.DataSource = rd;
                Role.DataTextField = "RoleName";
                Role.DataValueField = "ID";
                Role.DataBind();
                rd.Close();

               

                cmd.CommandText = "Select * from [Users] where ID = @UserID";
                cmd.Parameters.AddWithValue("@UserID", LabelUserID.Text);
                rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    Label1.Text = rd["UserName"].ToString();
                    TrueName.Text = rd["TrueName"].ToString();
                    Email.Text = rd["Email"].ToString();
                    Image1.ImageUrl = rd["Avatar"].ToString();
                    TelePhone.Text = rd["TelePhone"].ToString();
                    string roleID = rd["RoleID"].ToString();
                    if (Role.Items.FindByValue(roleID) != null)
                    {
                        Role.ClearSelection();
                        Role.Items.FindByValue(roleID).Selected = true;
                    }
                    int valid = Convert.ToInt32(rd["Valid"]);
                    if (valid == 1)
                    {
                        true1.Checked = true;
                    }
                    else 
                    {
                        false1.Checked = true;
                    }
                    
                    Status.Text = rd["Status"].ToString();
                    RegisterDateTime.Text = rd["RegisterDateTime"].ToString();
                    LastLoginDateTime.Text = rd["LastLoginDateTime"].ToString();
                }
                rd.Close();
            }
        }
    }

    private void init()
    {
        string UserID = Session["UserID"].ToString();
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from [Users] where [ID] = @UserID";
            cmd.Parameters.AddWithValue("@UserID", UserID);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Image1.ImageUrl = rd["Avatar"].ToString();
            }
            rd.Close();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            ResultLabel.Text = "";
            try
            {
                string fileName = FileUpload1.FileName;
                string extension = System.IO.Path.GetExtension(fileName).ToLower();
                string photoExtension = ConfigurationManager.AppSettings["PhotoExtension"].ToString();
                string[] ss = photoExtension.Split(',');
                bool success = false;
                foreach (string s in ss)
                {
                    if (extension.Equals(s.Trim()))
                    {
                        success = true;
                        break;
                    }
                }
                if (success)
                {
                    string now = DateTime.Now.ToString("yyyyMMddHHmmss");
                    string number = new Random().Next(1000).ToString();

                    // 头像的路径统一为根目录下的Users/Avatars目录下，这个文件夹，已经存在，不需要检查是否存在
                    string avatar = "Users/Avatars/" + now + "-" + number + extension;
                    FileUpload1.SaveAs(Server.MapPath("~/" + avatar));

                    using (SqlConnection conn = new DB().GetConnection())
                    {
                        SqlCommand cmd = (SqlCommand)conn.CreateCommand();
                        cmd.CommandText = "Update [Users] set Avatar = @Avatar where ID = @UserID";
                        cmd.Parameters.AddWithValue("@Avatar", avatar);
                        cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                        conn.Open();
                        int i = cmd.ExecuteNonQuery();
                        conn.Close();

                        if (i == 1)
                        {
                            Image1.ImageUrl = avatar;
                            Image AvatarImage = Master.FindControl("AvatarImage") as Image;
                            AvatarImage.ImageUrl = avatar;
                            ResultLabel.Text = "恭喜，头像上传成功！";
                        }
                        else
                        {
                            ResultLabel.Text = "头像上传失败，请重试或与管理员联系！";
                        }
                    }
                }
                else
                {
                    ResultLabel.Text = "头像文件的格式只能是 .jpg 、.png 或者.gif ！";
                }

            }
            catch (Exception exc)
            {
                // ResultLabel.Text = "上传文件失败。请重试！或者与管理员联系！<br>" + exc.ToString();
                // ResultLabel.Visible = true;
            }
        }
        else
        {
            ResultLabel.Text = "所选文件格式不符合要求";
        }


    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ErrorLabel.Text = "";
        int i = 0;
        using (SqlConnection conn = new DB().GetConnection()) 
        {
            string sql = "Update [Users] set TrueName=@TrueName,Email = @Email,RoleID = @RoleID,RoleName = @RoleName,Valid=@Valid,TelePhone = @TelePhone,Status = @Status where ID = @UserID";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@TrueName", TrueName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
            cmd.Parameters.AddWithValue("@TelePhone", TelePhone.Text.Trim());
            cmd.Parameters.AddWithValue("@Status", Status.Text);
            cmd.Parameters.AddWithValue("@UserID", LabelUserID.Text);
            cmd.Parameters.AddWithValue("@RoleID", Role.SelectedValue);
            cmd.Parameters.AddWithValue("@RoleName", Role.SelectedItem.Text);
            string radiobuttonvalue = "";
            if (true1.Checked)
            {
                radiobuttonvalue = true1.Text;
            }
            else if (false1.Checked)
            {
                radiobuttonvalue = false1.Text;
            }
            cmd.Parameters.AddWithValue("@Valid", radiobuttonvalue);
            conn.Open();
            i = cmd.ExecuteNonQuery();
            conn.Close();
        }
        if (i == 1)
        {
            ErrorLabel.Text = "用户信息更新成功！";
        }
        else
        {
            ErrorLabel.Text = "用户信息更新失败，请重试！";
        }
    }
   
}