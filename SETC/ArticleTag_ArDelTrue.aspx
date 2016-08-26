<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ArticleTag_ArDelTrue.aspx.cs" Inherits="ArticleTag_ArDelTrue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="ID" runat="server" Text="" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="Article_Recycle.aspx">回收站</a> >> <a href="#">彻底删除文章</a>
</div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

<p>&nbsp;</p>
    <p>您确定要删除以下文章吗？一旦删除，将不可恢复！<asp:Button ID="Button1" runat="server" Text="确定删除" 
            CssClass="Button" onclick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="Button2" 
            runat="server" Text="取消返回" CssClass="Button" onclick="Button2_Click" />
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ResultLabel" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
</p>
<p>&nbsp;</p>

<div id="RightContent">

<asp:GridView ID="GridView1" DataKeyNames="ID" runat="server" AutoGenerateColumns="false" Width="99%" RowStyle-Height="26" ShowHeader="true">
<Columns>
    <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
    <ItemTemplate>
        <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
    </ItemTemplate>
    <ItemStyle Width="30px" HorizontalAlign="center"/>        
    </asp:TemplateField>
    <asp:HyperLinkField DataNavigateUrlFields="ArticleID" 
        DataNavigateUrlFormatString="Article_View.aspx?ID={0}" DataTextField="Title" 
        HeaderText="标题" ItemStyle-Width="350" ItemStyle-HorizontalAlign="Left" Target="_blank" >
    </asp:HyperLinkField> 
                          
</Columns>
</asp:GridView>
<br />    
</div>

</ContentTemplate></asp:UpdatePanel>
</asp:Content>

