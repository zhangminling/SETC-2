using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Article_View2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Random r = new Random();
            Image1.ImageUrl = "images/random/V" + (r.Next(12) + 1) + ".jpg";

            if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                ArticleID.Text = Request.QueryString["ID"].Trim();
                MyInit();
            }
        }
    }

    private void MyInit()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            conn.Open();
            cmd.CommandText = "Update Articles set ViewTimes = ViewTimes + 1 where ID = @ID";
            cmd.Parameters.AddWithValue("@ID", ArticleID.Text);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            string CatID = "0";
            string SubID = "";
            string SubName = "";
            cmd.CommandText = "select * from Articles where ID = @ID2";
            cmd.Parameters.AddWithValue("@ID2", ArticleID.Text);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                ArticleTitle.Text = rd["Title"].ToString();
                CatID = rd["CatID"].ToString();
                SubID = rd["SubID"].ToString();
                SubName = rd["SubName"].ToString();
                TagName.Text = rd["TagName"].ToString();
                Author.Text = rd["Author"].ToString();
                CDT.Text = String.Format("{0:yyyy-MM-dd}", rd["CDT"]);
                ViewTimes.Text = rd["ViewTimes"].ToString();
                ReviewTimes.Text = rd["ReviewTimes"].ToString();
                Content.Text = rd["Content"].ToString();

            }
            rd.Close();
            if (!String.IsNullOrEmpty(SubName))
            {
                SubLabel.Text = " >> ";
                SubHyperLink.Text = SubName;
                SubHyperLink.NavigateUrl = "Article_List2.aspx?ID=" + SubID;
            }


            cmd.CommandText = "select ID,CatName,Subs,Description from Cats where ID = '" + CatID + "'";
            rd = cmd.ExecuteReader();
            int subs = 0;
            if (rd.Read())
            {
                CategoryHyperLink.Text = CategoryLabel.Text = rd["CatName"].ToString();
                CategoryHyperLink.NavigateUrl = "Article_List.aspx?c=" + rd["CatName"].ToString();
                subs = Convert.ToInt16(rd["Subs"]);
                DescriptionLabel.Text = rd["Description"].ToString();
            }
            rd.Close();

            if (subs > 0)
            {
                cmd.CommandText = "select ID,SubName from Subs where Valid = 1 and CatID = " + CatID + " Order By Orders Desc";
                rd = cmd.ExecuteReader();
                GridView2.DataSource = rd;
                GridView2.DataBind();
                rd.Close();
            }
        }
    }
}

