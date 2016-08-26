using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class File_Del2 : System.Web.UI.Page
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
        int rowNo = 0;
        using (SqlConnection conn = new DB().GetConnection())
        { 
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Update Resources set Valid=0 where ID in (" + IDSLabel.Text + ")";
            conn.Open();
            i = cmd.ExecuteNonQuery();
            cmd.Dispose();

            foreach (GridViewRow row in GridView1.Rows)
            {
                string hidecolum_folderidN = GridView1.DataKeyNames[0];
                int hidecolum_folderidValue = (int)GridView1.DataKeys[rowNo].Value;
                cmd.CommandText = "Update ResourceFolders set Counts = Counts-1 where ID = " + hidecolum_folderidValue.ToString() + "  ";
                cmd.ExecuteNonQuery();
                rowNo++;
            }

            cmd.CommandText = "select * from Resources where  Valid=1 and ID in (" + IDSLabel.Text + ") order by ID desc";
            SqlDataReader rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
            conn.Close();

        }
        if (i > 0)
        {
            ResultLabel.Text = "成功删除" + i + "个资源！";
            ResultLabel.ForeColor = System.Drawing.Color.Green;
            Response.Redirect("File_Man.aspx");
        }
        else
        {
            ResultLabel.Text = "操作失败，请重试！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("File_Man.aspx");
    }
}