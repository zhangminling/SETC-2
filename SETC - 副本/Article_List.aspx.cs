using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Article_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Random r = new Random();
        Image1.ImageUrl = "images/random/V" + (r.Next(12) + 1) + ".jpg";

        if (!String.IsNullOrEmpty(Request.QueryString["c"]))
        {
            CategoryLabel.Text = CategoryHyperLink.Text = Request.QueryString["c"].Trim();
            CategoryHyperLink.NavigateUrl = "Article_List.aspx?c=" + Request.QueryString["c"].Trim();
            MyInit();
        }
    }

    private void MyInit()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            SqlDataReader rd = null;
            string CategoryID = "0";
            //cmd.CommandText = "select ID,Description,Subs from Cats where CatName = '" + CategoryLabel.Text + "'";
            cmd.CommandText = "select ID,Description,Subs from Cats where CatName = @CatName";
            cmd.Parameters.AddWithValue("@CatName", CategoryLabel.Text);
            conn.Open();
            rd = cmd.ExecuteReader();

            int subs = 0;
            if (rd.Read())
            {
                CategoryID = rd["ID"].ToString();
                CategoryIDLabel.Text = CategoryID;
                DescriptionLabel.Text = rd["Description"].ToString();
                subs = Convert.ToInt16(rd["Subs"]);
            }
            rd.Close();

            if (subs > 0)
            {
                cmd.CommandText = "select ID,SubName from Subs where Valid = 1 and CatID = " + CategoryID + " Order By Orders Desc";
                rd = cmd.ExecuteReader();
                GridView2.DataSource = rd;
                GridView2.DataBind();
                rd.Close();
                Panel1.Visible = false;
                Panel2.Visible = true;
                MyDataBind2();                
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                MyDataBind();
            }


            /*
            cmd.CommandText = "Select top " + PageSizeDDL.SelectedValue + " * from Articles where CatID = " + CategoryID + " and Status = 1 and Finished = 1 order by Orders Desc,ID Desc";
            rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
            */
        }
    }

    private void MyDataBind2()
    {
        string sql = "select ID,SubName from Subs where Valid = 1 and CatID = " + CategoryIDLabel.Text + " Order By Orders Desc";
        using (SqlConnection conn = (SqlConnection)new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select ID,SubName from Subs where Valid = 1 and CatID = @CatID Order By Orders Desc";             
            cmd.Parameters.AddWithValue("@CatID", CategoryIDLabel.Text);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Repeater1.DataSource = rd;
            Repeater1.DataBind();
            rd.Close();
        }
    }

    private void MyDataBind()
    {
        AspNetPager1.PageSize = Convert.ToInt16(PageSizeDDL.SelectedValue);

        string whereStr = " where CatID = " + CategoryIDLabel.Text + " and Status = 1 and Finished = 1 ";
        string sql = "select count(ID) as total from Articles " + whereStr;

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
