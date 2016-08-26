﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.IO;
public partial class Cat_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LabelUserID.Text = Request.QueryString["ID"];    
            CatName.Focus();
            if (!String.IsNullOrEmpty(Request["ID"]))
            {
                using (SqlConnection conn = new DB().GetConnection())
                {
                    SqlCommand cmd = conn.CreateCommand();
                    string sql = "select * from cats order by valid desc,Orders desc;select * from Cats where ID = @ID";
                    cmd.CommandText = sql;
                    cmd.Parameters.AddWithValue("@ID", Convert.ToInt16(Request["ID"]));
                    conn.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    rd.NextResult();



                    
                    if (rd.Read())
                    {

                        CatName.Text = rd["CatName"].ToString();
                        Description.Text = rd["Description"].ToString();

                        //读取单选框所选择的信息
                        int valid = Convert.ToInt32(rd["Valid"]);
                        if (valid == 1)
                        {
                            true1.Checked = true;
                        }
                        else
                        {
                            false1.Checked = true;
                        }

                    }
                    rd.Close();
                    conn.Close();
                }
            }
            else
            {
                MyDataBind();
            }
            //using (sqlconnection conn = new db().getconnection())
            //{
            //    string sql = "select * from Cats order by ID desc";
            //    SqlCommand cmd = new SqlCommand(sql, conn);
            //    conn.Open();
            //    SqlDataReader rd = cmd.ExecuteReader();
            //    cmd.Parameters.AddWithValue("@ID", Label1.Text);
            //    rd = cmd.ExecuteReader();
            //    if (rd.Read())
            //    {
            //        int valid = Convert.ToInt32(rd["Valid"]);
            //        if (valid == 1)
            //        {
            //            true1.Checked = true;
            //        }
            //        else
            //        {
            //            false1.Checked = true;
            //        }
                }
            }

        
    

    protected void MyDataBind()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            string sql = "select * from cats order by valid desc,Orders desc;";
            cmd.CommandText = sql;
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();

            rd.Close();
            conn.Close();
        }
        
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cat_Man.aspx");
    }
    protected void ButtonSave_Click(object sender, EventArgs e)
    {
        int i;
        using (SqlConnection conn = new DB().GetConnection())
        {

            string sql = "Update [Cats] set CatName = @CatName,Description = @Description,Valid=@Valid where ID=@CatID";
            string sql2 = "Update [Articles] set CatName = @CatName2 where CatID=@CatID2";
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlCommand cmd2 = new SqlCommand(sql2, conn);
            cmd2.Parameters.AddWithValue("@CatName2", CatName.Text);
            cmd2.Parameters.AddWithValue("@CatID2", LabelUserID.Text);
            string radiobuttonvalue = "";
            if (true1.Checked)
            {
                radiobuttonvalue = true1.Text;
            }
            else if (false1.Checked)
            {
                radiobuttonvalue = false1.Text;
            }
            cmd.Parameters.AddWithValue("@Valid", radiobuttonvalue);
            cmd.Parameters.AddWithValue("@CatName", CatName.Text);
            cmd.Parameters.AddWithValue("@Description", Description.Text);
            cmd.Parameters.AddWithValue("@CatID", LabelUserID.Text);
          
            conn.Open();
            cmd2.ExecuteNonQuery();
            i = cmd.ExecuteNonQuery();
            conn.Close();
        if (i == 1)
        {
            Response.Write("<script language='javascript'> alert('操作成功');window.location='Cat_Man.aspx';</script>");
        }
        else
        {
            Response.Write("<script language='javascript'> alert('操作失败，请重试！');window.location='Cat_Man.aspx';</script>");
        }
 }
    }
    }
