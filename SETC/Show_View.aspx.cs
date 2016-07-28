using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Show_View : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Random r = new Random();
        Image1.ImageUrl = "images/random/V" + (r.Next(12) + 1) + ".jpg";

        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                ShowIDLabel.Text = Request.QueryString["ID"];
                SubLabel.Visible = true;
                CategoryHyperLink.Visible = true;
                CategoryHyperLink.Text = Request.QueryString["c"];
                //CategoryHyperLink.NavigateUrl = "Show_List.aspx?ID=" + Request.QueryString["ID"].Trim() + "&c=" + Request.QueryString["c"];
                MyInit();
            }
            
        }
    }

    protected void MyInit()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            SqlDataReader rd = null;
            cmd.CommandText = "select * from Catalogs Order By Orders Desc";
            conn.Open();
            rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();

            string AuthorID = "";
            cmd.CommandText = "Select * from Shows where ID = @ID";
            cmd.Parameters.AddWithValue("@ID", ShowIDLabel.Text);
            //ShowIDLabel.Text;
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                ArticleTitle.Text = rd["Title"].ToString();
                AuthorID = rd["AuthorID"].ToString();
                Author.Text = rd["Author"].ToString();
                CDT.Text = String.Format("{0:yyyy-MM-dd}", rd["CDT"]);
                ViewTimes.Text = rd["ViewTimes"].ToString();
                Abs.Text = rd["Abs"].ToString();
                CategoryHyperLink.NavigateUrl = "Show_List.aspx?ID=" + rd["CatalogID"].ToString() + "&c=" + rd["Catalog"].ToString();
            }
            rd.Close();

            cmd.CommandText = "Select Avatar from Users where ID = " + AuthorID;
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                AvatarImage.ImageUrl = rd["Avatar"].ToString();
            }
            rd.Close();

            cmd.CommandText = "Select * from Items where ShowID = @ShowID";
            //+ShowIDLabel.Text;
            cmd.Parameters.AddWithValue("@ShowID", ShowIDLabel.Text);
            rd = cmd.ExecuteReader();
            Repeater1.DataSource = rd;
            Repeater1.DataBind();
            rd.Close();

            cmd.CommandText = "Update Shows set ViewTimes = ViewTimes+1 where ID = @ID2";
            //+ShowIDLabel.Text;
            cmd.Parameters.AddWithValue("@ID2", ShowIDLabel.Text);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }
    }
}
