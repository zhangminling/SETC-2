<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Focus_Man.aspx.cs" Inherits="Focus_Man" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="CurrentPosition">当前位置：<a href="#">文章模块</a> >> <a href="#">焦点图管理</a></div>
<center><h1>焦点图管理</h1></center>
<p>&nbsp;</p>
    <p>
        最佳图片的大小为1000*300像素，允许上传的图片格式为：<asp:Label ID="ExtensionLabel" runat="server" Text="Label"></asp:Label>。
    </p>
    <p>
        <asp:Label ID="ResultLabel" runat="server" Text="Label"></asp:Label>
    </p>
<div>
<p style="text-align:center;">

    <asp:FileUpload ID="FileUpload1" runat="server" Width="600px" />

&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="上传图片" />
</p>

<p style="text-align:center;">
    <asp:Image ID="Image1" Width="800" Height="240" runat="server" AlternateText="" />
</p>
<p>&nbsp;</p>
<p style="text-align:center;">
链接：<asp:TextBox ID="LinkURLTextBox" runat="server" Width="500"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
排序：<asp:TextBox ID="OrdersTextBox" runat="server" Width="30"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
显示：<asp:CheckBox ID="ValidCheckBox" runat="server" Text="显示" />&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="ID_Label" runat="server" Visible="false" Text="" />
<asp:Button ID="Button2" runat="server" Text="确定" onclick="Button2_Click" />
</p>

<asp:GridView ID="GridView1" runat="server" Width="98%" AutoGenerateColumns="False" DataKeyNames="ID" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        RowStyle-HorizontalAlign="Center" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" 
        onrowcommand="GridView1_RowCommand">
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:BoundField DataField="Orders" HeaderText="排序" ItemStyle-Width="30" 
            Visible="false" >
<ItemStyle Width="30px"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="30px" HorizontalAlign="center"/>
            <HeaderStyle Width="30px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="焦点图" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <img src='<%# Eval("PhotoSrc") %>' alt='<%# Eval("LinkURL") %>' width="500" height="150" />
            </ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
        </asp:TemplateField>        
        <asp:TemplateField HeaderText="排序" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:TextBox ID="OrdersTB" runat="server" Text='<%# Eval("Orders") %>' Width="30" BorderWidth="1"></asp:TextBox>
            </ItemTemplate>
            <ItemStyle Width="60px" HorizontalAlign="center"/>
            <HeaderStyle Width="60px" />
        </asp:TemplateField>
        
        <asp:CheckBoxField DataField="Valid" HeaderText="显示"  />
        <asp:ButtonField ButtonType="Button" CommandName="Edit2" HeaderText="编辑" ShowHeader="True" Text="编辑" />
            
        <asp:ButtonField ButtonType="Button" CommandName="Del2" HeaderText="删除" 
            ShowHeader="True" Text="删除" />
        
        
        
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" HorizontalAlign="Center" Font-Bold="True" Height="32" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>

</div>
<p>&nbsp;</p>
</asp:Content>

