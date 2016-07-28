<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Center.aspx.cs" Inherits="User_Center" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>用户使用说明</h2>
    <table width="600" border="1" cellpadding="0" cellspacing="0">
        <tr><td>用户权限</td><td>Author</td><td>Editor</td><td>Administrator</td>
        </tr>
        <tr><td>用户管理</td><td>No</td><td>No</td><td>Yes</td>
        </tr>
        <tr><td>文章管理</td><td>No</td><td>Yes</td><td>Yes</td>
        </tr>
        <tr><td>发布作品</td><td>需审核</td><td>无需</td><td>无需</td>
        </tr>
        <tr><td>作品管理</td><td>限自己</td><td>不限</td><td>不限</td>
        </tr>
    </table>
<p>Author Panel</p>
<p>Editor Panel</p>
<p>Admin Panel</p>
</asp:Content>

