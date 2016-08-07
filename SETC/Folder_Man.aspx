<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Folder_Man.aspx.cs" Inherits="Folder_Man" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #GridViewDiv table tr td{
        padding:4px 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="CurrentPosition">
        当前位置：<a href="File_Man.aspx">资源管理</a> >> <a href="#">文件夹管理</a></div>
    <p>
        &nbsp;</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div id="Man_Nav">
                <asp:TextBox ID="SearchTB" runat="server" CssClass="TextBox"></asp:TextBox>
                &nbsp;
                <asp:Button ID="SearchBtn" runat="server" Text="搜索" CssClass="Button" OnClick="SearchBtn_Click" />
                &nbsp;&nbsp;
                <asp:DropDownList ID="OrderDDL" runat="server" OnSelectedIndexChanged="OrderDDL_SelectedIndexChanged"
                    AutoPostBack="True">
                    <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>
                    <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>                    
                </asp:DropDownList>
            </div>    
                <p>
                &nbsp;</p>
            <div>
                <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true" OnCheckedChanged="SelectAllCheckBox_CheckedChanged" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="AddBtn" runat="server" Text="新建" CssClass="Button" OnClick="AddBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="UpdateBtn" runat="server" Text="修改" CssClass="Button" OnClick="UpdateBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="DelBtn" runat="server" Text="删除" CssClass="Button" OnClick="DelBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <p>&nbsp;</p>
            <div class="Label1">
                总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
                条记录，每页显示：
                <asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true" OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="5">5</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="15" Selected="True">15</asp:ListItem>
                    <asp:ListItem Value="25">25</asp:ListItem>
                </asp:DropDownList>
                条记录， 共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>页。
                <asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <br />
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
                    <asp:TemplateField HeaderText="多选" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                        <ItemStyle Width="30px" HorizontalAlign="center" />
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
            <p>&nbsp;&nbsp;
                <webdiyer:AspNetPager CssClass="pages" CurrentPageButtonClass="cpb" AlwaysShow="true"
                    ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
                    PrevPageText="上一页" OnPageChanged="AspNetPager1_PageChanged" PagingButtonSpacing="0">
                </webdiyer:AspNetPager>
            </p>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

