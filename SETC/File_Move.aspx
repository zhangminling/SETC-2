﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="File_Move.aspx.cs" Inherits="File_Move" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="File_Man.aspx">资源管理</a> >> <a href="#">移动资源</a>
</div>

<p>&nbsp;</p>
    <div>
    <p>请选择保存的目录</p>
    <p>
        <asp:DropDownList ID="FolderDDL" runat="server"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ResultLabel" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>        
    </p>
    </div>
<p>&nbsp;</p>
<div id="GridViewDiv">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-Height="24px" CssClass="GridViewStyle">
        <FooterStyle CssClass="GridViewFooterStyle" />
        <RowStyle CssClass="GridViewRowStyle" />  
        <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
        <PagerStyle CssClass="GridViewPagerStyle" />
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
        <HeaderStyle CssClass="GridViewHeaderStyle" />
        <Columns>
            <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="30px" HorizontalAlign="center" />
                <HeaderStyle Width="30px" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="File_Edit.aspx?ID={0}" DataTextField="ResourceName" 
            HeaderText="资源名称" ItemStyle-Width="160px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" Target="_blank" >
            </asp:HyperLinkField>
            <asp:BoundField DataField="FileType" HeaderText="类型" SortExpression="FileType"  ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"   />
            <asp:BoundField DataField="FileSizeInKB" HeaderText="大小(KB)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
            <asp:BoundField DataField="FolderName" HeaderText="原文件夹" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
            <%--<asp:BoundField DataField="FileName" HeaderText="文件名" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />--%>
            <asp:BoundField DataField="UserName" HeaderText="上传用户" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
            <asp:BoundField DataField="CDT" HeaderText="上传日期" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center"   />
        </Columns>
    </asp:GridView>
    </div>
    <p>&nbsp;</p>
    <p><asp:Button ID="Button1" runat="server" Text="确定移动" 
            CssClass="Button" onclick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="Button2" 
            runat="server" Text="取消返回" CssClass="Button" onclick="Button2_Click" />
    </p>
</asp:Content>
