using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;

public partial class User_Avatar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ( Session["UserID"] ==  null )
            {
                Util.ShowMessage("会话超期，请重新登录", "Login.aspx");
            }
            else
            {
                init();
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
                    if(extension.Equals(s.Trim()))
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
        Response.Redirect("User_Center.aspx");
    }
}
