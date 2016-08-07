<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Folder_Edit.aspx.cs" Inherits="Folder_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        input[type="radio"]{border:none;}
        input[type="radio"]+label {margin-right:20px;}
        #GridViewDiv table tr td{
        padding:4px 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="LabelFolderID" runat="server" Visible="false" Text=""></asp:Label>

<div id="CurrentPosition">当前位置：<a href="Folder_Man.aspx">文件夹管理</a> >> <a href="#">编辑文件夹</a></div>

<p>&nbsp;</p>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<div id="RightContent">    
    
    <center>
    <table width="760" align="center" class="MyTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td colspan="3"><h2>文 件 夹 信 息</h2></td></tr>
        <tr><td width="180">&nbsp;</td>
        <td align="left" colspan="2"><asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label></td>    
        </tr> 
        <tr><td>文件夹名：</td>
        <td width="300" align="left"><asp:TextBox ID="FolderName" runat="server" 
                MaxLength="30" Width="300" CssClass="TextBox"></asp:TextBox></td>
        <td width="200" align="left">&nbsp;</td>
        </tr>    
        <tr><td>&nbsp;</td>
        <td align="left" colspan="2"><div id="div4" style="font-size:12px;color:#999;"> 请输入新的文件夹名</div></td>    
        </tr>    
        <tr><td>资源数：</td>
        <td width="200" align="left">
            <asp:Label ID="Counts" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" Text=" 更新 " CssClass="Button" onclick="Button3_Click" /></td>
        <td width="260" align="left">&nbsp;</td>
        </tr>
        <tr><td>创建日期：</td>
        <td width="200" align="left">
            <asp:Label ID="CreateDateTime" runat="server" Text="Label"></asp:Label>
            </td>
        <td width="260" align="left">&nbsp;</td>
        </tr>    
        <tr><td colspan="3">&nbsp;</td>      
        </tr>
        
        <tr><td>&nbsp;</td>
        <td width="200" align="left"><br />
            <asp:Button ID="Button1" runat="server" Text=" 确定修改 " CssClass="Button" 
                onclick="Button1_Click" /></td>
            
        <td width="260" align="left"><br />
            <asp:Button ID="Button2" runat="server" Text=" 删除文件夹 " CssClass="Button" 
                onclick="Button2_Click"  OnClientClick="return confirm('确定删除文件夹吗？');"  />
        </td>
        </tr>
            
        </table>
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
                    DataNavigateUrlFormatString="File_Edit.aspx?ID={0}" DataTextField="ResourceName" 
                    HeaderText="资源名称" ItemStyle-Width="160px" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" Target="_blank" >
                    </asp:HyperLinkField>
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

    </center>
    
    
</div>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

