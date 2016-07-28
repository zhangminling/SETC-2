using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Show_List : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Random r = new Random();
        Image1.ImageUrl = "images/random/V" + (r.Next(12) + 1) + ".jpg";

        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                CategoryIDLabel.Text = Request.QueryString["ID"];
                SubLabel.Visible = true;
                CategoryHyperLink.Visible = true;
                CategoryHyperLink.Text = Request.QueryString["c"];
                CategoryHyperLink.NavigateUrl = "Show_List.aspx?ID=" + Request.QueryString["ID"].Trim() + "&c=" + Request.QueryString["c"];
            }            
            MyInit();
            MyDataBind();
        }
    }

    protected void MyInit()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            SqlDataReader rd = null;            
            cmd.CommandText = "select * from Catalogs Order By Orders Desc";
            conn.Open();
            rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
        }
    }

    private void MyDataBind()
    {
        AspNetPager1.PageSize = Convert.ToInt16(PageSizeDDL.SelectedValue);

        string whereStr = " where Status = 1 and Finished = 1 ";
        if (!String.IsNullOrEmpty(CategoryIDLabel.Text))
        {
            whereStr += " and CatalogID = @CatalogID";
        }
        string sql = "select count(ID) as total from Shows " + whereStr;

        using (SqlConnection conn = (SqlConnection)new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = sql;
            cmd.Parameters.AddWithValue("@CatalogID", CategoryIDLabel.Text);
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

            whereStr = " where Status = 1 and Finished = 1 ";
            if (!String.IsNullOrEmpty(CategoryIDLabel.Text))
            {
                whereStr += " and CatalogID = @CatalogID2";
            }

            if (AspNetPager1.CurrentPageIndex == 1)
            {
                sql = "Select top " + AspNetPager1.PageSize + " * from Shows " + whereStr + " Order by Orders Desc,CDT Desc,ID Desc";
            }
            else
            {
                // Select Top 页容量 * from 表 where 条件 and id not in	(Select Top 页容量*（当前页数-1） id 	from 表 where 条件 order by 排序条件) order by 排序条件
                sql = "Select top " + AspNetPager1.PageSize + " * from Shows " + whereStr + " and id not in ( select top " + AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1) + " id  from Shows " + whereStr + " Order by Orders Desc,CDT Desc,ID Desc" + " ) " + " Order by Orders Desc,CDT Desc,ID Desc";
                //sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER ( " + orderStr + ") AS MyRank,* FROM Article " + whereStr +" ) AS Rank " + whereStr + " and MyRank BETWEEN " +AspNetPager1.StartRecordIndex+" AND "+ (AspNetPager1.StartRecordIndex+AspNetPager1.PageSize-1) +orderStr;
            }
            //TestLabel.Text = sql;
            cmd.CommandText = sql;
            cmd.Parameters.AddWithValue("@CatalogID2", CategoryIDLabel.Text);
            rd = cmd.ExecuteReader();
            GridView2.DataSource = rd;
            GridView2.DataBind();
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
