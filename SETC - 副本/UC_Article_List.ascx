<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_Article_List.ascx.cs" Inherits="UC_Article_List" %>
<center>
<asp:GridView ID="GridView1" DataKeyNames="ID" runat="server" AutoGenerateColumns="false" Width="99%" RowStyle-Height="30" ShowHeader="false" GridLines="None">
    <Columns>
        <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="60px" HorizontalAlign="center"/>        
        </asp:TemplateField>
        <asp:HyperLinkField DataNavigateUrlFields="ID,Title" 
            DataNavigateUrlFormatString="Article_View.aspx?ID={0}&T={1}" DataTextField="Title" 
            HeaderText="标题"  ItemStyle-HorizontalAlign="Left"  >
        </asp:HyperLinkField> 
        <asp:BoundField DataField="Author" HeaderText="作者" ItemStyle-Width="60" Visible="false" />        
        <asp:BoundField DataField="CDT" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Left"  />
        <asp:BoundField DataField="ViewTimes" DataFormatString="{0}"  HeaderText="浏览" ItemStyle-Width="30" Visible="false" />                        
    </Columns>
</asp:GridView>
</center>