using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;




public partial class Cat_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            using (SqlConnection conn = new DB().GetConnection())
            {
                //string sql = "select * from Cats order by ID desc";
                //SqlCommand cmd = new SqlCommand(sql, conn);
                //conn.Open();
                //SqlDataReader rd = cmd.ExecuteReader();
                //cmd.Parameters.AddWithValue("@ID", Label1.Text);
                //rd = cmd.ExecuteReader();
                //if (rd.Read()) 
                //{
                //    int valid = Convert.ToInt32(rd["Valid"]);
                //    if (valid == 1)
                //    {
                //        true1.Checked = true;
                //    }
                //    else
                //    {
                //        false1.Checked = true;
                //    }
                //}
            }
        }



    }
    protected void ButtonSave_Click(object sender, EventArgs e)
    {

        int i;
        /*SqlConnection conn = new SqlConnection(@"server=QH-20160713TJQE\SQLEXPRESS;database=SETC;Trusted_Connection=True");
        string Sql = "INSERT INTO Cats (CatName,Description) values ('" + CatName.Text + "','" + Description.Text + "')";
        SqlCommand cmd = new SqlCommand(Sql, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();*/
        using (SqlConnection conn = new DB().GetConnection())
        {

            StringBuilder sb = new StringBuilder("Insert into Cats (CatName,Description,Valid) ");
            sb.Append(" values ( @CatName,@Description,@Valid) ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Description", Description.Text);
            cmd.Parameters.AddWithValue("@CatName", CatName.Text);
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
            conn.Open();
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

    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cat_Man.aspx");
    }
}