using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Slider_LeftToRight : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string url = @"server=(local)\SQLEXPRESS;database=Test;Trusted_Connection=True";
            using (SqlConnection conn = new SqlConnection(url))
            {
                string sql = "select * from FocusPhoto";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                Repeater1.DataSource = rd;
                Repeater1.DataBind();
                rd.Close();
                conn.Close();
            }
        }
    }
}
