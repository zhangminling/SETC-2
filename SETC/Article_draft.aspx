﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Article_draft.aspx.cs" Inherits="Article_draft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="CurrentPosition">当前位置：<a href="#">文章模块</a> >> <a href="Article_draft.aspx">草稿箱</a></div>
    
<p>&nbsp;</p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

<div id="Man_Nav">
    &nbsp;&nbsp;
    <asp:TextBox ID="SearchTB" runat="server" CssClass="TextBox"></asp:TextBox> &nbsp; 
    <asp:Button ID="SearchBtn" runat="server" Text="搜索" CssClass="Button" 
        onclick="SearchBtn_Click" />&nbsp;&nbsp;
    &nbsp;&nbsp;
    <asp:DropDownList ID="AuthorDDL" runat="server" 
        onselectedindexchanged="AuthorDDL_SelectedIndexChanged" 
        AutoPostBack="True">
    </asp:DropDownList>
    <asp:DropDownList ID="CatsDDL" runat="server" 
        onselectedindexchanged="CatsDDL_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:DropDownList ID="SubsDDL" runat="server" AutoPostBack="True" 
        onselectedindexchanged="SubsDDL_SelectedIndexChanged1">
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:DropDownList ID="OrderDDL" runat="server" 
        onselectedindexchanged="OrderDDL_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem Value=" Order by Orders Desc,ID Desc">默认排序</asp:ListItem>
        <asp:ListItem Value=" Order by LDT Desc">最后更新</asp:ListItem>
        <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>        
        <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>
    </asp:DropDownList>
</div><br />
    <div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;
    <asp:Button ID="UpdateBtn" runat="server" Text="修改" CssClass="Button" 
        onclick="UpdateBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Button ID="DelBtn" runat="server" Text="删除" CssClass="Button" 
        onclick="DelBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;
</div>
<p>&nbsp;</p>
<div>
总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>
条记录，每页显示：<asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true"  Font-Bold="true"
        onselectedindexchanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">          
<asp:ListItem Value="2">2</asp:ListItem>              
        <asp:ListItem Value="10">10</asp:ListItem>        
        <asp:ListItem Value="20">20</asp:ListItem>
        <asp:ListItem Value="50" Selected="True">50</asp:ListItem> 
        <asp:ListItem Value="100">100</asp:ListItem>         
        <asp:ListItem Value="200">200</asp:ListItem>         
        <asp:ListItem Value="500">500</asp:ListItem>         
    </asp:DropDownList> 条记录，
共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>页
</div>
<br />
<div id="RightContent">   
<asp:GridView ID="GridView1" runat="server" DataKeyNames="ID" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None" Width="99%" 
        Font-Size="14px" Font-Underline="False">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" HorizontalAlign="Center" />
    <HeaderStyle HorizontalAlign="Center" />
<Columns>
    <asp:BoundField DataField="Orders" HeaderText="排序" ItemStyle-Width="30" Visible="false" /> 
    <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="30px" HorizontalAlign="center"/>
        <HeaderStyle Width="30px" />
    </asp:TemplateField>
    <asp:TemplateField>
    <ItemTemplate>
    <asp:CheckBox ID="ChechBox1" runat="server" />    
    </ItemTemplate>
    <ItemStyle Width="30px" HorizontalAlign="Left" />
    </asp:TemplateField>    
    <asp:HyperLinkField DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="Article_View.aspx?ID={0}" DataTextField="Title" 
            HeaderText="标题" ItemStyle-Width="350" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" Target="_blank" >
    </asp:HyperLinkField>    
    <asp:BoundField DataField="SubName" HeaderText="二级分类" ItemStyle-Width="60"  />
    <asp:TemplateField HeaderText="排序" HeaderStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:TextBox ID="OrdersTB" runat="server" Text='<%# Eval("Orders") %>' Width="30" BorderWidth="1"></asp:TextBox>
        </ItemTemplate>
        <ItemStyle Width="30px" HorizontalAlign="center"/>
        <HeaderStyle Width="30px" />
    </asp:TemplateField>        
    <asp:BoundField DataField="Author" HeaderText="作者" ItemStyle-Width="40" />    
    <asp:BoundField DataField="Finished" HeaderText="完成" ItemStyle-Width="30" />
    <asp:BoundField DataField="Status" HeaderText="状态" ItemStyle-Width="30" />
     <asp:BoundField DataField="Valid" HeaderText="有效性" ItemStyle-Width="40" />
  
    <asp:BoundField DataField="LDT" HeaderText="日期" DataFormatString="{0:yy-MM-dd}" ItemStyle-Width="80" />
    <asp:BoundField DataField="ViewTimes" HeaderText="点击" ItemStyle-Width="30" />                                   
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  Height="30px"/>
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
</asp:GridView>
<br />
<asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true" oncheckedchanged="SelectAllCheckBox_CheckedChanged"/>
&nbsp;&nbsp;
<webdiyer:aspnetpager CssClass="paginator" CurrentPageButtonClass="cpb"   AlwaysShow="true"
        ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" 
        NextPageText="下一页" PrevPageText="上一页" 
        onpagechanged="AspNetPager1_PageChanged" LayoutType="Div">
</webdiyer:aspnetpager>
</div>
</ContentTemplate></asp:UpdatePanel>
</asp:Content>

