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

public partial class ArticleTag_ArDel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) { 
         

           if (Request.QueryString["ID"] != null)
           {

               TagID.Text = Request.QueryString["ID"].ToString();
               using (SqlConnection conn = new DB().GetConnection())
               {
                   SqlCommand cmd = conn.CreateCommand();
                   cmd.CommandText = "select * from [ArticleTags] where ID= @TagID";
                   cmd.Parameters.AddWithValue("@TagID", TagID.Text);
                   conn.Open();
                   SqlDataReader rd = cmd.ExecuteReader();
                   if (rd.Read())
                   {
                       TagName.Text = rd["TagName"].ToString();
                   }
                   rd.Close();


                   cmd.CommandText = "select count(*) as maxrow from [Articles_ArticleTags] where ArticleTagID= @TagID1";
                   cmd.Parameters.AddWithValue("@TagID1", TagID.Text);
                   SqlDataReader rd1 = cmd.ExecuteReader();
                   if (rd1.Read())
                   {
                       Count.Text = rd1["maxrow"].ToString();
                   }
                   rd1.Close();
                   
                  MyDataBind();
               }
           }  
           }
    }


    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }

    private void MyDataBind()
    {
        AspNetPager1.PageSize = Convert.ToInt16(PageSizeDDL.SelectedValue);
        string param = SearchTB.Text;
       string param1 = TagName.Text;
        StringBuilder whereStr = new StringBuilder(" where 1= 1 ");
         whereStr.Append(" and [ArticleTagName] = '").Append(Server.HtmlEncode(param1.Trim())).Append("'");
        if (!String.IsNullOrEmpty(param))
        {
            whereStr.Append(" and [Title] like '%").Append(Server.HtmlEncode(param.Trim().Replace("'", ""))).Append("%' ");
        }
    
     
        string sql = "select count(ID) as total from Articles_ArticleTags " + whereStr.ToString();

        using (SqlConnection conn = (SqlConnection)new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                AspNetPager1.RecordCount = Convert.ToInt16(rd[0]);
            }
            else
            {
                AspNetPager1.RecordCount = 0;
            }
            rd.Close();

            Label1.Text = AspNetPager1.RecordCount + "";//总记录数
            Label2.Text = (AspNetPager1.RecordCount / AspNetPager1.PageSize) + 1 + "";//总页数            

            if (AspNetPager1.CurrentPageIndex == 1)
            {
                sql = "Select top " + AspNetPager1.PageSize + " * from Articles_ArticleTags " + whereStr.ToString() + " " + OrderDDL.SelectedValue;
            }
            else
            {
                // Select Top 页容量 * from 表 where 条件 and id not in	(Select Top 页容量*（当前页数-1） id 	from 表 where 条件 order by 排序条件) order by 排序条件
                sql = "Select top " + AspNetPager1.PageSize + " * from Articles_ArticleTags " + whereStr.ToString() + " and id not in ( select top " + AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1) + " id  from Articles_ArticleTags " + whereStr.ToString() + " " + OrderDDL.SelectedValue + " ) " + OrderDDL.SelectedValue;
                //sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER ( " + orderStr + ") AS MyRank,* FROM Article " + whereStr +" ) AS Rank " + whereStr + " and MyRank BETWEEN " +AspNetPager1.StartRecordIndex+" AND "+ (AspNetPager1.StartRecordIndex+AspNetPager1.PageSize-1) +orderStr;
            }
            //TestLabel.Text = sql;
            cmd.CommandText = sql;
            rd = cmd.ExecuteReader();
            GridView2.DataSource = rd;
            GridView2.DataBind();
            rd.Close();
        }
    }

    protected void SelectAllCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)GridView2.Rows[i].FindControl("ChechBox1");
            if (SelectAllCheckBox.Checked == true)
            {
                cbox.Checked = true;
            }
            else
            {
                cbox.Checked = false;
            }
        }
    }

    protected void PageSizeDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }



    protected void AuthorDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }


    protected void OrderDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        MyDataBind();
    }

   
 
    protected void SubsDDL_SelectedIndexChanged1(object sender, EventArgs e)
    {
        MyDataBind();
    }


    protected void ArDelBtn_Click(object sender, EventArgs e)
    {
       
        string ids = "";
        for (int i = 0; i <= GridView2.Rows.Count - 1; i++)
        {
            CheckBox checkBox = (CheckBox)GridView2.Rows[i].FindControl("ChechBox1");
            if (checkBox.Checked == true)
            {
                ids += "," + GridView2.DataKeys[i].Value;
            }
        }
        if (!String.IsNullOrEmpty(ids))
        {
            ids = ids.Substring(1);
            IDS.Text = ids;
            string[] array = ids.Split(',');
            int k = array.Length;
            string count = Count.Text;
            using (SqlConnection conn = new DB().GetConnection())
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "Delete from Articles_ArticleTags where ArticleTagID=@TagID1 and ID in ("+IDS.Text+") ";
                cmd.Parameters.AddWithValue("@TagID1", TagID.Text);
                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                int Articles = Convert.ToInt32(count);
                Articles = Articles - k;



                cmd.CommandText = "update ArticleTags set Articles= @Articles where ID=@ID";
                cmd.Parameters.AddWithValue("@ID", TagID.Text);
                cmd.Parameters.AddWithValue("@Articles", Articles);
                cmd.ExecuteNonQuery();


                MyDataBind();
 

                conn.Close();

            }
           
          
        }
        else {
            Response.Write("<script language='javascript'> alert('至少选择一项');</script>");
        }
    
    
    
    
    
    
    }



}