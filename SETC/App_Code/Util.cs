﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
/// <summary>
///Util 的摘要说明
/// </summary>
public class Util
{
    public static string strSuccess = "操作成功！";
    public static string strFail = "操作失败，请重试！";

	public Util()
	{
		//
		//TODO: 在此处添加构造函数逻辑
		//
	}

    public static string GetFileType(string FileExtension)
    {
        int i = 0;
        string s = "";
        //{Image,Video,Audio,Flash}
        String[] ss = { ".jpg,.gif,.png,.bmp", ".flv,.mp4,.mpeg,.avi,.wav", ".mp3", ".swf" };
        for (i = 0; i < ss.Length;i++ )
        {
            if (itemExist(ss[i], FileExtension))
            {   
                break;
            }
        }

        switch (i)
        {
            case 0: s = "Images"; break;
            case 1: s = "Video"; break;
            case 2: s = "Audio"; break;
            case 3: s = "Flash"; break;
            default: s = "";break ;
        }
        return s;
    }

    //s1="1,2,3,123,23";s2="3"; 判断s2,是否在s1中,
    public static bool itemExist(string s1, string s2)
    {
        bool r = false;
        if (!String.IsNullOrEmpty(s1))
        {
            string[] ss = s1.Split(',');
            for (int i = 0; i < ss.Length; i++)
            {
                if (!String.IsNullOrEmpty(ss[i]) && s2 == ss[i].Trim())
                {
                    r = true;
                    break;
                }
            }
        }
        return r;
    }

    public static string GetHash(string password)
    {
        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(password);
        byte[] b2 = new SHA1Managed().ComputeHash(b);
        return Convert.ToBase64String(b2, 0, b2.Length);
    }

    public static bool Qualified(string purview)
    {
        bool result = false;
        if (System.Web.HttpContext.Current.Session["Purview"] == null)
        {
            result = false;
        }
        else
        {
            if( System.Web.HttpContext.Current.Session["Purview"].ToString().Equals("超级管理员") )
            {
                result = true;
            }
            else
            {
                string[] s = purview.Split(',');
                for (int i = 0; i < s.Length; i++)
                {
                    if (System.Web.HttpContext.Current.Session["Purview"].ToString().Equals(s[i]))
                    {
                        result = true;
                        break;
                    }
                }
            }
        }
        return result;
    }

    public static void ShowMessage(string words, string location)
    {
        System.Web.HttpContext.Current.Response.Write("<script>alert('" + words + "');</script>");
        System.Web.HttpContext.Current.Response.Write("<script>location.href='" + location + "';</script>");

    }

    // 用户登录，失败返回-1，成功返回RoleID
    public static int  DoLogin(string username, string password)
    {
        int roleID = -1;
        string UserID = "1";
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from [Users] where [UserName] = @UserName and [Password] = @Password";
            cmd.Parameters.AddWithValue("@UserName", username);
            cmd.Parameters.AddWithValue("@Password", Util.GetHash(password));
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                roleID = Convert.ToInt16(rd["RoleID"]);
                System.Web.HttpContext.Current.Session["RoleID"] = roleID;
                System.Web.HttpContext.Current.Session["RoleName"] = rd["RoleName"].ToString();
                System.Web.HttpContext.Current.Session["Email"] = rd["Email"].ToString();
                System.Web.HttpContext.Current.Session["UserName"] = username;
                System.Web.HttpContext.Current.Session["Avatar"] = rd["avatar"].ToString();
                UserID = rd["ID"].ToString();
                System.Web.HttpContext.Current.Session["UserID"] = UserID;
            }
            cmd.Dispose();
            rd.Close();

            // 更新用户最后一次登录日期，用户积分+1
            cmd.CommandText = "Update [Users] set LastLoginDateTime = @LastLoginDateTime,Credits = Credits+1 where ID = @UserID";
            cmd.Parameters.AddWithValue("@LastLoginDateTime", DateTime.Now);
            cmd.Parameters.AddWithValue("@UserID", UserID);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

        }
        return roleID;
    }

    public static bool AreadyExist(string table, string column, string value)
    {
        bool result = false;
        using (IDbConnection conn = new DB().GetConnection())
        {
            IDbCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select count(*) from " + table + " where " + column + " = '" + value + "'";
            conn.Open();
            if ((int)cmd.ExecuteScalar() > 0)
            {
                result = true;
            }
        }
        return result;
    }

    public static bool AreadyExistd(string table, string column, string[] value)
    {
        bool result = false;
        using (IDbConnection conn = new DB().GetConnection())
        {
            IDbCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select count(*) from " + table + " where " + column + " = '" + value + "'";
            conn.Open();
            if ((int)cmd.ExecuteScalar() > 0)
            {
                result = true;
            }
        }
        return result;
    }

    public static bool SessionOut(string [] key)
    {
        bool result = false;
        for (int i = 0; i < key.Length; i++)
        {
            if (System.Web.HttpContext.Current.Session[key[i]] == null)
            {
                result = true;
                break;
            }
        }
        return result;
    }

    public void Operate()
    {
        //System.Web.HttpContext.Current.
    }

    //更新母版头像和用户完善页头像
    public static int UpdateAvatar(string username)
    {
        int roleID = -1;
        using (SqlConnection conn = new DB().GetConnection())
        {
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select * from [Users] where [UserName] = @UserName ";
            cmd.Parameters.AddWithValue("@UserName", username);
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {

                System.Web.HttpContext.Current.Session["Avatar"] = rd["Avatar"].ToString();


            }
            cmd.Dispose();
            rd.Close();
        }

        return roleID;
    }
}
