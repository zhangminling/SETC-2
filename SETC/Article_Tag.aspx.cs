using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.IO;
public partial class Article_Tag : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string UserID = Convert.ToString(Session["UserID"]);


           
            using (SqlConnection conn = new DB().GetConnection())
            {

                string sql = "select * from  [ArticleTags]  where [UserID] = @UserID order by ID asc   ";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@UserID", UserID);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                TagsList.DataSource = rd;
                TagsList.DataTextField = "TagName";
                TagsList.DataValueField = "ID";
                TagsList.DataBind();
                rd.Close();
            }

        }

    }

    private void MyDataBind()
    {
        int i = 0;
        string UserID = Convert.ToString(Session["UserID"]);
        string username = Convert.ToString(Session["UserName"]);
        using (SqlConnection conn = new DB().GetConnection())
        {

            StringBuilder sb = new StringBuilder("insert into ArticleTags(TagName,Description,Articles,UserID,UserName )");
            sb.Append(" values ( @TagName,@Description,@Articles,@UserID,@UserName ) ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@TagName", TagName.Text);
            cmd.Parameters.AddWithValue("@Description", TagDescription.Text);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.Parameters.AddWithValue("@Articles", 0);
            cmd.Parameters.AddWithValue("@UserName", username);
            conn.Open();
            i = cmd.ExecuteNonQuery();
            conn.Close();
            Response.Write("<script language='javascript'> alert('操作成功');</script>");
            TagName.Text = "";
            TagDescription.Text = "";
           
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MyDataBind();
    }


}
