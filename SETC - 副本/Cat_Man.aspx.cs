using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;

public partial class Cat_Man : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CatName.Focus();
            if (!String.IsNullOrEmpty(Request["ID"]))
            {
                using (SqlConnection conn = new DB().GetConnection())
                {
                    SqlCommand cmd = conn.CreateCommand();
                    string sql = "select * from cats order by valid desc,Orders desc;select * from Cats where ID = @ID";
                    cmd.CommandText = sql;
                    cmd.Parameters.AddWithValue("@ID",Convert.ToInt16(Request["ID"]));
                    conn.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    GridView1.DataSource = rd;
                    GridView1.DataBind();
                    rd.NextResult();
                    if (rd.Read())
                    {
                        ID_TextBox.Text = rd["ID"].ToString();
                        CatName.Text = rd["CatName"].ToString();
                        Orders.Text = rd["Orders"].ToString();
                        Subs.Text = rd["Subs"].ToString();
                        Description.Text = rd["Description"].ToString();
                        int i = Convert.ToInt16(rd["Valid"]);
                        if (i == 1)
                        {
                            Valid.SelectedIndex = 0;
                        }
                        else
                        {
                            Valid.SelectedIndex = 1;
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
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cat_Man.aspx");
    }
}
