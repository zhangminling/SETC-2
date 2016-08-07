using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

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

    protected void Button2_Click(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(ID_Label.Text))
        {
            using (SqlConnection conn = new DB().GetConnection())
            {
                int orders = Convert.ToInt16(OrdersTextBox.Text);
                string sql = "update focuses set LinkURL = @LinkURL,Orders = @Orders,Valid=@Valid where ID = @ID";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                cmd.Parameters.AddWithValue("@LinkURL", LinkURLTextBox.Text);
                cmd.Parameters.AddWithValue("@Orders", OrdersTextBox.Text);
                cmd.Parameters.AddWithValue("@Valid", ValidCheckBox.Checked);
                cmd.Parameters.AddWithValue("@ID", ID_Label.Text);
                cmd.ExecuteNonQuery();
            }

            MyDataBind();
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
            DoEdit(id);
        }
        if (e.CommandName.Equals("Del2"))
        {
            DoDel(id);
        }
    }

    protected void DoEdit(int id)
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            string sql = "select * from Focuses where ID = @ID";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ID", id);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Image1.ImageUrl = rd["PhotoSrc"].ToString();
                LinkURLTextBox.Text = rd["LinkURL"].ToString();
                OrdersTextBox.Text = rd["Orders"].ToString();
                ValidCheckBox.Checked = Convert.ToBoolean(rd["Valid"]);
            }
            rd.Close();
            conn.Close();
        }
    }

    protected void DoDel(int id)
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            string sql = "delete from Focuses where ID = @ID";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ID", id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}