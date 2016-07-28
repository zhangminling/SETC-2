<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Man.aspx.cs" Inherits="User_Man" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
table td
{
    height:30px;
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="CurrentPosition">当前位置：<a href="User_Man.aspx">用户列表</a></div>    
<div style="height:32px;line-height:32px; float:right;">排序：<asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem Selected="True" Value="Order by ID DESC">默认排序</asp:ListItem>            
    <asp:ListItem Value="Order by Credits DESC">积分降序</asp:ListItem>
    <asp:ListItem Value="Order by Credits ASC">积分升序</asp:ListItem>
    </asp:DropDownList>
</div>
<asp:GridView ID="GridView1" Width="100%" runat="server" RowStyle-BorderColor="#EFF3FB" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="Horizontal">    
    <Columns>
        <asp:TemplateField HeaderText="序">
            <ItemTemplate>
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="30px" HorizontalAlign="center"/>
            <HeaderStyle Width="30px" />
        </asp:TemplateField>        
        <asp:BoundField DataField="UserName" HeaderText="用户名"  ItemStyle-Width="80" >
<ItemStyle Width="80px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Email" HeaderText="Email" Visible="false" />
        <asp:TemplateField HeaderText="头像">
            <ItemTemplate>
                <img src='<%# Eval("Avatar")%>' alt='<%# Eval("UserName")%>' width="80" />
            </ItemTemplate>
        </asp:TemplateField>                
        <asp:BoundField DataField="Status" HeaderText="状态" SortExpression="Status" />
        <asp:BoundField DataField="RoleName" HeaderText="角色" 
            SortExpression="RoleName" />
        <asp:BoundField DataField="Grade" HeaderText="级别" SortExpression="Grade" />
        <asp:BoundField DataField="Shows" HeaderText="作品数" SortExpression="Shows" />
        <asp:BoundField DataField="Articles" HeaderText="文章数" 
            SortExpression="Articles" />
        <asp:BoundField DataField="Credits" HeaderText="积分" SortExpression="Credits" />
        <asp:BoundField DataField="RegisterDateTime" HeaderText="注册日期" 
            ItemStyle-Width="80" >
<ItemStyle Width="80px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="LastLoginDateTime" HeaderText="最后登录" 
            ItemStyle-Width="80" >
<ItemStyle Width="80px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Valid" HeaderText="有效" SortExpression="Valid" />
        <asp:HyperLinkField DataNavigateUrlFields="ID" Text="修改" 
    DataNavigateUrlFormatString="User_Edit.aspx?ID={0}" HeaderText="修改" />
<asp:HyperLinkField DataNavigateUrlFields="ID" Text="删除"
    DataNavigateUrlFormatString="User_Del.aspx?ID={0}" HeaderText="删除" /> 
    </Columns>

    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Height="40" HorizontalAlign="Center" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
    <RowStyle Height="40" HorizontalAlign="Center" VerticalAlign="Middle" />

</asp:GridView>

</asp:Content>

