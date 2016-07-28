<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cat_Man.aspx.cs" Inherits="Cat_Man" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="CurrentPosition">当前位置：<a href="User_Man.aspx">栏目管理</a></div>
<div>
<table width="760" align="center" class="MyTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td colspan="2"><h2>新增或修改栏目</h2></td></tr>
        <tr><td>&nbsp;</td>
        <td align="left"><asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label></td>    
        </tr>
        <tr><td width="120">栏目名称：</td>
        <td align="left"><asp:TextBox ID="CatName" runat="server" MaxLength="30" CssClass="TextBox"></asp:TextBox>&nbsp;&nbsp;
栏目ID<asp:TextBox ID="ID_TextBox" runat="server" ReadOnly="true" MaxLength="30" CssClass="TextBox"></asp:TextBox></td>        
        </tr>
        <tr><td>栏目排序：</td>
        <td  align="left"><asp:TextBox ID="Orders" runat="server" MaxLength="30" CssClass="TextBox"></asp:TextBox>&nbsp;&nbsp;数字越大，排名越靠前。</td>        
        </tr>
        <tr><td>是否锁定：</td>
        <td align="left">
            <asp:RadioButtonList ID="Valid" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="10">
            <asp:ListItem Value="1" Selected="True">正常</asp:ListItem>
            <asp:ListItem Value="0">锁定</asp:ListItem>
            </asp:RadioButtonList>
            &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;子栏目数：<asp:Label ID="Subs" runat="server" Text="0"></asp:Label>
        </td>
      
        </tr>                                
        <tr><td>栏目描述：</td>
        <td align="left"><asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Columns="50" Rows="5" CssClass="TextBoxMultiLine" MaxLength="140" ></asp:TextBox>        
        </td>
        </tr>            
        <tr><td>&nbsp;</td>
        <td width="200" align="left"><asp:Button ID="Button1" runat="server" Text=" 修 改 " CssClass="Button"  onclick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text=" 放 弃 " CssClass="Button"  onclick="Button1_Click" />
        </td>        
        </tr>            
        </table>
</div>
<p>&nbsp;</p>    
<div>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-Height="36px" 
        CellPadding="10" Width="760px" ForeColor="#333333" GridLines="None">
    <RowStyle BackColor="#EFF3FB" Height="36px" />
<Columns>  
    <asp:BoundField DataField="Orders" HeaderText="排序" SortExpression="Orders" ItemStyle-HorizontalAlign="Center" />
    <asp:BoundField DataField="CatName" HeaderText="栏目名称" SortExpression="CatName" ItemStyle-HorizontalAlign="Center" />
    <asp:BoundField DataField="Subs" HeaderText="子栏目数" SortExpression="Subs"  ItemStyle-HorizontalAlign="Center" />
    <asp:BoundField DataField="Valid" HeaderText="有效" SortExpression="Valid" ItemStyle-HorizontalAlign="Center" /> 
    <asp:BoundField DataField="Description" HeaderText="栏目描述" SortExpression="Description"  ItemStyle-HorizontalAlign="Center" />
    <asp:HyperLinkField DataNavigateUrlFields="ID" 
        DataNavigateUrlFormatString="Cat_Man.aspx?ID={0}" HeaderText="编辑" Text="编辑" ItemStyle-HorizontalAlign="Center" />
</Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
</div>

</asp:Content>

