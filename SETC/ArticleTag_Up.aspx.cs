using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Collections;

public partial class ArticleTag_Up : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
          
            if (Request.QueryString["ID"]!=null)
            {

                TagID.Text = Request.QueryString ["ID"].ToString();
                MyInitForUpdate();
            
        }
        }
    }

    private void MyInitForUpdate()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from ArticleTags where ID =" + TagID.Text;
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read()) {
                TagName.Text = rd["TagName"].ToString();
                TagDescription.Text = rd["Description"].ToString();         
            
            }
        }
    }


    private void DoUpdate()
    {
       
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Update ArticleTags set TagName=@TagName,Description=@Description where ID=@ID");
            StringBuilder sb1 = new StringBuilder("Update Articles_ArticleTags set ArticleTagName=@ArticleTagName where ArticleTagID=@ArticleTagID");
            SqlCommand cmd = new SqlCommand(sb.ToString(),conn);
            SqlCommand cmd1 = new SqlCommand(sb1.ToString(), conn);
            cmd.Parameters.AddWithValue("@ID", TagID.Text);  
            cmd.Parameters.AddWithValue("@TagName", TagName.Text);
            cmd1.Parameters.AddWithValue("@ArticleTagName", TagName.Text);
            cmd1.Parameters.AddWithValue("@ArticleTagID", TagID.Text); 
            cmd.Parameters.AddWithValue("@Description", TagDescription.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script language='javascript'> alert('更新成功');</script>");
            
            
        }
        
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        DoUpdate();
    }



      protected void Last_Click(object sender, EventArgs e)
    {
        Response.Redirect("Article_Tag_Man.aspx");
    }
}