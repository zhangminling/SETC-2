using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class File_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LabelResourceID.Text = Request.QueryString["ID"];            
            // RoleID=1,Administrator;RoleID=2,Editor;RoleID=3,Contributor;RoleID=4,Author;
            //if (Session["RoleID"]!=null && !String.IsNullOrEmpty(Session["RoleID"].ToString()) && ( Session["RoleID"].ToString() == "1" || Session["RoleID"].ToString() == "2") )
            //{
            //    //Role.Enabled = true;
            //    FolderDDL.Enabled = true;
            //    //PasswordPanel.Visible = true;
            //}
            //else
            //{
            //    //Role.Enabled = false;
            //    FolderDDL.Enabled = false;
            //    //PasswordPanel.Visible = false;
            //}
            using (SqlConnection conn = new DB().GetConnection())
            {
                string sql = "Select * from ResourceFolders order by ID asc";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                FolderDDL.DataSource = rd;
                FolderDDL.DataTextField = "FolderName";
                FolderDDL.DataValueField = "ID";
                FolderDDL.DataBind();
                rd.Close();

                cmd.CommandText = "Select * from [Resources] where ID = @ResourceID";
                cmd.Parameters.AddWithValue("@ResourceID", LabelResourceID.Text);
                rd = cmd.ExecuteReader();
                if (rd.Read())
                {

                    ResourceName.Text = rd["ResourceName"].ToString();
                    UserName.Text = rd["UserName"].ToString();
                    FileType.Text = rd["FileType"].ToString();
                    FileSizeInKB.Text = rd["FileSizeInKB"].ToString();
                    CreateDateTime.Text = rd["CDT"].ToString();
                    string resourcefolderID = rd["FolderID"].ToString();
                    if (FolderDDL.Items.FindByValue(resourcefolderID) != null)
                    {
                        FolderDDL.ClearSelection();
                        FolderDDL.Items.FindByValue(resourcefolderID).Selected = true;
                    }
                }
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        ErrorLabel.Text = "";
        int i = 0;
        using (SqlConnection conn = new DB().GetConnection())
        {
            string sql = "Update [Resources] set ResourceName=@ResourceName,FolderID=@FolderID,FolderName=@FolderName where ID = @ResourceID";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@ResourceName", ResourceName.Text.Trim());
            cmd.Parameters.AddWithValue("@FolderID", FolderDDL.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@FolderName", FolderDDL.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ResourceID", LabelResourceID.Text);           
            conn.Open();
            i = cmd.ExecuteNonQuery();
            conn.Close();
            conn.Open();
            cmd.CommandText = "SELECT count(*) from Resources where FolderID =@FolderID";
            int count = int.Parse(Convert.ToString(cmd.ExecuteScalar()));
            cmd.CommandText = "Update ResourceFolders set Counts = "+count.ToString() + " where ID = @ID";
            cmd.Parameters.AddWithValue("@ID", FolderDDL.SelectedItem.Value);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
        }

        if (i == 1)
        {
            ErrorLabel.Text = "媒体信息更新成功！";
            Response.Redirect(Server.HtmlEncode("File_Man.aspx"));
        }
        else
        {
            ErrorLabel.Text = "媒体信息更新失败，请重试！";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        ErrorLabel.Text = "";
        int i = 0;
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Update Resources set Valid=0 where ID = @ResourceID";
            cmd.Parameters.AddWithValue("@ResourceID", LabelResourceID.Text);
            conn.Open();
            i = cmd.ExecuteNonQuery();
            cmd.Dispose();
            conn.Close();
        }

        if (i == 1)
        {
            Response.Redirect(Server.HtmlEncode("File_Man.aspx"));
        }
        else
        {
            ErrorLabel.Text = "删除资源失败，请重试！";
        }
    }
}