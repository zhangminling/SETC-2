using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ArticleTag_Del : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Request.QueryString["IDS"] != null )
            {
                IDSLabel.Text = Request.QueryString["IDS"].ToString();
                MyInit();
            }
        }
    

    private void MyInit()
    {        
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from ArticleTags where ID in (" + IDSLabel.Text + ") order by ID desc";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int i = 0;
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Delete from ArticleTags where ID in (" + IDSLabel.Text + ") ";
            SqlCommand cmd1 = conn.CreateCommand();
            cmd1.CommandText = "Delete from Articles_ArticleTags where ArticleTagID in (" + IDSLabel.Text + ") ";
            

            conn.Open();
            cmd1.ExecuteNonQuery();
            i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd1.Dispose();

            cmd.CommandText = "select * from ArticleTags where ID in (" + IDSLabel.Text + ") order by ID desc";            
            SqlDataReader rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
            conn.Close();

        }
        if (i > 0)
        {
            ResultLabel.Text = "成功删除" + i + "个标签！";
            ResultLabel.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            ResultLabel.Text = "操作失败，请重试！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Article_Tag_Man.aspx");
    }
}
