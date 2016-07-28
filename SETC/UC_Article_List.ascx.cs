using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class UC_Article_List : System.Web.UI.UserControl
{
    public string SubID { set; get; }  

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MyInit();
        }
    }

    private void MyInit()
    {
        string sql = "select top 10 * from Articles where SubID = " + SubID + " Order by Orders Desc,CDT Desc,ID Desc"; 
        using (SqlConnection conn = (SqlConnection)new DB().GetConnection())
        {
            SqlCommand cmd = new SqlCommand(sql, conn);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            GridView1.DataSource = rd;
            GridView1.DataBind();
            rd.Close();
        }
    }
}
