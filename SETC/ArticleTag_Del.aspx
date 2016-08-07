<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ArticleTag_Del.aspx.cs" Inherits="ArticleTag_Del" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="ArticleTag_Man.aspx">标签管理</a> >> <a href="#">删除标签</a>
</div>

<p>&nbsp;</p>
    <p2>您确定要删除以下文章标签吗？一旦删除，将不可恢复！
        <asp:Button ID="Button1" runat="server" Text="确定删除" 
            CssClass="Button" onclick="Button1_Click"  OnClientClick="return confirm('确认是否删除该标签？')"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="Button2" 
            runat="server" Text="取消返回" CssClass="Button" onclick="Button2_Click" />
    </p2>
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
    <asp:HyperLinkField DataNavigateUrlFields="ID" 
        DataNavigateUrlFormatString="Article_TagUp.aspx?ID={0}" DataTextField="TagName" 
        HeaderText="文章标签名" ItemStyle-Width="70" ItemStyle-HorizontalAlign="Left" Target="_blank" >
    </asp:HyperLinkField> 
    <asp:BoundField DataField="Description" HeaderText="标签描述" ItemStyle-Width="100" />   
      <asp:BoundField DataField="Articles" HeaderText="文章数" ItemStyle-Width="60" />       
    <asp:BoundField DataField="UserName" HeaderText="创建人"  ItemStyle-Width="80" />
     
</Columns>
</asp:GridView>
<br />    
</div>

</asp:Content>

