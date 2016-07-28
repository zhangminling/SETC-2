using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text;
using System.IO;

public partial class Article_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["RoleID"] == null || Session["UserID"] == null)
            {
                Util.ShowMessage("用户登录超时，请重新登录！", "Login.aspx");
            }
            else
            {
                string UserID = Session["UserID"].ToString();
                string UserDict = "~/Users/" + UserID;
                //string FullPath = UserDict + "/Uploads";
                if (!Directory.Exists(Server.MapPath(UserDict)))
                {
                    Directory.CreateDirectory(UserDict);
                }

                //Editor1.SetSecurityGalleryPath(Server.MapPath("~/Users/"));
                /*
                int RoleID = Convert.ToInt16(Session["RoleID"]);
                if (RoleID == 1 || RoleID == 2)
                {
                    Editor1.SetSecurityGalleryPath(Server.MapPath("~/Users/"));
                }
                else
                {
                    Editor1.SetSecurityGalleryPath(Server.MapPath(UserDict));
                }
                */


                if (Request.QueryString["ID"] != null)
                {
                    // 修改文章
                    IDLabel.Text = Request.QueryString["ID"].ToString();
                    MyInitForUpdate();
                }
                else
                {
                    // 新增文章                
                    MyInitForAdd();
                    RandomID.Text = "";//第一次加载页面，为空
                }
            }

        }
    }

    private void MyInitForUpdate()
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Cats order by Orders desc";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Cats.DataSource = rd;
            Cats.DataValueField = "ID";
            Cats.DataTextField = "CatName";
            Cats.DataBind();
            rd.Close();

            

            cmd.CommandText = "select max(Orders) as orders from Articles";
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                MaxOrders.Text = rd[0].ToString();
            }
            rd.Close();

            
            string SubID = "";
            cmd.CommandText = "select * from Articles where ID =" + IDLabel.Text;
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                TitleTB.Text = rd["Title"].ToString();
                string CatID = rd["CatID"].ToString();
                if ( Cats.Items.FindByValue(CatID) != null)
                {
                    Cats.ClearSelection();
                    Cats.Items.FindByValue(CatID).Selected = true;
                }
                SubID = rd["SubID"].ToString();
                CDT_TextBox.Text = String.Format("{0:yyyy-MM-dd}", rd["CDT"]);
                Orders.Text = rd["Orders"].ToString();
                Editor1.Text = rd["Content"].ToString();
                RandomID.Text = rd["RandomID"].ToString();
            }
            rd.Close();

            cmd.CommandText = "select * from Subs where CatID = " + Cats.SelectedValue + " order by Orders desc";
            rd = cmd.ExecuteReader();
            Subs.DataSource = rd;
            Subs.DataTextField = "SubName";
            Subs.DataValueField = "ID";
            Subs.DataBind();
            rd.Close();

            
            if (Subs.Items.Count > 0)
            {
                Subs.Visible = true;
                if (Subs.Items.FindByValue(SubID) != null)
                {
                    Subs.ClearSelection();
                    Subs.Items.FindByValue(SubID).Selected = true;
                }
            }
            else
            {
                Subs.Visible = false;
            }
        }
    }

    private void MyInitForAdd()
    {
        CDT_TextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Cats order by Orders desc";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Cats.DataSource = rd;
            Cats.DataValueField = "ID";
            Cats.DataTextField = "CatName";
            Cats.DataBind();
            rd.Close();

            cmd.CommandText = "select max(Orders) as orders from Articles";
            rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                MaxOrders.Text = rd[0].ToString();
            }
            rd.Close();

            cmd.CommandText = "select * from Subs where CatID = " + Cats.SelectedValue + " order by Orders desc";            
            rd = cmd.ExecuteReader();
            Subs.DataSource = rd;
            Subs.DataTextField = "SubName";
            Subs.DataValueField = "ID";
            Subs.DataBind();
            rd.Close();
        }
        
    }


    // 保存草稿
    protected void Button1_Click(object sender, EventArgs e)
    {
        int i = 0;
        if ( String.IsNullOrEmpty(RandomID.Text) )
        {
            RandomID.Text = Guid.NewGuid().ToString();
            i = DoInsert(0);
        }
        else
        {
            i = DoUpdate(0);
        }

        if (i == 1)
        {
            ResultLabel.Text = "保存草稿成功！";
            ResultLabel.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            ResultLabel.Text = "保存草稿失败，请重试！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
        }
    }

    // 预览
    protected void Button2_Click(object sender, EventArgs e)
    {
        int i = 0;
        if (String.IsNullOrEmpty(RandomID.Text))
        {
            RandomID.Text = Guid.NewGuid().ToString();
            i = DoInsert(0);
        }
        else
        {
            i = DoUpdate(0);
        }

        
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Response.Redirect("Article_Add.aspx");
    }

    // 发表文章
    protected void Button3_Click(object sender, EventArgs e)
    {
        int i = 0;
        if (String.IsNullOrEmpty(RandomID.Text))
        {
            RandomID.Text = Guid.NewGuid().ToString();
            i = DoInsert(1);
            
        }
        else
        {
            i = DoUpdate(1);
        }

        if (i == 1)
        {
            ResultLabel.Text = "发表文章成功，2秒钟后自动跳转！";
            ResultLabel.ForeColor = System.Drawing.Color.Green;
            //Timer1.Enabled = true;            
        }
        else
        {
            ResultLabel.Text = "发表文章失败，请重试！";
            ResultLabel.ForeColor = System.Drawing.Color.Red;
        }
    }

    // 插入操作
    private int DoInsert(int finished)
    {
        int i = 0;

        int SubID = 0;
        String SubName = "";

        if (Subs.Items.Count > 0 && Subs.SelectedValue != null)
        {
            SubID = Convert.ToInt16(Subs.SelectedValue);
            SubName = Subs.SelectedItem.Text;
        }

        String cdt = DateTime.Now.ToString();
        if ( !String.IsNullOrEmpty(CDT_TextBox.Text.Trim()))
        {
            cdt = CDT_TextBox.Text;
        }
        //插入到校园网的表
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Insert into Articles ( Title,Content,CatID,CatName,SubID,SubName,AuthorID,Author,CDT,LDT,Status,AuditorID,Auditor,AuditedDateTime,ViewTimes,ReviewTimes,Orders,Finished,RandomID) ");
            sb.Append(" values ( @Title,@Content,@CatID,@CatName,@SubID,@SubName,@AuthorID,@Author,@CDT,@LDT,@Status,@AuditorID,@Auditor,@AuditedDateTime,@ViewTimes,@ReviewTimes,@Orders,@Finished,@RandomID) ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn );
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text);
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);
            cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Author", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", cdt);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);

            // RoleID={1,Administrator},{2,Editor},{3,Contributor},{4,Author}
         
            /*
            int RoleID = Convert.ToInt16(Session["RoleID"].ToString());
            if (RoleID > 2)
            {
                cmd.Parameters.AddWithValue("@Status", 0); //状态：新投稿/待审核=0，审核已过=1，审核未过=2            

            }
            else
            {
                cmd.Parameters.AddWithValue("@Status", 1); //状态：新投稿/待审核=0，审核已过=1，审核未过=2      
            }
            */
            cmd.Parameters.AddWithValue("@Status", 1);
            cmd.Parameters.AddWithValue("@AuditorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Auditor", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@AuditedDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@ViewTimes", 0);
            cmd.Parameters.AddWithValue("@ReviewTimes", 0);
            cmd.Parameters.AddWithValue("@Orders",Orders.Text);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            i = cmd.ExecuteNonQuery();
            
        }
        //同时数据插入到微信的表
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Insert into Articles2 ( Title,Content,CatID,CatName,SubID,SubName,AuthorID,Author,CDT,LDT,Status,AuditorID,Auditor,AuditedDateTime,ViewTimes,ReviewTimes,Orders,Finished,RandomID) ");
            sb.Append(" values ( @Title,@Content,@CatID,@CatName,@SubID,@SubName,@AuthorID,@Author,@CDT,@LDT,@Status,@AuditorID,@Auditor,@AuditedDateTime,@ViewTimes,@ReviewTimes,@Orders,@Finished,@RandomID) ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text );
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);
            cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Author", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", cdt);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);
            cmd.Parameters.AddWithValue("@Status", 1);
            cmd.Parameters.AddWithValue("@AuditorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Auditor", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@AuditedDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@ViewTimes", 0);
            cmd.Parameters.AddWithValue("@ReviewTimes", 0);
            cmd.Parameters.AddWithValue("@Orders", Orders.Text);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
        }

        return i;
    }

    // 更新操作
    private int DoUpdate(int finished)
    {
        int i = 0;

        int SubID = 0;
        String SubName = "";
        if (Subs.Items.Count > 0 && Subs.SelectedValue != null)
        {
            SubID = Convert.ToInt16(Subs.SelectedValue);
            SubName = Subs.SelectedItem.Text;
        }        
        //更新校园网的数据
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Update Articles set Title = @Title,Content=@Content,CatID=@CatID,CatName=@CatName,SubID=@SubID,SubName=@SubName,AuthorID=@AuthorID,Author=@Author,");
            sb.Append("CDT=@CDT,LDT=@LDT,Orders=@Orders,Finished=@Finished where RandomID = @RandomID ");            
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text);
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);
            cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Author", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", CDT_TextBox.Text);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);            
            cmd.Parameters.AddWithValue("@Orders", Orders.Text);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            i = cmd.ExecuteNonQuery();
        }
        //同时更新微信的数据
        using (SqlConnection conn = new DB().GetConnection())
        {
            StringBuilder sb = new StringBuilder("Update Articles2 set Title = @Title,Content=@Content,CatID=@CatID,CatName=@CatName,SubID=@SubID,SubName=@SubName,AuthorID=@AuthorID,Author=@Author,");
            sb.Append("CDT=@CDT,LDT=@LDT,Orders=@Orders,Finished=@Finished where RandomID = @RandomID ");
            SqlCommand cmd = new SqlCommand(sb.ToString(), conn);
            cmd.Parameters.AddWithValue("@Title", TitleTB.Text);
            cmd.Parameters.AddWithValue("@Content", Editor1.Text);
            cmd.Parameters.AddWithValue("@CatID", Cats.SelectedValue);
            cmd.Parameters.AddWithValue("@CatName", Cats.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SubID", SubID);
            cmd.Parameters.AddWithValue("@SubName", SubName);
            cmd.Parameters.AddWithValue("@AuthorID", Session["UserID"].ToString());
            cmd.Parameters.AddWithValue("@Author", Session["UserName"].ToString());
            cmd.Parameters.AddWithValue("@CDT", CDT_TextBox.Text);
            cmd.Parameters.AddWithValue("@LDT", DateTime.Now);
            cmd.Parameters.AddWithValue("@Orders", Orders.Text);
            cmd.Parameters.AddWithValue("@Finished", finished);
            cmd.Parameters.AddWithValue("@RandomID", RandomID.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
        }
        return i;
    }

    protected void Cats_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from Subs where CatID = " + Cats.SelectedValue + " order by Orders desc";
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            Subs.DataSource = rd;
            Subs.DataTextField = "SubName";
            Subs.DataValueField = "ID";
            Subs.DataBind();
            rd.Close();
        }
        if (Subs.Items.Count > 0)
        {
            Subs.Visible = true;
        }
        else
        {
            Subs.Visible = false;
        }
    }
}
