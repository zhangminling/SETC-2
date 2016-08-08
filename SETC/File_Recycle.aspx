<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="File_Recycle.aspx.cs" Inherits="File_Recycle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #GridViewDiv table tr td{
        padding:4px 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="CurrentPosition">当前位置：<a href="File_Man.aspx">资源管理</a> >> <a href="#">回收站</a></div>
    <p>&nbsp;</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true" OnCheckedChanged="SelectAllCheckBox_CheckedChanged" />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Recovery" runat="server" Text="恢复" CssClass="Button" OnClick="Recovery_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="DelBtn" runat="server" Text="彻底删除" CssClass="Button" onclick="DelBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <p>&nbsp;</p>
            <div class="Label1">
                总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
                条记录，每页显示：
                <asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true" OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">
                    <asp:ListItem Value="2">2</asp:ListItem>
                    <asp:ListItem Value="10">10</asp:ListItem>
                    <asp:ListItem Value="20" Selected="True">20</asp:ListItem>
                    <asp:ListItem Value="50">50</asp:ListItem>
                    <asp:ListItem Value="100">100</asp:ListItem>
                    <asp:ListItem Value="200">200</asp:ListItem>
                    <asp:ListItem Value="500">500</asp:ListItem>
                </asp:DropDownList>
                条记录， 共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>页。
                <asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <br />
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
                    <asp:TemplateField HeaderText="多选" HeaderStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" />
                        </ItemTemplate>
                        <ItemStyle Width="30px" HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="ResourceName" HeaderText="资源名称" ItemStyle-Width="160px" ItemStyle-HorizontalAlign="Left"   />
                    <asp:BoundField DataField="FileType" HeaderText="类型" SortExpression="FileType"  ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"   />
                    <asp:BoundField DataField="FileSizeInKB" HeaderText="大小(KB)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
                    <asp:BoundField DataField="FolderName" HeaderText="文件夹" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
                    <asp:BoundField DataField="UserName" HeaderText="上传用户" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
                    <asp:BoundField DataField="FileName" HeaderText="文件名" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />  
                    <asp:BoundField DataField="CDT" HeaderText="上传日期" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center"   />
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

