using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

public partial class Article_Add : System.Web.UI.Page
{
    //上传封面图后更新数据表Resources用到的数据
    string ResourceName = "";
    string extension = "";
    string physicalName = "";
    string fileName = "";

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
                string UserID = Session["UserID"].ToString();
                string UserDict = "~/Users/" + UserID;
                //string FullPath = UserDict + "/Uploads";
                if (!Directory.Exists(Server.MapPath(UserDict)))
                {
                    Directory.CreateDirectory(UserDict);
                }

                //Editor1.SetSecurityGalleryPath(Server.MapPath("~/Users/"));
                /*
                int RoleID = Convert.ToInt16(Session["RoleID"]);
                if (RoleID == 1 || RoleID == 2)
                {
                    Editor1.SetSecurityGalleryPath(Server.MapPath("~/Users/"));
                }
                else
                {
                    Editor1.SetSecurityGalleryPath(Server.MapPath(UserDict));
                }
                */


                if (Request.QueryString["ID"] != null && !String.IsNullOrEmpty(Request.QueryString["ID"].ToString()))
                {
                    // 修改文章
                    IDLabel.Text = Request.QueryString["ID"].ToString(); //选择哪个文章的ID
                    MyInitForUpdate();//调用函数
                }
                else
                {
                    // 新增文章                
                    MyInitForAdd();  
                    RandomID.Text = "";//第一次加载页面，为空
                }
            }

        }
    }
    // 修改文章函数
    private void MyInitForUpdate()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Cats order by Orders desc";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Cats.DataSource = rd;
            Cats.DataValueField = "ID";
            Cats.DataTextField = "CatName";
            Cats.DataBind();
            rd.Close();

                    
             cmd.CommandText = "select * from UserTags where classify=0 order by ID asc";
            rd = cmd.ExecuteReader();
            UserTag.DataSource = rd;
            UserTag.DataTextField = "TagName";
            UserTag.DataValueField = "ID";
            UserTag.DataBind();
            rd.Close();
            int RoleID = Convert.ToInt16(Session["RoleID"].ToString());
            if (RoleID > 2)
            {
                cmd.Parameters.AddWithValue("@Status", 0); //状态：新投稿/待审核=0，审核已过=1，审核未过=2            

            }
            else
            {
                cmd.Parameters.AddWithValue("@Status", 1); //状态：新投稿/待审核=0，审核已过=1，审核未过=2      
            }

            cmd.CommandText = "select max(Orders) as orders from Articles";
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                MaxOrders.Text = rd[0].ToString();
            }
            rd.Close();


            string SubID = "";
            cmd.CommandText = "select * from Articles where ID =" + IDLabel.Text;
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                TitleTB.Text = rd["Title"].ToString();
                string CatID = rd["CatID"].ToString();
                if (Cats.Items.FindByValue(CatID) != null)
                {
                    Cats.ClearSelection();
                    Cats.Items.FindByValue(CatID).Selected = true;
                }
                SubID = rd["SubID"].ToString();
                CDT_TextBox.Text = String.Format("{0:yyyy-MM-dd}", rd["CDT"]);
                Orders.Text = rd["Orders"].ToString();
                Editor1.Text = rd["Content"].ToString();
                CoverPhoto.ImageUrl=rd["CoverImageURL"].ToString();
                RandomID.Text = rd["RandomID"].ToString();
            }
            rd.Close();



            cmd.CommandText = "select * from Subs where CatID = " + Cats.SelectedValue + " order by Orders desc";
            rd = cmd.ExecuteReader();
            Subs.DataSource = rd;
            Subs.DataTextField = "SubName";
            Subs.DataValueField = "ID";
            Subs.DataBind();
            rd.Close();


            if (Subs.Items.Count > 0)
            {
                Subs.Visible = true;
                if (Subs.Items.FindByValue(SubID) != null)
                {
                    Subs.ClearSelection();
                    Subs.Items.FindByValue(SubID).Selected = true;
                }
            }
            else
            {
                Subs.Visible = false;
            }
        }
    }

    private void MyInitForAdd()
    {
        CDT_TextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Cats order by Orders desc";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Cats.DataSource = rd;
            Cats.DataValueField = "ID";
            Cats.DataTextField = "CatName";
            Cats.DataBind();
            rd.Close();


            cmd.CommandText = "select * from UserTags where classify=0 order by ID asc";
            rd = cmd.ExecuteReader();
            UserTag.DataSource = rd;
            UserTag.DataTextField = "TagName";
            UserTag.DataValueField = "ID";
            UserTag.DataBind();
            rd.Close();


            cmd.CommandText = "select max(Orders) as orders from Articles";
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                MaxOrders.Text = rd[0].ToString();
            }
            rd.Close();

            cmd.CommandText = "select * from Subs where CatID = " + Cats.SelectedValue + " order by Orders desc";
            rd = cmd.ExecuteReader();
            Subs.DataSource = rd;
            Subs.DataTextField = "SubName";
            Subs.DataValueField = "ID";
            Subs.DataBind();
            rd.Close();
        }

    }
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                ResourceName = FileUpload1.FileName;
                extension = System.IO.Path.GetExtension(ResourceName).ToLower();
                string allowExtension = ConfigurationManager.AppSettings["PhotoExtension"].ToString().ToLower();

                string[] ss = allowExtension.Split(',');
                bool success = false;
                foreach (string s in ss)
                {
                    if (extension.Equals(s.Trim()))
                    {
                        success = true;
                        break;
                    }
                }

                if (success && Session["UserID"] != null)
                {
                    string dir = "upload" + "/" + DateTime.Now.ToString("yyyyMM");

                    // 目录不存在,则创建目录
                    if (!Directory.Exists(Server.MapPath(dir)))
                    {
                        Directory.CreateDirectory(Server.MapPath(dir));
                    }

                    string now = DateTime.Now.ToString("yyyyMMdd_HHmmss");
                    string number = String.Format("{0:0000}", new Random().Next(1000));//生产****四位数的字符串
                    fileName = Session["UserID"].ToString() + "_" + now + "_" + number + extension;
                    physicalName = dir + "/" + Session["UserID"].ToString() + "_" + now + "_" + number + extension;

                    //int fileSizeInMB = FileUpload1.PostedFile.ContentLength / (1024*1024) ;
                    //if (fileSizeInMB == 0) fileSizeInMB = 1;         

                    // 保存图片到服务器
                    FileUpload1.SaveAs(Server.MapPath(physicalName));

                    //在数据表Resources插入一条记录操作
                    InsertDataBase();

                    /*
                    using (SqlConnection conn = new DB().GetConnection())
                    {
                        SqlCommand cmd = conn.CreateCommand();
                        if (String.IsNullOrEmpty(RandomID.Text))
                        {
                            RandomID.Text = Guid.NewGuid().ToString();
                            cmd.CommandText = "insert into Shows( CoverPhotoURL,RandomID ) values( @CoverPhotoURL,@RandomID )";
                            cmd.Parameters.AddWithValue("@CoverPhotoURL", physicalName);
                            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
                        }
                        else
                        {
                            cmd.CommandText = "update Shows set CoverPhotoURL = @CoverPhotoURL where RandomID = @RandomID";
                            cmd.Parameters.AddWithValue("@CoverPhotoURL", physicalName);
                            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
                        }
                        
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                    */
                    if (!String.IsNullOrEmpty(CoverPhoto.ImageUrl))
                    {
                        File.Delete(Server.MapPath(CoverPhoto.ImageUrl));
                    }

                    CoverPhoto.ImageUrl = physicalName;

                    //MyDataBind();
                }
                else
                {
                    ResultLabel.Text = "上传图片格式错误！";
                    ResultLabel.Visible = true;
                    ResultLabel.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception exc)
            {
                ResultLabel.Text = "上传图片失败。请重试！或者与管理员联系！<br>" + exc.ToString();
                ResultLabel.Visible = true;
                ResultLabel.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            ResultLabel.Text = "请选择封面图片";
            ResultLabel.Visible = true;
        }

    }

    //在数据表Resources插入一条记录操作
    protected bool InsertDataBase()
    {
        bool result = false;

        using (SqlConnection conn = new DB().GetConnection())
        {
            //向resources插入一条记录操作
            StringBuilder sb = new StringBuilder("Insert into Resources (ResourceName,FileName,FilePath,FileSizeInKB,FileType,Extentsion,FolderID,FolderName,UserID,CDT,Status,UserName,Valid)");
            sb.Append(" values(@ResourceName,@FileName,@FilePath,@FileSize,@FileType,@Extentsion,@FolderID,@FolderName,@UserID,@CDT,@Status,@UserName,@Valid)");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@ResourceName", ResourceName);
            cmd.Parameters.AddWithValue("@FileName", fileName);
            cmd.Parameters.AddWithValue("@FilePath", physicalName);
            cmd.Parameters.AddWithValue("@FileSize", 0);
            cmd.Parameters.AddWithValue("@FileType", "图片");
            cmd.Parameters.AddWithValue("@Extentsion", extension);
            cmd.Parameters.AddWithValue("@FolderID", 101);
            cmd.Parameters.AddWithValue("@FolderName", "封面图");
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", 0);
            cmd.Parameters.AddWithValue("@Valid", 1);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            conn.Open();
            cmd.CommandText = "SELECT count(*) from Resources where FolderID =101";
            int count = int.Parse(Convert.ToString(cmd.ExecuteScalar()));
            cmd.CommandText = "Update ResourceFolders set Counts = " + count.ToString() + " where ID = 101";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            //插入成功
            result = true;
        }
        return result;
    }
   
   


    //退出编辑
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("User_Zoon.aspx");
    }

   

    // 预览
    protected void Button2_Click(object sender, EventArgs e)
    {
        int i = 0;
        if (String.IsNullOrEmpty(RandomID.Text))
        {
            RandomID.Text = Guid.NewGuid().ToString();
            i = DoInsert(0);
        }
        else
        {
            i = DoUpdate(0);
        }


    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Response.Redirect("Article_Add.aspx");
    }

    // 保存并提交文章
    protected void Button3_Click(object sender, EventArgs e)
    {
        int i = 0;
        if (String.IsNullOrEmpty(RandomID.Text))
        {
            RandomID.Text = Guid.NewGuid().ToString();
            i = DoInsert(1);

        }
        else
        {
            i = DoUpdate(1);
        }

        if (i == 1)
        {
            ResultLabel.Text = "保存文章成功！";
            ResultLabel.ForeColor = System.Drawing.Color.Green;
            //Timer1.Enabled = true;            
        }
        else
        {
            ResultLabel.Text = "保存文章失败，请重试！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
        }
    } 
    // 保存草稿
    protected void Button1_Click(object sender, EventArgs e)
    {
        int i = 0;
        if (String.IsNullOrEmpty(RandomID.Text))
        {
            RandomID.Text = Guid.NewGuid().ToString();
            i = DoInsert(0);
        }
        else
        {
            i = DoUpdate(0);
        }

        if (i == 1)
        {
            ResultLabel.Text = "保存草稿成功！";
            ResultLabel.ForeColor = System.Drawing.Color.Green;
         
        }
        else
        {
            ResultLabel.Text = "保存草稿失败，请重试！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
        }
    }



    //添加作品文件
    protected void NextButton_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(RandomID.Text))
        {
            Response.Redirect("ShowItem_Man.aspx?RandomID=" + RandomID.Text);
        }
        else
        {
            ResultLabel.Text = "上传并保存提交之后，才能进入下一步！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
            ResultLabel.Visible = true;
        }
    }

    // 插入操作
    private int DoInsert(int finished)
    {
        int i = 0;

        int SubID = 0;
        String SubName = "";

        if (Subs.Items.Count > 0 && Subs.SelectedValue != null)
        {
            SubID = Convert.ToInt16(Subs.SelectedValue);
            SubName = Subs.SelectedItem.Text;
        }

        String cdt = DateTime.Now.ToString();
        if (!String.IsNullOrEmpty(CDT_TextBox.Text.Trim()))
        {
            cdt = CDT_TextBox.Text;
        }
        //插入到校园网的表
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Insert into Articles ( Title,Content,CatID,CatName,SubID,SubName,AuthorID,Author,TagName,CDT,LDT,Status,Valid,AuditorID,Auditor,AuditedDateTime,ViewTimes,ReviewTimes,Orders,Finished,CoverImageURL,RandomID,StatusName) ");
            sb.Append(" values ( @Title,@Content,@CatID,@CatName,@SubID,@SubName,@AuthorID,@Author,@TagName,@CDT,@LDT,@Status,@Valid,@AuditorID,@Auditor,@AuditedDateTime,@ViewTimes,@ReviewTimes,@Orders,@Finished,@CoverImageURL,@RandomID,@StatusName) ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text);
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);
            
            cmd.Parameters.AddWithValue("@CoverImageURL", CoverPhoto.ImageUrl);
            cmd.Parameters.AddWithValue("@TagName", UserTag.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Author", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", cdt);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);

            // RoleID={1,Administrator},{2,Editor},{3,Contributor},{4,Author}

           
            int RoleID = Convert.ToInt16(Session["RoleID"].ToString());
            if (RoleID > 2)
            {
                cmd.Parameters.AddWithValue("@Status", 0); //状态：新投稿/待审核=0，审核已过=1，审核未过=2            
                cmd.Parameters.AddWithValue("@StatusName", "未审核");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Status", 1); //状态：新投稿/待审核=0，审核已过=1，审核未过=2   
                cmd.Parameters.AddWithValue("@StatusName", "审核通过");
            }
           
            cmd.Parameters.AddWithValue("@Valid", 1);
            cmd.Parameters.AddWithValue("@AuditorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Auditor", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@AuditedDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@ViewTimes", 0);
            cmd.Parameters.AddWithValue("@ReviewTimes", 0);
            cmd.Parameters.AddWithValue("@Orders", Orders.Text);
            cmd.Parameters.AddWithValue("@Finished", finished);
            RandomID.Text = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            i = cmd.ExecuteNonQuery();

        }
        //同时数据插入到微信的表
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Insert into Articles2 ( Title,Content,CatID,CatName,SubID,SubName,AuthorID,Author,CDT,LDT,Status,AuditorID,Auditor,AuditedDateTime,ViewTimes,ReviewTimes,Orders,Finished,RandomID) ");
            sb.Append(" values ( @Title,@Content,@CatID,@CatName,@SubID,@SubName,@AuthorID,@Author,@CDT,@LDT,@Status,@AuditorID,@Auditor,@AuditedDateTime,@ViewTimes,@ReviewTimes,@Orders,@Finished,@RandomID) ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text);
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);
            cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Author", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", cdt);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", 1);
            cmd.Parameters.AddWithValue("@AuditorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Auditor", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@AuditedDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@ViewTimes", 0);
            cmd.Parameters.AddWithValue("@ReviewTimes", 0);
            cmd.Parameters.AddWithValue("@Orders", Orders.Text);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        return i;
    }
    // 更新操作
    private int DoUpdate(int finished)
    {
        int i = 0;

        int SubID = 0;
        String SubName = "";
        if (Subs.Items.Count > 0 && Subs.SelectedValue != null)
        {
            SubID = Convert.ToInt16(Subs.SelectedValue);
            SubName = Subs.SelectedItem.Text;
        }
        //更新校园网的数据
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Update Articles set Title = @Title,Content=@Content,CatID=@CatID,CatName=@CatName,SubID=@SubID,SubName=@SubName,AuthorID=@AuthorID,Author=@Author,CoverImageURL=@CoverImageURL,CDT=@CDT,LDT=@LDT,Orders=@Orders,Status=@Status,StatusName=@StatusName,Finished=@Finished where RandomID = @RandomID  ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text);
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);
            
            cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Author", Session["UserName"].ToString());
             cmd.Parameters.AddWithValue("@CoverImageURL", CoverPhoto.ImageUrl);
            cmd.Parameters.AddWithValue("@CDT", CDT_TextBox.Text);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);
            // RoleID={1,Administrator},{2,Editor},{3,Contributor},{4,Author}            
            int RoleID = Convert.ToInt16(Session["RoleID"].ToString());
            if (RoleID > 2)
            {
                cmd.Parameters.AddWithValue("@Status", 0); //状态：新投稿/待审核=0，审核已过=1，审核未过=2            
                cmd.Parameters.AddWithValue("@StatusName", "未审核");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Status", 1); //状态：新投稿/待审核=0，审核已过=1，审核未过=2      
                cmd.Parameters.AddWithValue("@StatusName", "通过审核");
            }            

            cmd.Parameters.AddWithValue("@Orders", Orders.Text);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);

            conn.Open();
            i = cmd.ExecuteNonQuery();
        }
        //同时更新微信的数据
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Update Articles2 set Title = @Title,Content=@Content,CatID=@CatID,CatName=@CatName,SubID=@SubID,SubName=@SubName,AuthorID=@AuthorID,Author=@Author,");
            sb.Append("CDT=@CDT,LDT=@LDT,Orders=@Orders,Finished=@Finished where RandomID = @RandomID ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text);
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);
            cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Author", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", CDT_TextBox.Text);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);
            cmd.Parameters.AddWithValue("@Orders", Orders.Text);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
        }
        return i;
    }

    protected void Cats_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Subs where CatID = " + Cats.SelectedValue + " order by Orders desc";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Subs.DataSource = rd;
            Subs.DataTextField = "SubName";
            Subs.DataValueField = "ID";
            Subs.DataBind();
            rd.Close();
        }
        if (Subs.Items.Count > 0)
        {
            Subs.Visible = true;
        }
        else
        {
            Subs.Visible = false;
        }
    }
}
