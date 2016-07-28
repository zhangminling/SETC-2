<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Avatar.aspx.cs" Inherits="User_Avatar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div id="CurrentPosition">当前位置：<a href="#">用户中心</a> >> <a href="#">用户头像</a></div>

<p>&nbsp;</p>

<div id="RightContent">    
<p>请上传您的用户头像</p>
<div>
<asp:FileUpload ID="FileUpload1" runat="server" CssClass="FileUpload" />&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="Button1" runat="server" Text=" 上 传 " onclick="Button1_Click"/>
</div>
<p>
<asp:Label ID="ResultLabel" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
</p>
<p>&nbsp;</p>

    <div id="CurrentAvatar">
        <h4>当前用户头像</h4>
        <asp:Image ID="Image1" runat="server" Width="200" AlternateText="用户头像" />
    </div>
    
    
<p>&nbsp;</p>


<asp:Button ID="Button2" runat="server" Text=" 下 一 步 " onclick="Button2_Click" />

    
</div>

</asp:Content>
