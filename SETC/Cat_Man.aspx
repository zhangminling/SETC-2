<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cat_Man.aspx.cs" Inherits="Cat_Man" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
    <div id="CurrentPosition"><h4>当前位置：</h4><span><a href="Cat_Man.aspx"><h4>分类管理&nbsp;&nbsp;>></h4></a></span></div>
<div>
    <div align="left">
        <asp:TextBox ID="TbSearch" runat="server" Height="37px" Width="228px" ></asp:TextBox>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="BtSearch" runat="server"  Text="搜索" Width="84px"  Height="34px"/>
    </div>
    &nbsp;&nbsp;&nbsp;
    <div align="left"> 
            <asp:Button ID="CatAdd" runat="server"  Text="新增一级分类" Height="32px" CssClass="Button" onclick="Button3_Click"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SubAdd" runat="server"  Text="新增二级分类"  Height="32px" CssClass="Button" onclick="Button4_Click"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Man" runat="server"  Text="编辑" Width="65px"  Height="32px" CssClass="Button" onclick="Button2_Click"/>&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Del" runat="server"  Text="删除" Width="65px"  Height="32px" CssClass="Button" OnClick="ButtonDel_Click" />&nbsp;&nbsp;&nbsp;
       </div>
    <div align="center"><asp:Label ID="ResultLabel" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label></div>
 
    &nbsp;&nbsp;&nbsp;

    <div align="center">
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="99%" 
        Font-Size="14px" Font-Underline="False">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" HorizontalAlign="Center" />
    <HeaderStyle HorizontalAlign="Center" />
<Columns>
    <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="20px" HorizontalAlign="center"/>
        <HeaderStyle Width="20px" />
    </asp:TemplateField>
    <asp:TemplateField>
    <ItemTemplate>
    <asp:CheckBox ID="ChechBox1" runat="server" />    
    </ItemTemplate>
    <ItemStyle  HorizontalAlign="Center" />
    </asp:TemplateField>    
    <asp:BoundField DataField="CatName" HeaderText="栏目名称" SortExpression="CatName" ItemStyle-HorizontalAlign="left" />
    <asp:BoundField DataField="Subs" HeaderText="子栏目数" SortExpression="Subs"  ItemStyle-HorizontalAlign="center" />
    <asp:BoundField DataField="Valid" HeaderText="有效" SortExpression="Valid" ItemStyle-HorizontalAlign="left" /> 
    <asp:BoundField DataField="Description" HeaderText="栏目描述" SortExpression="Description"  ItemStyle-HorizontalAlign="left" />                                 

    </Columns>
    <HeaderStyle BackColor="#2dc3e8" Font-Bold="True" ForeColor="White"  Height="30px"/>
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
</asp:Content>

