using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class User_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LabelUserID.Text = Request.QueryString["ID"];            
            // RoleID=1,Administrator;RoleID=2,Editor;RoleID=3,Contributor;RoleID=4,Author;
            if (Session["RoleID"]!=null && !String.IsNullOrEmpty(Session["RoleID"].ToString()) && ( Session["RoleID"].ToString() == "1" || Session["RoleID"].ToString() == "2") )
            {
                Role.Enabled = true;
                ClassesDDL.Enabled = true;
                PasswordPanel.Visible = true;
            }
            else
            {
                Role.Enabled = false;
                ClassesDDL.Enabled = false;
                PasswordPanel.Visible = false;
            }
            using (SqlConnection conn = new DB().GetConnection())
            {
                string sql = "select * from Roles order by ID asc";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                Role.DataSource = rd;
                Role.DataTextField = "RoleName";
                Role.DataValueField = "ID";
                Role.DataBind();
                rd.Close();

                cmd.CommandText = "Select * from Classes where Valid = 1 order by ID asc";
                rd = cmd.ExecuteReader();
                ClassesDDL.DataSource = rd;
                ClassesDDL.DataTextField = "ClassName";
                ClassesDDL.DataValueField = "ID";
                ClassesDDL.DataBind();
                rd.Close();

                cmd.CommandText = "Select * from [Users] where ID = @UserID";
                cmd.Parameters.AddWithValue("@UserID", LabelUserID.Text);
                rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    Email.Text = rd["Email"].ToString();
                    OldPassword.Text = Password.Text = rd["Password"].ToString();                     
                    Status.Text = rd["Status"].ToString();
                    RegisterDateTime.Text = rd["RegisterDateTime"].ToString();
                    string roleID = rd["RoleID"].ToString();
                    if ( Role.Items.FindByValue(roleID) != null )
                    {
                        Role.ClearSelection();
                        Role.Items.FindByValue(roleID).Selected = true;
                    }
                    string classID = rd["ClassID"].ToString();
                    if (ClassesDDL.Items.FindByValue(classID) != null)
                    {
                        ClassesDDL.ClearSelection();
                        ClassesDDL.Items.FindByValue(classID).Selected = true;
                    }
                    Credits.Text = rd["Credits"].ToString();
                    Grade.Text = rd["Grade"].ToString();
                    Shows.Text = rd["Shows"].ToString();
                    Articles.Text = rd["Articles"].ToString();
                    LastLoginDateTime.Text = rd["LastLoginDateTime"].ToString();
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
            string sql = "Update [Users] set Password=@Password,Email = @Email,Status = @Status,RoleID = @RoleID,RoleName = @RoleName,ClassID=@ClassID,ClassName=@ClassName where ID = @UserID";
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (OldPassword.Text != Password.Text)
            {
                cmd.Parameters.AddWithValue("@Password", Util.GetHash(Password.Text.Trim()));
            }
            else
            {
                cmd.Parameters.AddWithValue("@Password", Password.Text);
            }
            cmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
            cmd.Parameters.AddWithValue("@Status", Status.Text);
            cmd.Parameters.AddWithValue("@RoleID", Role.SelectedValue);
            cmd.Parameters.AddWithValue("@RoleName", Role.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ClassID", ClassesDDL.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@ClassName", ClassesDDL.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@UserID", LabelUserID.Text);
            conn.Open();
            i = cmd.ExecuteNonQuery();
            conn.Close();
        }

        if (i == 1)
        {
            ErrorLabel.Text = "用户信息更新成功！";
        }
        else
        {
            ErrorLabel.Text = "用户信息更新失败，请重试！";
        }
    }
}