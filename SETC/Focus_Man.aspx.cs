using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Focus_Man : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ExtensionLabel.Text = ConfigurationManager.AppSettings["PhotoExtension"].ToString();
            MyDataBind();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                string fileName = FileUpload1.FileName;
                string extension = System.IO.Path.GetExtension(fileName).ToLower();
                string allowExtension = ConfigurationManager.AppSettings["PhotoExtension"].ToString();
                if (allowExtension.Contains(extension))
                {                    
                    string now = DateTime.Now.ToString("yyyyMMdd_HHmmss");
                    string number = String.Format("{0:0000}", new Random().Next(1000));//生产****四位数的字符串
                    string physicalName = "Users/Focus/" + now + "_" + number + extension;
                    //int fileSize = FileUpload1.PostedFile.ContentLength / 1024 ;
                    //if (fileSize == 0) fileSize = 1;                   
                    FileUpload1.SaveAs(Server.MapPath(physicalName));
                    using (SqlConnection conn = new DB().GetConnection())
                    {
                        SqlCommand cmd = conn.CreateCommand();
                        cmd.CommandText = "insert into Focuses( PhotoSrc,UserID,UserName ) values( @PhotoSrc,@UserID,@UserName )";
                        cmd.Parameters.AddWithValue("@PhotoSrc", physicalName);
                        cmd.Parameters.AddWithValue("@UserID", Session["UserID"].ToString());
                        cmd.Parameters.AddWithValue("@UserName",Session["UserName"].ToString());
                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }

                    Image1.ImageUrl = physicalName;

                    MyDataBind();
                    

                }
                else
                {
                    ResultLabel.Text = "上传图片格式错误！";
                    ResultLabel.Visible = true;
                }
            }
            catch (Exception exc)
            { 
                ResultLabel.Text = "上传图片失败。请重试！或者与管理员联系！<br>" + exc.ToString();
                ResultLabel.Visible = true;
            }
        }
        else
        {
            ResultLabel.Text = "所选图片格式不符合要求";
            ResultLabel.Visible = true;
        }

    }

    protected void MyDataBind()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            string sql = "select * from focuses order by valid desc,orders desc,id desc";
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
