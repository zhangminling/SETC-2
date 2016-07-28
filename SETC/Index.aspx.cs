using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (SqlConnection conn = new DB().GetConnection())       
            {
                // 焦点图
                string sql = "select * from Focuses where valid = 1 order by orders desc";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                Repeater1.DataSource = rd;
                Repeater1.DataBind();
                rd.Close();

                // GridView1 教师通知
                cmd.CommandText = "select top 10 ID,Title,CDT from Articles where SubID = 6 and Status =1 and Finished = 1 Order by Orders Desc,CDT Desc,ID Desc";
                rd = cmd.ExecuteReader();
                GridView1.DataSource = rd;
                GridView1.DataBind();
                rd.Close();

                // GridView2 学生通知
                cmd.CommandText = "select top 10 ID,Title,CDT from Articles where SubID = 7 and Status =1 and Finished = 1 Order by Orders Desc,CDT Desc,ID Desc";
                rd = cmd.ExecuteReader();
                GridView2.DataSource = rd;
                GridView2.DataBind();
                rd.Close();

                // GridView3 学院动态
                cmd.CommandText = "select top 10 ID,Title,CDT from Articles where SubID = 5 and Status =1 and Finished = 1 Order by Orders Desc,CDT Desc,ID Desc";
                rd = cmd.ExecuteReader();
                GridView3.DataSource = rd;
                GridView3.DataBind();
                rd.Close();

                // GridView4 作品展示
                cmd.CommandText = "select top 4 ID,Title,Abs,Author,CoverPhotoURL,CDT,Catalog from Shows where Status =1 Order by Orders Desc,CDT Desc,ID Desc";
                rd = cmd.ExecuteReader();
                GridView4.DataSource = rd;
                GridView4.DataBind();
                rd.Close();

                // GridView5 活动剪影
                cmd.CommandText = "select top 10 ID,Title,CDT from Articles where SubID = 39 and Status =1 and Finished = 1 Order by Orders Desc,CDT Desc,ID Desc";
                rd = cmd.ExecuteReader();
                GridView5.DataSource = rd;
                GridView5.DataBind();
                rd.Close();

                conn.Close();
            }
        }
    }
}
