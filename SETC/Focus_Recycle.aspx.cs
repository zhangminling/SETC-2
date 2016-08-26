﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Data;

public partial class Focus_Recycle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MyDataBind();
        }

    }

    protected void MyDataBind()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder whereStr = new StringBuilder(" where Valid=0 ");
            string sql = "select * from focuses " + whereStr.ToString() + " order by valid desc,orders desc,id desc";
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
            
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string id = GridView1.DataKeys[GridView1.SelectedIndex].Value.ToString();
        //using (SqlConnection conn = new DB().GetConnection())
        //{
        //    string sql = "select * from Focuses where ID = @ID";
        //    SqlCommand cmd = new SqlCommand(sql, conn);
        //    cmd.Parameters.AddWithValue("@ID", id);
        //    conn.Open();
        //    SqlDataReader rd = cmd.ExecuteReader();
        //    if (rd.Read())
        //    {
        //        Image1.ImageUrl = rd["PhotoSrc"].ToString();
        //        LinkURLTextBox.Text = rd["LinkURL"].ToString();
        //        OrdersTextBox.Text = rd["Orders"].ToString();
        //    }
        //    rd.Close();
        //}
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = Convert.ToInt16(e.CommandArgument);
        int id = Convert.ToInt16(GridView1.DataKeys[rowIndex].Value);
        ID_Label.Text = id + "";
        if (e.CommandName.Equals("Edit2"))
        {
            Response.Redirect(Server.HtmlEncode("Focus_Edit.aspx?ID=" + id));
        }
        if (e.CommandName.Equals("Del2"))
        {
            DoDel(id);
        }
    }

    protected void DoDel(int id)
    {
        string sqlCon = "";
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            // 删除物理路径下的文件
            {
                sqlCon = "Select * from Focuses where ID = @ID";
                cmd.CommandText = sqlCon;
                cmd.Parameters.AddWithValue("@ID", id);
                conn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds, "PhotoTitle");
                foreach (DataRow drow in ds.Tables["PhotoTitle"].Rows)
                {
                    string FilePath = drow["PhotoSrc"].ToString();
                    // 删除物理路径下的文件
                    System.IO.File.Delete(Server.MapPath(FilePath));
                }
                conn.Close();
            }
            {
                string sql = "delete from Focuses where ID = @ID";
                cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ID", id);
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

        }
        MyDataBind();
    }
}