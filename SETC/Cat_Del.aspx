
<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cat_Del.aspx.cs" Inherits="Cat_Del" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
 <div id="CurrentPosition" ><h4>当前位置：</h4><a href="Cat_Man.aspx"><h4>分类管理</a>&nbsp;&nbsp;&nbsp;>>&nbsp;&nbsp;<span><a href="#">删除一级分类</a></span></div>
<p>&nbsp;</p>
    <p><h4>您确定要删除以下分类吗？一旦删除，将不可恢复！</h4></p>
  <div height="30px"><p ></p></div>
    <div>
    <asp:Button ID="Button1" runat="server" Text="确定删除" 
            CssClass="Button" onclick="Button1_Click" Height="39px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     <asp:Button ID="Button2" 
            runat="server" Text="返回" CssClass="Button" onclick="Button2_Click" Height="39px" Width="68px" />
    </div>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ResultLabel" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
</p>
<p>&nbsp;</p>

<div id="RightContent">

<asp:GridView ID="GridView1" DataKeyNames="ID" runat="server" AutoGenerateColumns="false" Width="99%" RowStyle-Height="26" ShowHeader="true">
<Columns>
    <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="left">
    <ItemTemplate>
        <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
    </ItemTemplate>
    <ItemStyle Width="30px" HorizontalAlign="center"/>        
    </asp:TemplateField>
     
    <asp:BoundField DataField="CatName" HeaderText="栏目名称" ItemStyle-Width="60" />        
    <asp:BoundField DataField="Description" HeaderText="描述"  ItemStyle-Width="80" />
    <asp:BoundField DataField="Valid"   HeaderText="有效性" ItemStyle-Width="30" />                        
</Columns>
</asp:GridView>
<br />    
</div>
</asp:Content>



