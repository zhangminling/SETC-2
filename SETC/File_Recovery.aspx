<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="File_Recovery.aspx.cs" Inherits="File_Recovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="File_Recycle.aspx">回收站</a> >> <a href="#">恢复资源</a>
</div>

<p>&nbsp;</p>
    <p>您确定要恢复以下资源吗？</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ResultLabel" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
</p>

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
            <asp:BoundField DataField="ResourceName" HeaderText="资源名称" ItemStyle-Width="160px" ItemStyle-HorizontalAlign="Left"   />
            <asp:BoundField DataField="FileType" HeaderText="类型" SortExpression="FileType"  ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"   />
            <asp:BoundField DataField="FileSizeInKB" HeaderText="大小(KB)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
            <asp:BoundField DataField="FolderName" HeaderText="文件夹" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
            <%--<asp:BoundField DataField="FileName" HeaderText="文件名" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />--%>
            <asp:BoundField DataField="UserName" HeaderText="上传用户" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
            <asp:BoundField DataField="CDT" HeaderText="上传日期" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center"   />
        </Columns>
    </asp:GridView>
    </div>
    <p>&nbsp;</p>
    <p><asp:Button ID="Button3" runat="server" Text="确定恢复" 
            CssClass="Button" onclick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="Button4" 
            runat="server" Text="取消返回" CssClass="Button" onclick="Button2_Click" />
    </p>
</asp:Content>

