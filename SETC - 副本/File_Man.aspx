<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true"
    CodeFile="File_Man.aspx.cs" Inherits="File_Man" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
#GridViewDiv table tr td{
padding:4px 4px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="CurrentPosition">
        当前位置：资源模块 >> 资源<a href="Article_Man.aspx">管理</a></div>
    <p>
        &nbsp;</p>
    <div id="Man_Nav">
        <asp:TextBox ID="SearchTB" runat="server" CssClass="TextBox"></asp:TextBox>
        &nbsp;
        <asp:Button ID="SearchBtn" runat="server" Text="搜索" CssClass="Button" OnClick="SearchBtn_Click" />&nbsp;&nbsp;
        <asp:DropDownList ID="AuthorDDL" runat="server" OnSelectedIndexChanged="AuthorDDL_SelectedIndexChanged"
            AutoPostBack="True">
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:DropDownList ID="ResourceTypeDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ResourceTypeDDL_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:DropDownList ID="OrderDDL" runat="server" OnSelectedIndexChanged="OrderDDL_SelectedIndexChanged"
            AutoPostBack="True">
            <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>
            <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>
        </asp:DropDownList>
    </div>    
        <p>
        &nbsp;</p>
    <div>
        总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
        条记录，每页显示：<asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true"
            OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="20" Selected="True">20</asp:ListItem>
            <asp:ListItem Value="50">50</asp:ListItem>
            <asp:ListItem Value="100">100</asp:ListItem>
            <asp:ListItem Value="200">200</asp:ListItem>
            <asp:ListItem Value="500">500</asp:ListItem>
        </asp:DropDownList>
        条记录， 共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>页。<asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true"
            OnCheckedChanged="SelectAllCheckBox_CheckedChanged" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="UpdateBtn" runat="server" Text="重命名" CssClass="Button" OnClick="UpdateBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DelBtn" runat="server" Text="删除" CssClass="Button" OnClick="DelBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <br />
    <div id="GridViewDiv">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%" Font-Size="13px" HeaderStyle-Height="24px" >
        <Columns>
            <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="30px" HorizontalAlign="center" />
                <HeaderStyle Width="30px" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="ChechBox1" runat="server" />
                </ItemTemplate>
                <ItemStyle Width="30px" HorizontalAlign="center" />
            </asp:TemplateField>
            <asp:BoundField DataField="ResourceName" HeaderText="资源名称" ItemStyle-Width="160px" />
            <asp:BoundField DataField="FileType" HeaderText="类型" SortExpression="FileType"  ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"   />
            <asp:BoundField DataField="FileSizeInKB" HeaderText="大小(KB)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Right"   />
            <asp:BoundField DataField="FileName" HeaderText="文件名" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center"   />
            <asp:BoundField DataField="CDT" HeaderText="日期" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center"   />
        </Columns>
    </asp:GridView>
    </div>
    <p>&nbsp;&nbsp;
        <webdiyer:AspNetPager CssClass="paginator" CurrentPageButtonClass="cpb" AlwaysShow="true"
            ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
            PrevPageText="上一页" OnPageChanged="AspNetPager1_PageChanged" LayoutType="Div">
        </webdiyer:AspNetPager>
    </p>
</asp:Content>
