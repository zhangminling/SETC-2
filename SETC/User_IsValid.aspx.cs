using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class User_IsValid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (SqlConnection conn = new DB().GetConnection()) 
            {
              
            }
            if (Session["RoleID"] == null || Session["UserID"] == null)
            {
                Util.ShowMessage("用户登录超时，请重新登录！", "Login.aspx");
            }
            else
            {
            using (SqlConnection conn = new DB().GetConnection())
            {
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "select distinct Valid as Valid from Users";
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                RoleTypeDDL.DataSource = rd;
                RoleTypeDDL.DataValueField = "Valid";
                RoleTypeDDL.DataTextField = "Valid";
                RoleTypeDDL.DataBind();
                rd.Close();
                RoleTypeDDL.Items.Insert(0, new ListItem("状态", ""));
               
            }
            }
            MyDataBind2();
        }
    }

    private void MyDataBind2() 
    {
        AspNetPager1.PageSize = Convert.ToInt16(PageSizeDDL.SelectedValue);
        string param = SearchTB.Text;
        StringBuilder whereStr = new StringBuilder(" where 1= 1 ");
        if (!String.IsNullOrEmpty(param))
        {
            whereStr.Append(" and [UserName] like '%").Append(Server.HtmlEncode(param.Trim().Replace("'", ""))).Append("%' ");
        }

        if (RoleTypeDDL.SelectedIndex > 0)
        {
            whereStr.Append(" and Valid = '").Append(RoleTypeDDL.SelectedValue).Append("'");
        }
        string sql = "select count(ID) as total from Users " + whereStr.ToString();

        using (SqlConnection conn = new DB().GetConnection())
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
                sql = "Select top " + AspNetPager1.PageSize + " * from Users " + whereStr.ToString() + " " + OrderDDL.SelectedValue;
            }
            else
            {
                // Select Top 页容量 * from 表 where 条件 and id not in	(Select Top 页容量*（当前页数-1） id 	from 表 where 条件 order by 排序条件) order by 排序条件
                sql = "Select top " + AspNetPager1.PageSize + " * from Users " + whereStr.ToString() + " and id not in ( select top " + AspNetPager1.PageSize * (AspNetPager1.CurrentPageIndex - 1) + " id  from Users " + whereStr.ToString() + " " + OrderDDL.SelectedValue + " ) " + OrderDDL.SelectedValue;
                //sql = "SELECT * FROM (SELECT ROW_NUMBER() OVER ( " + orderStr + ") AS MyRank,* FROM Article " + whereStr +" ) AS Rank " + whereStr + " and MyRank BETWEEN " +AspNetPager1.StartRecordIndex+" AND "+ (AspNetPager1.StartRecordIndex+AspNetPager1.PageSize-1) +orderStr;
            }
            //TestLabel.Text = sql;
            cmd.CommandText = sql;
            rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataKeyNames = new string[] { "ID" };
            GridView1.DataBind();
            rd.Close();


        }
    }

    protected void SelectAllCheckBox_CheckedChanged(object sender, EventArgs e)
    {
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox cbox = (CheckBox)GridView1.Rows[i].FindControl("ChechBox1");
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

    protected void RoleTypeDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind2();
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        MyDataBind2();
    }

    protected void PageSizeDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind2();
    }

    protected void OrderDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        MyDataBind2();
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        MyDataBind2();
    }
    protected void IsTrue_Click(object sender, EventArgs e)
    {
        string ids = "";
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox checkBox = (CheckBox)GridView1.Rows[i].FindControl("ChechBox1");
            if (checkBox.Checked == true)
            {
                ids += "," + GridView1.DataKeys[i].Value;
            }
        }
        ids = ids.Substring(1);
        Label3.Text = ids;
        string t = "True";
        using (SqlConnection conn = new DB().GetConnection()) 
        {
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Update [Users] set Valid = @Valid  where ID in (" + Label3.Text + ") ";
            cmd.Parameters.AddWithValue("@Valid", t);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
            Response.Write("<script language='javascript'> alert('操作成功');</script>");
        }
        MyDataBind2();
    }
   
    protected void IsFalse_Click(object sender, EventArgs e)
    {
        string ids = "";
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox checkBox = (CheckBox)GridView1.Rows[i].FindControl("ChechBox1");
            if (checkBox.Checked == true)
            {
                ids += "," + GridView1.DataKeys[i].Value;
            }
        }
        ids = ids.Substring(1);
        Label3.Text = ids;
        string f = "False";
        using (SqlConnection conn = new DB().GetConnection()) 
        {
              conn.Open();
       
            SqlCommand cmd1 = conn.CreateCommand();
             cmd1.CommandText = "Update [Users] set Valid = @Valid  where ID in (" + Label3.Text + ") ";
                 cmd1.Parameters.AddWithValue("@Valid", f);
                cmd1.ExecuteNonQuery();
                cmd1.Dispose();
            conn.Close();
            Response.Write("<script language='javascript'> alert('操作成功');</script>");
        }
        MyDataBind2();
    }
    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        string ids = "";
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox checkBox = (CheckBox)GridView1.Rows[i].FindControl("ChechBox1");
            if (checkBox.Checked == true)
            {
                ids = GridView1.DataKeys[i].Value.ToString();

            }
        }
        if (!String.IsNullOrEmpty(ids))
        {
            Response.Redirect(Server.HtmlEncode("User_Edit2.aspx?ID=" + ids));
        }
    }
    protected void DelBtn_Click(object sender, EventArgs e)
    {

        string ids = "";
        for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
        {
            CheckBox checkBox = (CheckBox)GridView1.Rows[i].FindControl("ChechBox1");
            if (checkBox.Checked == true)
            {
                ids += "," + GridView1.DataKeys[i].Value;
            }
        }
        if (!String.IsNullOrEmpty(ids))
        {
            ids = ids.Substring(1);
            Response.Redirect(Server.HtmlEncode("User_Del.aspx?IDS=" + ids));
        }
    }
}