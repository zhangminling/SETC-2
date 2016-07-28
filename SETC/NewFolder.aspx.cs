using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class NewFolder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.Write(Request.QueryString["type"]);
        }
    }
    protected void Add_Click(object sender, EventArgs e)
    {
        //有输入文件名,在ResourceFolders插入一条记录
        if (!String.IsNullOrEmpty(FolderName.Text))
        {
            string folderType = Request.QueryString["type"];
            string UserID = Session["UserID"].ToString();
            string guid = System.Guid.NewGuid().ToString();
            using (SqlConnection conn = new DB().GetConnection())
            {
                StringBuilder sb = new StringBuilder("Insert into ResourceFolders(FolderName,FolderType,UserID,CDT,Orders,Resources,ParentFolderID,IsSharedFolder,FoldGUID)");
                sb.Append(" values(@FolderName,@FolderType,@UserID,@CDT,@Orders,@Resources,@ParentFolderID,@IsSharedFolder,@FoldGUID)");
                SqlCommand cmd = new SqlCommand(sb.ToString(),conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@FolderName", FolderName.Text);
                cmd.Parameters.AddWithValue("@FolderType",folderType);
                cmd.Parameters.AddWithValue("@UserID",UserID);
                cmd.Parameters.AddWithValue("@CDT",DateTime.Now);
                cmd.Parameters.AddWithValue("@Orders",1);
                cmd.Parameters.AddWithValue("@Resources",0);
                cmd.Parameters.AddWithValue("@ParentFolderID",0);
                cmd.Parameters.AddWithValue("@IsSharedFolder",0);
                cmd.Parameters.AddWithValue("@FoldGUID",guid);
                cmd.ExecuteNonQuery();
            }
        }
        else
        { 
           
        }
    }
    protected void Abolish_Click(object sender, EventArgs e)
    {
      
        Response.Write("<script language='javascript'>window.close();</script>");

    }
}
