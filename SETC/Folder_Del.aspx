<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Folder_Del.aspx.cs" Inherits="Folder_Del" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="Folder_Man.aspx">文件夹管理</a> >> <a href="#">删除文件夹</a>
</div>

<p>&nbsp;</p>
    <p>您确定要删除以下文件夹吗？一旦删除，将不可恢复！</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ResultLabel" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
</p>

<div id="GridViewDiv">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-Height="24px" class="table table-striped table-bordered table-hover"
        GridLines="Horizontal"  style="text-align:center;" ForeColor="#333333" HeaderStyle-HorizontalAlign="Center" Width="99%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" HorizontalAlign="Center" />
        <HeaderStyle HorizontalAlign="Center" />
        <Columns>
            <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="30px" HorizontalAlign="center" />
                <HeaderStyle Width="30px" />
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="Folder_Edit.aspx?ID={0}" DataTextField="FolderName" 
            HeaderText="文件夹名称" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" Target="_blank" >
            </asp:HyperLinkField>                    
            <asp:BoundField DataField="Counts" HeaderText="资源数" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />  
            <asp:BoundField DataField="CDT" HeaderText="创建日期" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center"   />
        </Columns>
    </asp:GridView>
    </div>
    <p>&nbsp;</p>
    <p><asp:Button ID="Button3" runat="server" Text="确定删除" 
            CssClass="Button" onclick="Button1_Click"   OnClientClick="return confirm('确定删除文件夹吗？');" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="Button4" 
            runat="server" Text="取消返回" CssClass="Button" onclick="Button2_Click" />
    </p>
</asp:Content>

