using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Article_List2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Random r = new Random();
            Image1.ImageUrl = "images/random/V" + (r.Next(12) + 1) + ".jpg";
            string ArticleID = "0";
            int go = 0;
            if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                ViewState["SubID"] = Request.QueryString["ID"];
                //CategoryLabel.Text = CategoryHyperLink.Text = Request.QueryString["c"].Trim();
                //CategoryHyperLink.NavigateUrl = "Article_List.aspx?c=" + Request.QueryString["c"].Trim();
                
                // 如果栏目下，只有一篇文章，则直接显示文章                
                //string sql = "select ID from Articles  where SubID = " + ViewState["SubID"] + " and Status = 1 and Finished = 1 ";
                using (SqlConnection conn = new DB().GetConnection())
                {
                    SqlCommand cmd = conn.CreateCommand();
                    cmd.CommandText = "select ID from Articles  where SubID = @SubID and Status = 1 and Finished = 1";
                    cmd.Parameters.AddWithValue("@SubID", ViewState["SubID"]);
                    conn.Open();
                    SqlDataReader rd = cmd.ExecuteReader();                    
                    while (rd.Read())
                    {
                        ArticleID = rd["ID"].ToString();
                        go += 1;
                        if (go > 2)
                        {
                            break;
                        }
                    }
                    rd.Close();
                }

                if (go == 1)
                {
                    Response.Redirect("Article_View.aspx?ID=" + ArticleID);
                }
                else
                {
                    MyInit();
                    MyDataBind();
                }
            }
        }
    }

    private void MyInit()
    {       
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            SqlDataReader rd = null;
            string CatID = "0";
            cmd.CommandText = "Select ID,CatName,Description From Cats Where ID = ( Select CatID From Subs Where ID = @SubID )";
            cmd.Parameters.AddWithValue("@SubID", ViewState["SubID"]);
            conn.Open();
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                CatID = rd["ID"].ToString();
                CategoryLabel.Text = CatHyperLink.Text = rd["CatName"].ToString();
                CatHyperLink.NavigateUrl = "Article_List.aspx?c=" + rd["CatName"].ToString();
                DescriptionLabel.Text = rd["Description"].ToString();
            }
            rd.Close();

            //cmd.CommandText = "Select SubName From Subs where ID = " + ViewState["SubID"];
            cmd.CommandText = "Select SubName From Subs where ID = @SubID4";
            cmd.Parameters.AddWithValue("@SubID4", ViewState["SubID"]);
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                SubHyperLink.Text = rd["SubName"].ToString();
                SubHyperLink.NavigateUrl = "Article_List2.aspx?ID=" + ViewState["SubID"];
            }
            rd.Close();

            cmd.CommandText = "select ID,SubName from Subs where Valid = 1 and CatID = " + CatID + " Order by Orders Desc";
            rd = cmd.ExecuteReader();
            GridView2.DataSource = rd;
            GridView2.DataBind();
            rd.Close();

            /*
            cmd.CommandText = "Select top " + PageSizeDDL.SelectedValue + " * from Articles where CatID = " + CategoryID + " and Status = 1 and Finished = 1 order by Orders Desc,ID Desc";
            rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
            */
        }
    }

    private void MyDataBind()
    {
        AspNetPager1.PageSize = Convert.ToInt16(PageSizeDDL.SelectedValue);

        string whereStr = " where SubID = @SubID and Status = 1 and Finished = 1";
        string sql = "select count(ID) as total from Articles " + whereStr;

        using (SqlConnection conn = (SqlConnection)new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.AddWithValue("@SubID", ViewState["SubID"]);
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

            RecordCountLabel.Text = AspNetPager1.RecordCount + "";//总记录数
            TotalPagesLabel.Text = (AspNetPager1.RecordCount / AspNetPager1.PageSize) + 1 + "";//总页数            

            if (AspNetPager1.RecordCount / AspNetPager1.PageSize < 1)
            {
                AspNetPager1.Visible = false;
            }
            else
            {
                AspNetPager1.Visible = true;
            }

            whereStr = " where SubID = @SubID2 and Status = 1 and Finished = 1";
            if (AspNetPager1.CurrentPageIndex == 1)
            {
                sql = "Select top " + AspNetPager1.PageSize + " * from Articles " + whereStr + " Order by Orders Desc,CDT Desc,ID Desc";
            }
            else
            {
                // Select Top 页容量 * from 表 where 条件 and id not in	(Select Top 页容量*（当前页数-1） id 	from 表 where 条件 order by 排序条件) order by 排序条件
                sql = "Select top " + AspNetPager1.PageSize + " * from Articles " + whereStr + " and id not in ( select top " + AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1) + " id  from Articles " + whereStr + " Order by Orders Desc,CDT Desc,ID Desc" + " ) " + " Order by Orders Desc,CDT Desc,ID Desc";
                //sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER ( " + orderStr + ") AS MyRank,* FROM Article " + whereStr +" ) AS Rank " + whereStr + " and MyRank BETWEEN " +AspNetPager1.StartRecordIndex+" AND "+ (AspNetPager1.StartRecordIndex+AspNetPager1.PageSize-1) +orderStr;
            }
            //TestLabel.Text = sql;
            cmd.CommandText = sql;
            cmd.Parameters.AddWithValue("@SubID2", ViewState["SubID"]);
            rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();

            if (AspNetPager1.PageSize > GridView1.Rows.Count)
            {
                PageDiv.Visible = false;
            }
            else
            {
                PageDiv.Visible = true;
            }
        }
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }

    protected void PageSizeDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }
}
