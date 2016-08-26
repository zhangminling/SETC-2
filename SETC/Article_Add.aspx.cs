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


    public string RandomIDCD = "";
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
                    RandomID.Text = Guid.NewGuid().ToString();
                    RandomIDCD = RandomID.Text;

                    //RandomID.Text = "";//第一次加载页面，为空
                }

                TagDataShow();
            }

        }
    }

    private void TagDataShow()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            conn.Open();
            cmd.CommandText = "select count(*) as maxrow from [Articles_ArticleTags] where ArticleID= @ArticleID";
            cmd.Parameters.AddWithValue("@ArticleID", IDLabel.Text);
            SqlDataReader rd1 = cmd.ExecuteReader();
            if (rd1.Read())
            {
                Count.Text = rd1["maxrow"].ToString();
            }
            rd1.Close();



            string s = "";
            int i = Convert.ToInt32(Count.Text);
            string[] ArticleTagID = new string[i];
            cmd.CommandText = "select * from [Articles_ArticleTags] where ArticleID= @ArticleID2";
            cmd.Parameters.AddWithValue("@ArticleID2", IDLabel.Text);
            SqlDataReader rd2 = cmd.ExecuteReader();
            if (i != 0)
            {
                for (int j = 0; j < i; j++)
                {
                    if (rd2.Read())
                    {
                        ArticleTagID[j] = rd2["ArticleTagID"].ToString();
                        for (int k = 0; k < i; k++)
                        {
                            s = string.Join(",", ArticleTagID);
                            Label3.Text = s;

                        }
                    }
                }
            }

            else
            {
                int s1 = 0;
                Label3.Text = s1.ToString();
            }
            rd2.Close();





            // MyInit();
            MyDataBind();

        }

    }


    private void MyDataBind()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
             SqlCommand cmd = conn.CreateCommand();
             cmd.CommandText = "select * from  [ArticleTags] where ID  not in (" + Label3.Text + ") order by ID asc ";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            TagsList.DataSource = rd;
            TagsList.DataTextField = "TagName";
            TagsList.DataValueField = "ID";
            TagsList.DataBind();
            rd.Close();



            cmd.CommandText="select * from [Articles_ArticleTags] where ArticleID = @ArticleID";
              cmd.Parameters.AddWithValue("@ArticleID", IDLabel.Text);
              SqlDataReader rd1 = cmd.ExecuteReader();
              ListBox1.DataSource = rd1;
              ListBox1.DataTextField = "ArticleTagName";
              ListBox1.DataValueField = "ArticleTagID";
              ListBox1.DataBind();
              rd1.Close();


        }
    
    }

    private string Check()
    {
        int i = 0;
        string[] s = new string[6];
        s[0] = "";
        s[1] = "操作失败！ 文章标题不能为空！";

        string TitleStr = TitleTB.Text;
        if (!String.IsNullOrEmpty(TitleStr))
        {
            
                DataBind();

        }
        else
        {
            i = 1;//第二种情况，用户名密码为空
        }
        return s[i];
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



            cmd.CommandText = "select * from UserTags order by ID asc";
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
                Summary.Text=rd["Summary"].ToString();

                string UserTagID = rd["TagID"].ToString();
                if (UserTag.Items.FindByValue(UserTagID) != null)
                {
                    UserTag.ClearSelection();
                    UserTag.Items.FindByValue(UserTagID).Selected = true;
                }

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
                CoverPhoto.ImageUrl = rd["CoverImageURL"].ToString();
      
                RandomID.Text = rd["RandomID"].ToString();
                RandomIDCD = RandomID.Text;
                int PC1 = Convert.ToInt32(rd["PC"]);
                if (PC1 == 1) { PC.Checked = true; }
                int Phone1 = Convert.ToInt32(rd["Phone"]);
                if (Phone1 == 1) { Phone.Checked=true; }
                int Wechat1 = Convert.ToInt32(rd["Wechat"]);
                if (Wechat1 == 1) { Wechat.Checked = true; }
                int iPad1 = Convert.ToInt32(rd["iPad"]);
                if (iPad1 == 1) { iPad.Checked = true; }
                int APP1 = Convert.ToInt32(rd["APP"]);
                if (APP1 == 1) { APP.Checked = true; }
                int TV1 = Convert.ToInt32(rd["TV"]);
                if (TV1 == 1) { TV.Checked = true; }


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


            cmd.CommandText = "select * from UserTags order by ID asc";
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


   
   


    
    protected void Button4_Click(object sender, EventArgs e)
    {
        //if (!String.IsNullOrEmpty(IDLabel.Text))
        //{
            Article_Add1();
            Response.Redirect("Article_More.aspx?RandomID=" + RandomID.Text);
        //}
        //else
        //{
        //    ResultLabel.Text = "保存文章之后，才能进入下一步！";
        //    ResultLabel.Visible = true;
        //    ResultLabel.ForeColor = System.Drawing.Color.Red;
        //}
    }

   

    // 预览文章
    protected void Button2_Click(object sender, EventArgs e)
    {
        //if (!String.IsNullOrEmpty(IDLabel.Text))
        //{
         ResultLabel.Text = Check();
        ResultLabel.ForeColor = System.Drawing.Color.Red;
        if (ResultLabel.Text == "")
        {
            Article_Add1();
           // Response.Redirect("Article_View.aspx?RandomID=" + RandomID.Text);
           // Server.Transfer("Article_View.aspx?RandomID=" + RandomID.Text);
            Response.Write("<script>window.open('Article_View.aspx?RandomID=" + RandomID.Text + "','_blank')</script>");

          
        }
        //}
        //else
        //{
        //    ResultLabel.Text = "保存文章之后，才能进入预览！";
        //    ResultLabel.Visible = true;
        //    ResultLabel.ForeColor = System.Drawing.Color.Red;
        //}


    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Response.Redirect("Article_Add.aspx");
    }

    // 保存并提交文章
    protected void Button3_Click(object sender, EventArgs e)
    {
        ResultLabel.Text = Check();
        ResultLabel.ForeColor = System.Drawing.Color.Red;
        if (ResultLabel.Text == "")
         {
             Article_Add1();
           
         }
        
    }


    private void Article_Add1()
    {
        if (!PC.Checked && !Phone.Checked && !Wechat.Checked && !iPad.Checked && !APP.Checked && !TV.Checked)
        {
            ResultLabel.Text = "至少选择一个发布位置！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
        }
        else
        {

            int i = 0;
            if (String.IsNullOrEmpty(IDLabel.Text))
            {
                //RandomID.Text = Guid.NewGuid().ToString();
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
    }

    // 保存草稿
    protected void Button1_Click(object sender, EventArgs e)
    {
         ResultLabel.Text = Check();
        ResultLabel.ForeColor = System.Drawing.Color.Red;
        if (ResultLabel.Text == "")
        {
            int i = 0;
            if (String.IsNullOrEmpty(IDLabel.Text))
            {
                //RandomID.Text = Guid.NewGuid().ToString();
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


            StringBuilder sb = new StringBuilder("Insert into Articles ( Title,Content,Summary,CatID,CatName,SubID,SubName,AuthorID,Author,TagName,TagID,CDT,LDT,Status,Valid,AuditorID,Auditor,AuditedDateTime,ViewTimes,ReviewTimes,Orders,Finished,RandomID,CoverImageURL,StatusName,PC,Phone,Wechat,iPad,APP,TV) ");
            sb.Append(" values ( @Title,@Content,@Summary,@CatID,@CatName,@SubID,@SubName,@AuthorID,@Author,@TagName,@TagID,@CDT,@LDT,@Status,@Valid,@AuditorID,@Auditor,@AuditedDateTime,@ViewTimes,@ReviewTimes,@Orders,@Finished,@RandomID,@CoverImageURL,@StatusName,@PC,@Phone,@Wechat,@iPad,@APP,@TV) ");
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
            cmd.Parameters.AddWithValue("@TagName", UserTag.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@TagID", UserTag.SelectedValue);
            cmd.Parameters.AddWithValue("@CoverImageURL", CoverPhoto.ImageUrl);

          
            if (Summary.Text == "")
            {
                if (Editor1.Text.Length < 206)
                {
                    Summary.Text = Editor1.Text.Substring(3, Editor1.Text.LastIndexOf("</")-3);
                   
                }

                else { Summary.Text = Editor1.Text.Substring(3, 200); }

                cmd.Parameters.AddWithValue("@Summary", Summary.Text);

            }
            else { 
               cmd.Parameters.AddWithValue("@Summary", Summary.Text);

            }


            // RoleID={1,Administrator},{2,Editor},{3,Contributor},{4,Author}
             int RoleID = Convert.ToInt16(Session["RoleID"].ToString());
            if (RoleID > 2)
            {
                cmd.Parameters.AddWithValue("@Status", 0); //状态：新投稿/待审核=0，审核已过=1，审核未过=2            
                cmd.Parameters.AddWithValue("@StatusName", "未审核");
                cmd.Parameters.AddWithValue("@AuditorID", 0);
                cmd.Parameters.AddWithValue("@Auditor", "无");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Status", 1); //状态：新投稿/待审核=0，审核已过=1，审核未过=2   
                cmd.Parameters.AddWithValue("@StatusName", "审核通过");
                cmd.Parameters.AddWithValue("@AuditorID", Session["UserID"].ToString());
                cmd.Parameters.AddWithValue("@Auditor", Session["UserName"].ToString());
            }
           
            cmd.Parameters.AddWithValue("@Valid", 1);
            
            cmd.Parameters.AddWithValue("@AuditedDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@ViewTimes", 0);
            cmd.Parameters.AddWithValue("@ReviewTimes", 0);
            cmd.Parameters.AddWithValue("@Orders", Orders.Text);
           
           
            cmd.Parameters.AddWithValue("@Finished", finished);
            //RandomID.Text = Guid.NewGuid().ToString();
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            if (PC.Checked) { cmd.Parameters.AddWithValue("@PC", 1); } else { cmd.Parameters.AddWithValue("@PC", 0); }
            if (Phone.Checked) { cmd.Parameters.AddWithValue("@Phone", 1); } else { cmd.Parameters.AddWithValue("@Phone", 0); }
            if (Wechat.Checked) { cmd.Parameters.AddWithValue("@Wechat", 1); } else { cmd.Parameters.AddWithValue("@Wechat", 0); }
            if (iPad.Checked) { cmd.Parameters.AddWithValue("@iPad", 1); } else { cmd.Parameters.AddWithValue("@iPad", 0); }
            if (APP.Checked) { cmd.Parameters.AddWithValue("@APP", 1); } else { cmd.Parameters.AddWithValue("@APP", 0); }
            if (TV.Checked) { cmd.Parameters.AddWithValue("@TV ", 1); } else { cmd.Parameters.AddWithValue("@TV", 0); }
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
            cmd.Parameters.AddWithValue("@Orders", 1);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
        
     }
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Articles where RandomID = @RandomID";
            cmd.Parameters.AddWithValue("@RandomID",RandomID.Text);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                IDLabel.Text = rd["ID"].ToString();

            }
            rd.Close();
            conn.Close();
        }

      // Response.Redirect("Article_Add.aspx?ID=" + IDLabel.Text);
        return i;
        
    }
    // 更新操作
    private int DoUpdate(int finished)
    {
        int i = 0;

        int SubID = 0;
        int TagID = 0;
        String SubName = "";
        String TagName = "";
        if (Subs.Items.Count > 0 && Subs.SelectedValue != null)
        {
            SubID = Convert.ToInt16(Subs.SelectedValue);
            SubName = Subs.SelectedItem.Text;
        }
        if (UserTag.Items.Count > 0 && UserTag.SelectedValue != null)
        {
            TagID = Convert.ToInt16(UserTag.SelectedValue);
            TagName = UserTag.SelectedItem.Text;
        }
        //更新校园网的数据
        using (SqlConnection conn = new DB().GetConnection())
        {


            StringBuilder sb = new StringBuilder("Update Articles set Title = @Title,Content=@Content,Summary=@Summary,CatID=@CatID,CatName=@CatName,SubID=@SubID,AuditorID=@AuditorID,Auditor=@Auditor,SubName=@SubName,UpdateAuthorID=@UpdateAuthorID,UpdateAuthor=@UpdateAuthor,CoverImageURL=@CoverImageURL,TagName=@TagName,TagID=@TagID,CDT=@CDT,LDT=@LDT,Orders=@Orders,Status=@Status,StatusName=@StatusName,Finished=@Finished,PC=@PC,Phone=@Phone,Wechat=@Wechat,iPad=@iPad,APP=@APP,TV=@TV where RandomID = @RandomID  ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text);
            cmd.Parameters.AddWithValue("@Summary", Summary.Text); 
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);

            cmd.Parameters.AddWithValue("@UpdateAuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@UpdateAuthor", Session["UserName"].ToString());

            cmd.Parameters.AddWithValue("@TagID", TagID);
            cmd.Parameters.AddWithValue("@TagName", TagName);
            cmd.Parameters.AddWithValue("@CoverImageURL", CoverPhoto.ImageUrl);
            cmd.Parameters.AddWithValue("@Orders", Orders.Text);

            cmd.Parameters.AddWithValue("@CDT", CDT_TextBox.Text);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);
            // RoleID={1,Administrator},{2,Editor},{3,Contributor},{4,Author}            
            int RoleID = Convert.ToInt16(Session["RoleID"].ToString());
            if (RoleID > 2)
            {
                cmd.Parameters.AddWithValue("@Status", 0); //状态：新投稿/待审核=0，审核已过=1，审核未过=2            
                cmd.Parameters.AddWithValue("@StatusName", "未审核");
                cmd.Parameters.AddWithValue("@AuditorID", 0);
                cmd.Parameters.AddWithValue("@Auditor", "无");
            }
            else
            {
                cmd.Parameters.AddWithValue("@Status", 1); //状态：新投稿/待审核=0，审核已过=1，审核未过=2      
                cmd.Parameters.AddWithValue("@StatusName", "通过审核");
                cmd.Parameters.AddWithValue("@AuditorID", Session["UserID"].ToString());
                cmd.Parameters.AddWithValue("@Auditor", Session["UserName"].ToString());
            }

            if (PC.Checked) { cmd.Parameters.AddWithValue("@PC", 1); } else { cmd.Parameters.AddWithValue("@PC", 0); }
            if (Phone.Checked) { cmd.Parameters.AddWithValue("@Phone", 1); } else { cmd.Parameters.AddWithValue("@Phone", 0); }
            if (Wechat.Checked) { cmd.Parameters.AddWithValue("@Wechat", 1); } else { cmd.Parameters.AddWithValue("@Wechat", 0); }
            if (iPad.Checked) { cmd.Parameters.AddWithValue("@iPad", 1); } else { cmd.Parameters.AddWithValue("@iPad", 0); }
            if (APP.Checked) { cmd.Parameters.AddWithValue("@APP", 1); } else { cmd.Parameters.AddWithValue("@APP", 0); }
            if (TV.Checked) { cmd.Parameters.AddWithValue("@TV ", 1); } else { cmd.Parameters.AddWithValue("@TV", 0); }
         

         
               
         
            //cmd.Parameters.AddWithValue("@Orders", 1);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            i = cmd.ExecuteNonQuery();
        }
        //同时更新数据库Articles_ArticleTags表
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb1 = new StringBuilder("Update Articles_ArticleTags set Title=@Title where ArticleID=@ArticleID");
            SqlCommand cmd1 = new SqlCommand(sb1.ToString(), conn);
            cmd1.Parameters.AddWithValue("@Title",TitleTB.Text );
            cmd1.Parameters.AddWithValue("@ArticleID", IDLabel.Text);
            conn.Open();
            cmd1.ExecuteNonQuery();
            
        
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
            cmd.Parameters.AddWithValue("@Orders", 1);
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
    protected void Sure_Click(object sender, EventArgs e)
    {
        if (IDLabel.Text == "")
        {

            ResultLabel.Text = Check();
            ResultLabel.ForeColor = System.Drawing.Color.Red;
            if (ResultLabel.Text == "")
            {
                Article_Add1();
                ArticleTagAdd();
                TagDataShow();

            }
        }
        else
        {
            ArticleTagAdd();
            TagDataShow();
        }

       
    }


    private void ArticleTagAdd()
    {
    

       string tags = "";
        for (int i = 0; i <= TagsList.Items.Count - 1; i++) 
        {
            if (TagsList.Items[i].Selected == true)
            {
                tags += "," + TagsList.Items[i].Value;
            }
        
        }
 
     
            tags = tags.Substring(1);
            TagiIDs.Text=tags;
            string[] array = tags.Split(',');
            int k = array.Length;
                //string[] ArticleID = new string[10];
            //string[] ArticleName = new string[10];
               string[] ArticleTagID = new string[10];
            string[] ArticleTagName = new string[10];
            string  ArticleTitle = "";
            string ArticleID = "";
             int p;

            using (SqlConnection conn = new DB().GetConnection())
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "select * from ArticleTags where ID in (" + TagiIDs.Text + ") order by ID desc  ";
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                for (p = 0; p <= k - 1; p++)
                {
                    if (rd.Read())
                    {
                        ArticleTagID[p] = rd["ID"].ToString();
                        ArticleTagName[p] = rd["TagName"].ToString();

                    }
                }
                rd.Close();

                TagiIDs.Text = ArticleTagID[p];
                cmd.CommandText = "select * from Articles where ID =@ArticleID";
                cmd.Parameters.AddWithValue("@ArticleID", IDLabel.Text);
                SqlDataReader rd1 = cmd.ExecuteReader();

                if (rd1.Read())
                {
                    ArticleID = rd1["ID"].ToString();
                   ArticleTitle = rd1["Title"].ToString();
                    // Articles1 = rd1["Articles"].ToString();
                }
                rd1.Close();


                for (int j = 0; j <= k - 1; j++)
                {
                    //USERID = Arrays[j];
                    //USERNAME = Arrays1[j];
                    StringBuilder sb = new StringBuilder("insert into Articles_ArticleTags(ArticleID,Title,ArticleTagID,ArticleTagName )");
                    sb.Append(" values ( @ArticleID,@Title,@ArticleTagID,@ArticleTagName ) ");
                    SqlCommand cmd1 = new SqlCommand(sb.ToString(), conn);
                    cmd1.Parameters.AddWithValue("@ArticleID", ArticleID);
                    cmd1.Parameters.AddWithValue("@Title",  ArticleTitle);
                    cmd1.Parameters.AddWithValue("@ArticleTagID", ArticleTagID[j]);
                    cmd1.Parameters.AddWithValue("@ArticleTagName", ArticleTagName[j]);
                    cmd1.ExecuteNonQuery();


                }


                conn.Close();
               
                
            }

        }

        
       
        

}
