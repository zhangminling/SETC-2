﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class File_DelTrue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["IDS"] != null)
            {
                IDSLabel.Text = Request.QueryString["IDS"].ToString();
                MyInit();
            }
        }
    }
    private void MyInit()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Resources where ID in (" + IDSLabel.Text + ") order by ID desc";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int i = 0;
        string sqlCon = "";
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            // 删除物理路径下的文件
            {
                sqlCon = "Select * from Resources where ID in (" + IDSLabel.Text + ")";
                cmd.CommandText = sqlCon;
                conn.Open();
                SqlDataAdapter sda = new SqlDataAdapter();
                sda.SelectCommand = cmd;
                DataSet ds = new DataSet();
                sda.Fill(ds, "FileName");
                foreach (DataRow drow in ds.Tables["FileName"].Rows)
                {
                    string FilePath = drow["FilePath"].ToString();
                    // 删除物理路径下的文件
                    System.IO.File.Delete(Server.MapPath(FilePath));
                }
                conn.Close();
            }
            {
                sqlCon = "Delete from Resources where ID in (" + IDSLabel.Text + ")";
                cmd.CommandText = sqlCon;
                conn.Open();
                i = cmd.ExecuteNonQuery();
                cmd.Dispose();
                conn.Close();
            }

        }
        if (i > 0)
        {
            ResultLabel.Text = "成功删除" + i + "个资源！";
            ResultLabel.ForeColor = System.Drawing.Color.Green;
            Response.Redirect("File_Recycle.aspx");
        }
        else
        {
            ResultLabel.Text = "操作失败，请重试！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("File_Recycle.aspx");
    }
}