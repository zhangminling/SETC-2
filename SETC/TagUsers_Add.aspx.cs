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
using System.Data;

public partial class TagUsers_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["IDS"] != null)
            {
                
                IDSLabel.Text = Request.QueryString["IDS"];
                MyInit();
             }
            using (SqlConnection conn = new DB().GetConnection())
            {
                string userid = Convert.ToString(Session["UserID"]);
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "select distinct RoleName as RoleName from Roles";
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                RoleTypeDDL.DataSource = rd;
                RoleTypeDDL.DataValueField = "RoleName";
                RoleTypeDDL.DataTextField = "RoleName";
                RoleTypeDDL.DataBind();
                rd.Close();
                RoleTypeDDL.Items.Insert(0, new ListItem("角色类型", ""));

                cmd.CommandText = "select * from UserTags where UserID = @UserID order by ID desc";
                cmd.Parameters.AddWithValue("@UserID", userid);
                rd = cmd.ExecuteReader();
                CheckBoxList1.DataSource = rd;
                CheckBoxList1.DataTextField = "TagName";
                CheckBoxList1.DataValueField = "ID";
                CheckBoxList1.DataBind();
                rd.Close();
            }

          //  MyDataBind();
            MyDataBind2();
            for (int i = 0; i <= TagsList.Items.Count - 1; i++)
            {
                 TagsList.Items[i].Selected = true;
            }

        }
    }

    private void MyInit()
    {
        string userid = Convert.ToString(Session["UserID"]);
        using (SqlConnection conn = new DB().GetConnection())
        {
            string sql = "select * from UserTags where ID in (" +

              IDSLabel.Text + ") order by ID desc";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@UserID", userid);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            TagsList.DataSource = rd;
            TagsList.DataTextField = "TagName";
            TagsList.DataValueField = "ID";
            TagsList.DataBind();
            rd.Close();
        }
    }

    private void MyDataBind() 
    {
        string tags = "";
        AspNetPager1.PageSize = Convert.ToInt16(PageSizeDDL.SelectedValue);
        StringBuilder whereStr = new StringBuilder(" where 1= 1 ");
        for (int i = 0; i <= CheckBoxList1.Items.Count - 1; i++)
        {
            if (CheckBoxList1.Items[i].Selected == true)
            {
                whereStr.Append(" and UserTagID = '").Append(CheckBoxList1.Items[i].Value).Append("'");
                tags += "," + CheckBoxList1.Items[i].Value;
            }
        }
        tags = tags.Substring(1);
         
            string sql = "select UserID from Users_UserTags where UserTagID in ("+tags+") " ;
            string sql2 = "SELECT count(UserID) from Users_UserTags where UserTagID in (" + tags + ")";
           using (SqlConnection conn = new DB().GetConnection())
            {
                SqlCommand cmd = conn.CreateCommand();
                SqlCommand cmd2 = conn.CreateCommand();
                cmd.CommandText = sql;
                cmd2.CommandText = sql2;
                conn.Open();
                //sql = cmd.ExecuteScalar().ToString();
             
                //SqlDataReader rd2 = cmd2.ExecuteReader();
               
                int count = int.Parse(Convert.ToString(cmd2.ExecuteScalar()));
                AspNetPager1.RecordCount = count;
                string[] USERID = new string[count];
                SqlDataReader rd = cmd.ExecuteReader();
                for (int j = 0; j < count; j++)
                {
                    if (rd.Read())
                    {
                        
                        USERID[j] = rd["UserID"].ToString();
                    }
                }
                rd.Close();

               string s = "";
               for (int j = 0; j < count; j++) 
                {
                    s = string.Join(",", USERID);
                }
              //  Label4.Text = USERID[0];
                Label5.Text = s;
                Label6.Text = tags;
            


                if (AspNetPager1.CurrentPageIndex == 1)
                {
                    sql = "Select top " + AspNetPager1.PageSize + " * from Users where ID in (" + Label5.Text + ") " + OrderDDL.SelectedValue;
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
            whereStr.Append(" and RoleName = '").Append(RoleTypeDDL.SelectedValue).Append("'");
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

    protected void AddBtn_Click(object sender, EventArgs e)
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
        string[] array = ids.Split(',');
        int k = array.Length;
        string[] USERID = new string[10];
        string[] USERNAME = new string[10];
        string USERTAGID = "";
        string USERTAGNAME = "";
        int p;
        using (SqlConnection conn = new DB().GetConnection()) 
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Users where ID in (" + Label3.Text + ") order by ID desc  ";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            for ( p = 0; p <= k - 1; p++) { 
            if (rd.Read()) 
            {
                USERID[p] = rd["ID"].ToString();
                USERNAME[p] = rd["UserName"].ToString();
              
            }
            }
            rd.Close();

            Label3.Text = USERID[p];
            cmd.CommandText = "select * from UserTags where ID in (" + IDSLabel.Text + ") order by ID desc";
            SqlDataReader rd1 = cmd.ExecuteReader();
            if (rd1.Read())
            {
                USERTAGID = rd1["ID"].ToString();
                USERTAGNAME = rd1["TagName"].ToString();

            }
            rd1.Close();

            cmd.CommandText = "update UserTags set Users= @Users where  ID in (" + IDSLabel.Text + ")";
            cmd.Parameters.AddWithValue("@Users", k);
            cmd.ExecuteNonQuery();
           //string[] Arrays = USERID.Split(',');
           //string[] Arrays1 = USERNAME.Split(',');
           for (int j = 0; j <= k-1; j++)
                {
                     //USERID = Arrays[j];
                     //USERNAME = Arrays1[j];
                    StringBuilder sb = new StringBuilder("insert into Users_UserTags(UserID,UserName,UserTagID,TagName )");
                    sb.Append(" values ( @UserID,@UserName,@UserTagID,@TagName ) ");
                    SqlCommand cmd1 = new SqlCommand(sb.ToString(), conn);
                    cmd1.Parameters.AddWithValue("@UserID", USERID[j]);
                    cmd1.Parameters.AddWithValue("@UserName", USERNAME[j]);
                    cmd1.Parameters.AddWithValue("@UserTagID", USERTAGID);
                    cmd1.Parameters.AddWithValue("@TagName", USERTAGNAME);
                    cmd1.ExecuteNonQuery();
               }
         
            conn.Close();
            Response.Write("<script language='javascript'> alert('操作成功');</script>");

        }

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

    protected void TagBtn_Click(object sender, EventArgs e)
    {
        MyDataBind();
    }
}