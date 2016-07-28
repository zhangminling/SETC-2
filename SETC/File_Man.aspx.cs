using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class File_Man : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (SqlConnection conn = new DB().GetConnection())
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "select distinct typename as typename from ResourceTypes";
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                ResourceTypeDDL.DataSource = rd;
                ResourceTypeDDL.DataValueField = "typename";
                ResourceTypeDDL.DataTextField = "typename";
                ResourceTypeDDL.DataBind();
                rd.Close();
                ResourceTypeDDL.Items.Insert(0, new ListItem("所有资源类型", ""));

                // RoleID=1,2,3,4，分别对应Administrator,Editor,Contributor,Author
                int RoleID = Convert.ToInt16(Session["RoleID"].ToString());
                if (RoleID == 1 || RoleID == 2)
                {
                    // 只有Administrator和Editor才可以看到所有作者的文章
                    AuthorDDL.Items.Clear();
                    cmd.CommandText = "select * from Users order by ID desc";
                    rd = cmd.ExecuteReader();
                    AuthorDDL.DataSource = rd;
                    AuthorDDL.DataValueField = "ID";
                    AuthorDDL.DataTextField = "UserName";
                    AuthorDDL.DataBind();
                    rd.Close();
                    AuthorDDL.Items.Insert(0, new ListItem("所有用户", "-1"));
                }
                else
                {
                    // Contributor和Author只能看到自己的文章
                    AuthorDDL.Items.Clear();
                    AuthorDDL.Items.Insert(0, new ListItem(Session["UserName"].ToString(), Session["UserID"].ToString()));
                }
            }

            MyDataBind();
        }
    }

    private void MyDataBind()
    {
        AspNetPager1.PageSize = Convert.ToInt16(PageSizeDDL.SelectedValue);
        string param = SearchTB.Text;
        StringBuilder whereStr = new StringBuilder(" where 1= 1 ");
        if (!String.IsNullOrEmpty(param))
        {
            whereStr.Append(" and [ResourceName] like '%").Append(Server.HtmlEncode(param.Trim().Replace("'", ""))).Append("%' ");
        }
        if (ResourceTypeDDL.SelectedIndex> 0)
        {
            whereStr.Append(" and FileType = '").Append(ResourceTypeDDL.SelectedValue).Append("'");
        }        
        if (Convert.ToInt16(AuthorDDL.SelectedValue) > 0)
        {
            whereStr.Append(" and UserID = ").Append(AuthorDDL.SelectedValue);
        }

        string sql = "select count(ID) as total from Resources " + whereStr.ToString();

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
                sql = "Select top " + AspNetPager1.PageSize + " * from Resources " + whereStr.ToString() + " " + OrderDDL.SelectedValue;
            }
            else
            {
                // Select Top 页容量 * from 表 where 条件 and id not in	(Select Top 页容量*（当前页数-1） id 	from 表 where 条件 order by 排序条件) order by 排序条件
                sql = "Select top " + AspNetPager1.PageSize + " * from Resources " + whereStr.ToString() + " and id not in ( select top " + AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1) + " id  from Resources " + whereStr.ToString() + " " + OrderDDL.SelectedValue + " ) " + OrderDDL.SelectedValue;
                //sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER ( " + orderStr + ") AS MyRank,* FROM Article " + whereStr +" ) AS Rank " + whereStr + " and MyRank BETWEEN " +AspNetPager1.StartRecordIndex+" AND "+ (AspNetPager1.StartRecordIndex+AspNetPager1.PageSize-1) +orderStr;
            }
            //TestLabel.Text = sql;
            cmd.CommandText = sql;
            rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
        }
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        MyDataBind();
    }
    protected void AuthorDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }
    protected void ResourceTypeDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }
    protected void OrderDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }
    protected void UpdateBtn_Click(object sender, EventArgs e)
    {

    }
    protected void DelBtn_Click(object sender, EventArgs e)
    {

    }
    protected void SelectAllCheckBox_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void PageSizeDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }
    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        MyDataBind();
    }
}
