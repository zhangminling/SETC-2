using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.IO;

public partial class User_Avatar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RandomID.Text = Request["RandomID"];
        if (!IsPostBack)
        { 
            if ( Session["UserID"] ==  null )
            {
                Util.ShowMessage("会话超期，请重新登录", "Login.aspx");
            }
            else
            {
              using (SqlConnection conn = new DB().GetConnection()) 
                {
                    string userid = Convert.ToString(Session["UserID"]);
                    string sql = "select * from UserTags order by ID desc";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    TagsList.DataSource = rd;
                    TagsList.DataTextField = "TagName";
                    TagsList.DataValueField = "ID";
                    TagsList.DataBind();
                    rd.Close();
                }
            }
            init();
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
                        cmd.CommandText = "Update [Users] set Avatar = @Avatar where RandomID = @RandomID";
                        cmd.Parameters.AddWithValue("@Avatar", avatar);
                        cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
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
        string tags = "";
        int k = 0;
        for (int i = 0; i <= TagsList.Items.Count - 1; i++)
        {
            if (TagsList.Items[i].Selected == true)
            {
                tags += "," + TagsList.Items[i].Value;
                k++;
            }
        }
        tags = tags.Substring(1);
        string[] USERTAGID = new string[10];
        string[] USERTAGNAME = new string[10];
        string USERID = "";
        string USERNAME = "";
        int p;
        using (SqlConnection conn = new DB().GetConnection()) 
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from UserTags where ID in (" + tags + ") order by ID desc  ";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            for (p = 0; p <= k - 1; p++)
            {
                if (rd.Read())
                {
                    USERTAGID[p] = rd["ID"].ToString();
                    USERTAGNAME[p] = rd["TagName"].ToString();

                }
            }
            rd.Close();


            cmd.CommandText = "select * from Users  where RandomID = @RandomID";
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            SqlDataReader rd1 = cmd.ExecuteReader();
            if (rd1.Read())
            {
                USERID = rd1["ID"].ToString();
                USERNAME = rd1["UserName"].ToString();

            }
            rd1.Close();

            for (int j = 0; j <= k - 1; j++) 
            {
            StringBuilder sb = new StringBuilder("insert into Users_UserTags(UserID,UserName,UserTagID,TagName )");
            sb.Append(" values ( @UserID,@UserName,@UserTagID,@TagName ) ");
            SqlCommand cmd1 = new SqlCommand(sb.ToString(), conn);
            cmd1.Parameters.AddWithValue("@UserID", USERID);
            cmd1.Parameters.AddWithValue("@UserName", USERNAME);
            cmd1.Parameters.AddWithValue("@UserTagID", USERTAGID[j]);
            cmd1.Parameters.AddWithValue("@TagName", USERTAGNAME[j]);
            cmd1.ExecuteNonQuery();
            }
            conn.Close();
            Response.Write("<script language='javascript'> alert('操作成功');</script>");
        }
        
        }
}
