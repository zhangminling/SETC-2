<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cat_Add.aspx.cs" Inherits="Cat_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <style type="text/css">
        .auto-style1 {
            width: 167px;
        }
    </style>  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="CurrentPosition" ><h4>当前位置：</h4><a href="Cat_Man.aspx"><h4>分类管理</a>&nbsp;&nbsp;&nbsp;>>&nbsp;&nbsp;<span><a href="Cat_Add.aspx">新增一级分类</a></span></div>
    <asp:Label ID="Label1" runat="server" visible="false" Text=""></asp:Label>
     <div >
    <table   border="0" cellspacing="0" cellpadding="0">
        <tr><td colspan="2"><h2>新增一级分类</h2></td></tr>
        
        <tr><td class="auto-style1"><h4>分类名称：</h4></td>
            <td><asp:TextBox ID="CatName" runat="server" Width="374px" Height="29px"></asp:TextBox></td>
        </tr>
       
        <tr><td class="auto-style1"><h4>描述：</h4></td>
            <td><asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Columns="50" Rows="5" CssClass="TextBoxMultiLine" MaxLength="140" Height="65px" Width="433px" ></asp:TextBox></td>
        </tr>
        
        <tr><td class="auto-style1"><h4>是否锁定：</h4></td>
            <td >  
                <asp:RadioButton ID="true1" runat="server" GroupName="Valid" Checked="true" Text="True" />
          <asp:RadioButton ID="false1" runat="server" GroupName="Valid" Text="False" />
            </td>
         </tr>
    
       
     
        <tr align="right">
            <td class="auto-style1"><asp:Button ID="CatSave" runat="server" Text="保存" Height="35px" Width="97px" CssClass="button" OnClick="ButtonSave_Click" /></td>
            <td align="center"><asp:Button ID="Button1" runat="server" Text="取消" Height="35px" Width="97px" CssClass="button" OnClick="Button4_Click"/></td>
        </tr>

        

        <!--<td align="left">
            <asp:RadioButtonList  runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" CellPadding="10">
            <asp:ListItem Value="1" Selected="True">正常</asp:ListItem>
            <asp:ListItem Value="0">锁定</asp:ListItem>
            </asp:RadioButtonList>-->
        </table>
        </div>
</asp:Content>
