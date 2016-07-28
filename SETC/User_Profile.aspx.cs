using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class User_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ResultLabel.Text = "";
        
        if (!IsPostBack)
        {
            if(!String.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                UserIDLabel.Text = Request.QueryString["ID"];
                if (Session["UserID"] != null && (Session["UserID"].ToString().Equals(Request.QueryString["ID"]) || Convert.ToInt16(Session["RoleID"]) ==1) )
                {
                    ControlPanel.Visible = true;
                }
                else
                {
                    ControlPanel.Visible = false;
                }
                MyDataBind();
            }
        }
    }

    protected void MyDataBind()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            SqlDataReader rd;            
            cmd.CommandText = "select * from Users where ID= " + UserIDLabel.Text;
            conn.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                UserNameLabel.Text = rd["UserName"].ToString();
                BigNameLabel.Text = rd["UserName"].ToString();
            }
            rd.Close();

            cmd.CommandText = "select * from Profiles where UserID = " + UserIDLabel.Text + " order by ID desc";
            rd = cmd.ExecuteReader();            
            if (rd.Read())
            {
                if(!String.IsNullOrEmpty(rd["BigName"].ToString())){
                    BigNameLabel.Text = rd["BigName"].ToString();
                }
                BigImage.ImageUrl = rd["BigPhotoSrc"].ToString();
                IntroductionLabel.Text = rd["Introduction"].ToString();
                BoxTop.Text = rd["BoxTop"].ToString();
                BoxLeft.Text = rd["BoxLeft"].ToString();
                BoxHeight.Text = rd["BoxHeight"].ToString();
                BoxWidth.Text = rd["BoxWidth"].ToString();
                BoxOpacity.Text = rd["BoxOpacity"].ToString();
            }
            rd.Close();
        }
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(UserIDLabel.Text))
        {
            DoUpload(UserIDLabel.Text);
        }
    }

    protected void DoUpload(string userID)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                string fileName = FileUpload1.FileName;
                string extension = System.IO.Path.GetExtension(fileName).ToLower();
                string allowExtension = ConfigurationManager.AppSettings["PhotoExtension"].ToString();
                if (allowExtension.Contains(extension))
                {
                    string now = DateTime.Now.ToString("yyyyMMdd_HHmmss");
                    string number = String.Format("{0:0000}", new Random().Next(1000));//生产****四位数的字符串
                    string physicalName = "Users/" + userID + "/" + now + "_" + number + extension;
                    //int fileSize = FileUpload1.PostedFile.ContentLength / 1024 ;
                    //if (fileSize == 0) fileSize = 1;                   
                    FileUpload1.SaveAs(Server.MapPath(physicalName));
                    using (SqlConnection conn = new DB().GetConnection())
                    {
                        string profileID = "";
                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandText = "select ID from Profiles where UserID = " + userID + " order by ID desc";
                        conn.Open();
                        SqlDataReader rd = cmd.ExecuteReader();
                        if (rd.Read())
                        {
                            profileID = rd["ID"].ToString();
                        }
                        rd.Close();

                        cmd = conn.CreateCommand();
                        if (String.IsNullOrEmpty(profileID))
                        {
                            cmd.CommandText = "insert into Profiles( UserID,BigPhotoSrc) values( @UserID,@BigPhotoSrc )";
                            cmd.Parameters.AddWithValue("@UserID", userID);
                            cmd.Parameters.AddWithValue("@BigPhotoSrc", physicalName);
                        }
                        else
                        {
                            cmd.CommandText = "update Profiles set BigPhotoSrc = @BigPhotoSrc where ID = @ID";
                            cmd.Parameters.AddWithValue("@BigPhotoSrc", physicalName);
                            cmd.Parameters.AddWithValue("@ID", profileID);
                        }                       
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    BigImage.ImageUrl = physicalName;
                    //MyDataBind();
                }
                else
                {
                    ResultLabel.Text = "上传图片格式错误！";
                    ResultLabel.Visible = true;
                }
            }
            catch (Exception exc)
            {
                ResultLabel.Text = "上传图片失败。请重试！或者与管理员联系！<br>" + exc.ToString();
                ResultLabel.Visible = true;
            }
        }
        else
        {
            ResultLabel.Text = "所选图片格式不符合要求";
            ResultLabel.Visible = true;
        }

    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            string sql = "update Profiles set BigName = @BigName,BigPhotoSrc=@BigPhotoSrc,Introduction=@Introduction,BoxTop=@BoxTop,BoxLeft=@BoxLeft,BoxWidth=@BoxWidth,BoxHeight=@BoxHeight,BoxOpacity=@BoxOpacity where UserID = @UserID";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@BigName", BigNameLabel.Text);
            cmd.Parameters.AddWithValue("@BigPhotoSrc", BigImage.ImageUrl);
            cmd.Parameters.AddWithValue("@Introduction", IntroductionLabel.Text);
            cmd.Parameters.AddWithValue("@BoxTop", BoxTop.Text);
            cmd.Parameters.AddWithValue("@BoxLeft", BoxLeft.Text);
            cmd.Parameters.AddWithValue("@BoxWidth", BoxWidth.Text);
            cmd.Parameters.AddWithValue("@BoxHeight", BoxHeight.Text);
            cmd.Parameters.AddWithValue("@BoxOpacity", BoxOpacity.Text);
            cmd.Parameters.AddWithValue("@UserID", UserIDLabel.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
    protected void ProfileLinkButton_Click(object sender, EventArgs e)
    {
        if (ProfileLinkButton.Text.Equals("编辑"))
        {
            BigNameLabel.Visible = false;
            BigNameTextBox.Text = BigNameLabel.Text;
            BigNameTextBox.Visible = true;
            StatusLabel.Visible = false;
            StatusTextBox.Text = StatusLabel.Text;
            StatusTextBox.Visible = true;
            IntroductionLabel.Visible = false;
            IntroductionTextBox.Text = IntroductionLabel.Text.Replace("<br/>", "\n").Replace("&nbsp;", " ");
            IntroductionTextBox.Visible = true;
            ProfileLinkButton.Text = "完成";

        }
        else
        {
            ProfileLinkButton.Text = "编辑";
            BigNameLabel.Visible = true;
            BigNameLabel.Text = BigNameTextBox.Text;
            BigNameTextBox.Visible = false;
            StatusLabel.Visible = true;
            StatusLabel.Text = StatusTextBox.Text;
            StatusTextBox.Visible = false;

            IntroductionLabel.Visible = true;
            IntroductionLabel.Text = IntroductionTextBox.Text.Replace("\n", "<br/>").Replace(" ", "&nbsp;");
            IntroductionTextBox.Visible = false;
        }
    }
}
