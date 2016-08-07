using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using CuteWebUI;
using System.IO;
using System.Text;
using System.Data;
using System.Web.UI.HtmlControls;


public partial class File_Browse2 : System.Web.UI.Page
{
    //存储允许上传的资源的后缀名，key=Extension，value=TypeName
    Dictionary<string, string> ResourceTypes = new Dictionary<string, string>();

    //设置默认的RoleID    
    string RoleID = "5";
    string UserID = "0";
    //chenxilian:定义一个guid变量，来接收系统生成的唯一GUID值
    string guid = "0";
    //获得上传图片的路劲
    public string ImgData = null;
    //插入ckEditor的图片的路径
    public string insertFileHTML = "<strong>插入资源错误，请重试</strong>";


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
                UserID = Session["UserID"].ToString();

                using (SqlConnection conn = new DB().GetConnection())
                {
                    SqlDataReader rd;
                    SqlCommand cmd = conn.CreateCommand();
                    cmd.CommandText = "select * from ResourceTypes";
                    conn.Open();
                    rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        ResourceTypes.Add(rd["Extension"].ToString(), rd["TypeName"].ToString());
                    }
                    rd.Close();
                    conn.Close();

                    /*
                    cmd.CommandText = "select * from  Resources where UserID = " + UserID + " order by id desc";
                    rd = cmd.ExecuteReader();
                    GridView1.DataSource = rd;
                    GridView1.DataBind();
                    rd.Close();
                    */
                    cmd.CommandText = "Select * from ResourceFolders where ParentFolderID = '0' order by ID asc";
                    conn.Open();
                    rd = cmd.ExecuteReader();
                    FolderDDL.DataSource = rd;
                    FolderDDL.DataValueField = "ID";
                    FolderDDL.DataTextField = "FolderName";
                    FolderDDL.DataBind();
                    rd.Close();
                    FolderDDL.Items.Insert(0, new ListItem("--文件夹目录--", "-1"));
                    FolderDDL.SelectedIndex = 1;
                    conn.Close();

                    //MyInit();
                    //MyDataBind();
                }                
            }

        }
    }

    //private void MyInit()
    //{

    //    using (SqlConnection conn = new DB().GetConnection())
    //    {
    //        SqlCommand cmd = conn.CreateCommand();
    //        cmd.CommandText = "select distinct typename as typename from ResourceTypes";
    //        conn.Open();
    //        SqlDataReader rd = cmd.ExecuteReader();
    //        ResourceTypeDDL.DataSource = rd;
    //        ResourceTypeDDL.DataValueField = "typename";
    //        ResourceTypeDDL.DataTextField = "typename";
    //        ResourceTypeDDL.DataBind();
    //        rd.Close();
    //        ResourceTypeDDL.Items.Insert(0, new ListItem("所有资源类型", ""));

    //        // RoleID=1,2,3,4，分别对应Administrator,Editor,Contributor,Author
    //        int RoleID = Convert.ToInt16(Session["RoleID"].ToString());
    //        if (RoleID == 1 || RoleID == 2)
    //        {
    //            // 只有Administrator和Editor才可以看到所有作者的文章
    //            AuthorDDL.Items.Clear();
    //            cmd.CommandText = "select * from Users order by ID desc";
    //            rd = cmd.ExecuteReader();
    //            AuthorDDL.DataSource = rd;
    //            AuthorDDL.DataValueField = "ID";
    //            AuthorDDL.DataTextField = "UserName";
    //            AuthorDDL.DataBind();
    //            rd.Close();
    //            AuthorDDL.Items.Insert(0, new ListItem("所有用户", "-1"));
    //        }
    //        else
    //        {
    //            // Contributor和Author只能看到自己的文章
    //            AuthorDDL.Items.Clear();
    //            AuthorDDL.Items.Insert(0, new ListItem(Session["UserName"].ToString(), Session["UserID"].ToString()));
    //        }
    //    }
    //}

    //private void MyDataBind()
    //{
    //    AspNetPager1.PageSize = Convert.ToInt16(PageSizeDDL.SelectedValue);
    //    string param = SearchTB.Text;
    //    StringBuilder whereStr = new StringBuilder(" where 1= 1 ");
    //    if (!String.IsNullOrEmpty(param))
    //    {
    //        whereStr.Append(" and [ResourceName] like '%").Append(Server.HtmlEncode(param.Trim().Replace("'", ""))).Append("%' ");
    //    }
    //    if (ResourceTypeDDL.SelectedIndex > 0)
    //    {
    //        whereStr.Append(" and FileType = '").Append(ResourceTypeDDL.SelectedValue).Append("'");
    //    }
    //    if (Convert.ToInt16(AuthorDDL.SelectedValue) > 0)
    //    {
    //        whereStr.Append(" and UserID = ").Append(AuthorDDL.SelectedValue);
    //    }

    //    string sql = "select count(ID) as total from Resources " + whereStr.ToString();

    //    using (SqlConnection conn = (SqlConnection)new DB().GetConnection())
    //    {
    //        SqlCommand cmd = conn.CreateCommand();
    //        cmd.CommandText = sql;
    //        conn.Open();
    //        SqlDataReader rd = cmd.ExecuteReader();
    //        if (rd.Read())
    //        {
    //            AspNetPager1.RecordCount = Convert.ToInt16(rd[0]);
    //        }
    //        else
    //        {
    //            AspNetPager1.RecordCount = 0;
    //        }
    //        rd.Close();

    //        Label1.Text = AspNetPager1.RecordCount + "";//总记录数
    //        Label2.Text = (AspNetPager1.RecordCount / AspNetPager1.PageSize) + 1 + "";//总页数            

    //        if (AspNetPager1.CurrentPageIndex == 1)
    //        {
    //            sql = "Select top " + AspNetPager1.PageSize + " * from Resources " + whereStr.ToString() + " " + OrderDDL.SelectedValue;
    //        }
    //        else
    //        {
    //            // Select Top 页容量 * from 表 where 条件 and id not in	(Select Top 页容量*（当前页数-1） id 	from 表 where 条件 order by 排序条件) order by 排序条件
    //            sql = "Select top " + AspNetPager1.PageSize + " * from Resources " + whereStr.ToString() + " and id not in ( select top " + AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1) + " id  from Resources " + whereStr.ToString() + " " + OrderDDL.SelectedValue + " ) " + OrderDDL.SelectedValue;
    //            //sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER ( " + orderStr + ") AS MyRank,* FROM Article " + whereStr +" ) AS Rank " + whereStr + " and MyRank BETWEEN " +AspNetPager1.StartRecordIndex+" AND "+ (AspNetPager1.StartRecordIndex+AspNetPager1.PageSize-1) +orderStr;
    //        }
    //        //TestLabel.Text = sql;
    //        cmd.CommandText = sql;
    //        rd = cmd.ExecuteReader();
    //        GridView1.DataSource = rd;
    //        GridView1.DataKeyNames = new string[] { "ID" };
    //        GridView1.DataBind();
    //        rd.Close();
    //    }
    //}

    // 判断fileextension是否合法
    protected bool CheckExtension(string extension)
    {
        bool result = false;
        // 如果Dictionary的键值数<1，即没有元素，则先读取数据表
        if (ResourceTypes.Keys.Count < 1)
        {
            using (SqlConnection conn = new DB().GetConnection())
            {
                SqlDataReader rd;
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "select * from ResourceTypes";
                conn.Open();
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    ResourceTypes.Add(rd["Extension"].ToString(), rd["TypeName"].ToString());
                }
                rd.Close();
                conn.Close();
            }

        }
        // 判断是否含有指定的后缀名
        if (ResourceTypes.ContainsKey(extension))
        {
            result = true;
            ResourceTypeLabel.Text = ResourceTypes[extension];
        }
        return result;
    }


    // 资源上传完毕时，不回传页面
    /*
     * Justin 2015-8-18
     * Step:
     * 1 判断文件后缀名是否合法，文件大小是否超标，从FileUpload数据表中读取基本数据
     * 2 对文件重命名 userid_yyyyMMddhhmmss_random_o.jpg，o表示原始资源
     * 3 把文件另存（移动到）用户的文件夹下，例如 users/101/201508/,按月新建文件夹即可
     * 4 对图片生成web图、缩略图和移动图，对视频鼓励用户上传移动版的视频（或者在线转录），用一个图片表示视频封面
     *   缩略图，在后台资源管理中用，移动版的图片在手机访问的时候使用，平板则直接使用web版的图片
     *   userid_yyyyMMddhhmmss_random_o.jpg，userid_yyyyMMddhhmmss_random_w.jpg，userid_yyyyMMddhhmmss_random_p.jpg，userid_yyyyMMddhhmmss_random_s.jpg
     *   同步IO，再进化到异步IO
     * 5 在File数据表中，插入一条数据，记录相关信息
     * 
     * 6 用户点击“插入资源”按钮，再把相应的资源插入到文章中，关闭本窗口
     * 
     * 
     */
    protected void Uploader_FileUploaded(object sender, UploaderEventArgs args)
    {
        TestLabel.Text = "Uploader1_UploadCompleted";
        //资源的重命名
        TextBox1.Text = args.FileName.Substring(0, args.FileName.LastIndexOf('.'));

        //InsertMsg("File uploaded! " + args.FileName + ", " + args.FileSize + " bytes.");

        string fileExtension = args.FileName.Substring(args.FileName.LastIndexOf('.') + 1).ToLower();

        //如果后缀名不空，且后缀名合法
        if ((!String.IsNullOrEmpty(fileExtension)) && CheckExtension(fileExtension))
        {
            //判断文件大小，暂缓
            string fileSize = args.FileSize / 1024 + "";


            //chenxilian:判断资源类型，给ResourceTypeLabel.Text赋值上传的资源类型
            ResourceTypeLabel.Text = ResourceTypes[fileExtension];
            //重命名文件  userid_yyyyMMddHHmmss_random4_o.jpg           
            string fileName = Session["UserID"].ToString() + "_" + DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + new Random().Next(1000, 10000).ToString() + "." + fileExtension;

            //文件实际存储路径，Users/userid/yyyyMM/  采用相对路径，方便js访问图片
            //string filePath = "Users/" + Session["UserID"].ToString() + "/" + DateTime.Now.ToString("yyyyMM");

            //文件实际存储路径，upload/yyyyMM/  采用相对路径，方便js访问图片
            string filePath = "upload" + "/" + DateTime.Now.ToString("yyyyMM");

            string serverPath = Server.MapPath(filePath);
            if (!Directory.Exists(serverPath))
            {
                Directory.CreateDirectory(serverPath);
            }
            //移动文件到指定目录
            args.MoveTo(serverPath + "/" + fileName);
            //filePath存储的是文件的相对路径，包括文件名
            filePath = filePath + "/" + fileName;


            FET.Text = fileExtension;
            FS.Text = fileSize;
            FN.Text = fileName;
            FP.Text = filePath;

            //InsertDataBase();


            //将上传好的图片在页面中显示出来
            if (ResourceTypeLabel.Text.Equals("图片"))
            {
                insertFileHTML = "<img src='" + filePath + "' />";
            }
            if (ResourceTypeLabel.Text.Equals("文档") || ResourceTypeLabel.Text.Equals("压缩"))
            {
                insertFileHTML = "<a href=\'" + filePath + "\'>" + TextBox1.Text + "</a>";
            }

            if (ResourceTypeLabel.Text.Equals("视频") || ResourceTypeLabel.Text.Equals("音频"))
            {
            //    insertFileHTML = "<div id='mediaplayer' mediaURL='" + filePath + "'>Media Player</div>";
                insertFileHTML = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' height='480' width='640'><param name='movie' value='http://localhost:55433/ckeditor201507/plugins/jwplayer/jwplayer/player.swf' /><param name='allowfullscreen' value='true' /><param name='allowscriptaccess' value='always' /><param name='flashvars' value='file=http://localhost:55433/" + filePath + "&amp;autostart=false' /><embed allowfullscreen='true' allowscriptaccess='always' flashvars='file=http://localhost:55433/" + filePath + "&amp;autostart=false' height='480' id='player1' name='player1' src='http://localhost:55433/ckeditor201507/plugins/jwplayer/jwplayer/player.swf' width='640'></embed></object>";
            }
            //if (ResourceTypeLabel.Text.Equals("视频"))
            //{

            //    insertFileHTML = "<video src='" + filePath + "' controls='controls'>出错</video>";
            //}
            //if (ResourceTypeLabel.Text.Equals("音频"))
            //{

            //    insertFileHTML = "<audio src='" + filePath + "' controls='controls'>出错</audio>";
            //}

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
            //cmd.Parameters.AddWithValue("@ResourceName", TextBox1.Text);
            cmd.Parameters.AddWithValue("@ResourceName", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@FileName", FN.Text);
            cmd.Parameters.AddWithValue("@FilePath", FP.Text);
            cmd.Parameters.AddWithValue("@FileSize", FS.Text);
            cmd.Parameters.AddWithValue("@FileType", ResourceTypeLabel.Text);
            cmd.Parameters.AddWithValue("@Extentsion", FET.Text);
            cmd.Parameters.AddWithValue("@FolderID", FolderDDL.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@FolderName", FolderDDL.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", 0);
            cmd.Parameters.AddWithValue("@Valid", 1);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT count(*) from Resources where FolderID =@FolderID";
            int count = int.Parse(Convert.ToString(cmd.ExecuteScalar()));
            cmd.CommandText = "Update ResourceFolders set Counts = " + count.ToString() + " where ID = @ID";
            cmd.Parameters.AddWithValue("@ID", FolderDDL.SelectedItem.Value);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            //插入成功
            result = true;
        }
        return result;
    }

    protected void Insert_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            //向resources插入一条记录操作
            StringBuilder sb = new StringBuilder("Insert into Resources (ResourceName,FileName,FilePath,FileSizeInKB,FileType,Extentsion,FolderID,FolderName,UserID,CDT,Status,UserName,Valid)");
            sb.Append(" values(@ResourceName,@FileName,@FilePath,@FileSize,@FileType,@Extentsion,@FolderID,@FolderName,@UserID,@CDT,@Status,@UserName,@Valid)");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            //cmd.Parameters.AddWithValue("@ResourceName", TextBox1.Text);
            cmd.Parameters.AddWithValue("@ResourceName", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@FileName", FN.Text);
            cmd.Parameters.AddWithValue("@FilePath", FP.Text);
            cmd.Parameters.AddWithValue("@FileSize", FS.Text);
            cmd.Parameters.AddWithValue("@FileType", ResourceTypeLabel.Text);
            cmd.Parameters.AddWithValue("@Extentsion", FET.Text);
            cmd.Parameters.AddWithValue("@FolderID", FolderDDL.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@FolderName", FolderDDL.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", 0);
            cmd.Parameters.AddWithValue("@Valid", 1);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd.CommandText = "SELECT count(*) from Resources where FolderID =@FolderID";
            int count = int.Parse(Convert.ToString(cmd.ExecuteScalar()));
            cmd.CommandText = "Update ResourceFolders set Counts = " + count.ToString() + " where ID = @ID";
            cmd.Parameters.AddWithValue("@ID", FolderDDL.SelectedItem.Value);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
        }
    }

    //protected void Insert_Click1(object sender, EventArgs e)
    //{
    //    string ids = "";
    //    string filePath = "";
    //    for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
    //    {
    //        CheckBox checkBox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
    //        if (checkBox.Checked == true && GridView1.DataKeys.Count != 0 && GridView1.DataKeys[i].Value != null)
    //        {
    //            ids = GridView1.DataKeys[i].Value.ToString();
    //        }
    //    }
    //    if (!String.IsNullOrEmpty(ids))
    //    {
    //        using (SqlConnection conn = new DB().GetConnection())
    //        {
    //            SqlCommand cmd = conn.CreateCommand();
    //            cmd.CommandText = "Select * from [Resources] where ID = @ResourceID";
    //            cmd.Parameters.AddWithValue("@ResourceID", ids);
    //            conn.Open();
    //            SqlDataReader rd = cmd.ExecuteReader();
    //            if (rd.Read())
    //            {

    //                filePath = rd["FilePath"].ToString();
    //                ResourceTypeLabel.Text = rd["FileType"].ToString();
    //                TextBox1.Text = rd["ResourceName"].ToString();
    //            }
    //            //将媒体库里选择的图片在页面中显示出来
    //            if (ResourceTypeLabel.Text.Equals("图片"))
    //            {
    //                insertFileHTML = "<img src='" + filePath + "' />";
    //            }
    //            if (ResourceTypeLabel.Text.Equals("文档") || ResourceTypeLabel.Text.Equals("压缩"))
    //            {
    //                insertFileHTML = "<a href=\'" + filePath + "\'>" + TextBox1.Text + "</a>";
    //            }

    //            if (ResourceTypeLabel.Text.Equals("视频") || ResourceTypeLabel.Text.Equals("音频"))
    //            {
    //            //  insertFileHTML = "<div id='mediaplayer' mediaURL='" + filePath + "'>Media Player</div>";
    //                insertFileHTML = "<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' height='480' width='640'><param name='movie' value='http://localhost:55433/ckeditor201507/plugins/jwplayer/jwplayer/player.swf' /><param name='allowfullscreen' value='true' /><param name='allowscriptaccess' value='always' /><param name='flashvars' value='file=http://localhost:55433/" + filePath + "&amp;autostart=false' /><embed allowfullscreen='true' allowscriptaccess='always' flashvars='file=http://localhost:55433/" + filePath + "&amp;autostart=false' height='480' id='player1' name='player1' src='http://localhost:55433/ckeditor201507/plugins/jwplayer/jwplayer/player.swf' width='640'></embed></object>";
    //            }
    //            //if (ResourceTypeLabel.Text.Equals("视频"))
    //            //{
    //            //    insertFileHTML = "<video src='" + filePath + "' controls='controls'>出错</video>";
                    
    //            //}
    //            //if (ResourceTypeLabel.Text.Equals("音频"))
    //            //{
    //            //    insertFileHTML = "<audio src='" + filePath + "' controls='controls'>出错</audio>";
    //            //}
    //            conn.Close();
    //        }
    //    }
        
    //}

    //protected void SearchBtn_Click(object sender, EventArgs e)
    //{
    //    MyDataBind();
    //}
    //protected void AuthorDDL_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    MyDataBind();
    //}
    //protected void ResourceTypeDDL_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    MyDataBind();
    //}
    //protected void OrderDDL_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    MyDataBind();
    //}
    //protected void PageSizeDDL_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    MyDataBind();
    //}
    //protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    //{
    //    MyDataBind();
    //}
    //protected void SelectAllCheckBox_CheckedChanged(object sender, EventArgs e)
    //{
    //    for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
    //    {
    //        CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("CheckBox1");
    //        if (SelectAllCheckBox.Checked == true)
    //        {
    //            cbox.Checked = true;
    //        }
    //        else
    //        {
    //            cbox.Checked = false;
    //        }
    //    }

    //}
    protected void FolderDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        StringBuilder whereStr = new StringBuilder(" where 1= 1 ");
        if (FolderDDL.SelectedIndex > 0)
        {
            whereStr.Append(" and FolderID = '").Append(FolderDDL.SelectedValue).Append("'");
        }
    }

}