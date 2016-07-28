<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Password.aspx.cs" Inherits="User_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">           
<div id="CurrentPosition">当前位置：<a href="User_Man.aspx">用户管理</a> >> <a href="User_Password.aspx">修改密码</a></div>
                  
                
<p>&nbsp;</p>

<div id="RightContent">    
    
    <center>
    <table width="660" align="center" class="MyTable">
        <tr><td colspan="3"><h2>修 改 密 码</h2></td></tr>
        <tr>
        <td align="Center" colspan="2"><asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label></td>
        <td align="Left">
            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true"
                oncheckedchanged="CheckBox1_CheckedChanged" Text="显示密码" Visible="true" /></td>    
        </tr>
        
        <tr><td width="100">旧的密码：</td>
        <td width="200" align="left">
            <asp:TextBox ID="Password1" runat="server" TextMode="Password"
                MaxLength="30" CssClass="TextBox" ></asp:TextBox></td>
        <td width="360" align="left">&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="密码必填" ControlToValidate="Password1"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="不符合密码规则" ControlToValidate="Password1" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
        
        </td>
        </tr>    
        
        <tr><td>&nbsp;</td>
        <td align="left" colspan="2"><div id="div4" style="font-size:12px;color:#999;"> 
            请输入旧的密码</div></td>    
        </tr>
        
        <tr><td width="140">新密码：</td>
        <td width="300" align="left">
            <asp:TextBox ID="Password2" runat="server" TextMode="Password"
                MaxLength="30" CssClass="TextBox"></asp:TextBox></td>
        <td width="200" align="left">&nbsp;
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码必填" ControlToValidate="Password2"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="不符合密码规则" ControlToValidate="Password2" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
        </td>
        </tr>    
        <tr><td>&nbsp;</td>
        <td align="left" colspan="2"><div id="div3" style="font-size:12px;color:#999;"> 
            请输入新的密码，3-20位字符，可由英文、数字及"_"组成</div></td>    
        </tr>
        <tr><td width="140">新密码：</td>
        <td width="300" align="left"><asp:TextBox ID="Password3" runat="server" TextMode="Password"
                MaxLength="30" CssClass="TextBox"></asp:TextBox></td>
        <td width="200" align="left">&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="密码必填" ControlToValidate="Password3"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ErrorMessage="不符合密码规则" ControlToValidate="Password3" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="两次输入密码不一致" ControlToCompare="Password2" ControlToValidate="Password3" Width="100%"></asp:CompareValidator>    
        </td>
            
        </tr>    
        <tr><td>&nbsp;</td>
        <td align="left" colspan="2"><div id="div5" style="font-size:12px;color:#999;"> 
            请再次输入新的密码</div></td>    
        </tr>
        
        <tr><td width="100">&nbsp;</td>
        <td width="200" align="left"><br />
            <asp:Button ID="Button1" runat="server" Text=" 修改用户密码 " CssClass="Button" 
                onclick="Button1_Click" /></td>
        <td width="260" align="left">&nbsp;</td>
        </tr>
            
        </table>

    </center>
    
    
</div>

</asp:Content>

