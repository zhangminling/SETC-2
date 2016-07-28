<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="float:left;width:560px;padding-left:80px;margin-right:40px;border-right:1px dotted #ccc;">
<table width="560" align="center" id="RegistTable">
    <tr><td colspan="3"><h2><a href="Login.aspx">用 户 登 录</a></h2></td></tr>
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2"><asp:Label ID="ErrorLabel" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label></td>    
    </tr>
    <tr><td width="100">用户名：</td>
    <td width="200" align="left"><asp:TextBox ID="UserName" runat="server" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></td>
    <td width="260" align="left">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名必填" ControlToValidate="UserName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="不符合用户名规则" ControlToValidate="UserName" 
            ValidationExpression="^[a-zA-Z0-9\u4e00-\u9fa5]{2,20}$"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2"><div id="div1" style="font-size:12px;color:#999;"> 3-20位字符，可由中文、英文、数字及"_"组成</div></td>    
    </tr>
    <tr><td width="100">密码：</td>
    <td width="200" align="left"><asp:TextBox ID="Password" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox></td>
    <td width="260" align="left"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码必填" ControlToValidate="Password"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="不符合密码规则" ControlToValidate="Password" 
            ValidationExpression="^[a-zA-Z0-9]{2,20}$"></asp:RegularExpressionValidator>
    </td>
    </tr>
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2"><div id="div2" style="font-size:12px;color:#999;"> 3-20位字符，可由英文、数字及"_"组成</div></td>    
    </tr> 
    <tr><td width="100">验证码：</td>
    <td width="200" align="left"><asp:TextBox ID="ValidateCode" runat="server" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></td>
    <td width="260" align="left"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="validateCode.aspx" />
        &nbsp; <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false">换一张</asp:LinkButton></td>
    </tr>
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2"><div id="div4" style="font-size:12px;color:#999;"> 
        请输入验证码</div>    
    </td>    
    </tr>
    
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2">
        <asp:CheckBox ID="CheckBox1" runat="server" Checked="true" /> 记住用户 “<span style="font-size:13px; font-style:italic;">在公共电脑上登录，请勿选择此选项！</span>”</td>    
    </tr>
    
    <tr><td width="100">&nbsp;</td>
    <td width="200" align="left"><br />
        <asp:Button ID="Button1" runat="server" Text=" 用户登录 " CssClass="Button" 
            onclick="Button1_Click" /></td>
    <td width="260" align="left">&nbsp;</td>
    </tr>
        
    </table>
</div>

<div style="float:left;width:300px;">
<table width="100%">
<tr><td align="left" height="30">

        还没有教育技术与传播学院网站的帐号？
</td></tr>
       
<tr><td align="left" height="30">
<asp:Button ID="Button2" runat="server" Text=" 用户注册 " CssClass="Button" 
        CausesValidation="false" onclick="Button2_Click" />
</td></tr>

<tr><td align="left" height="30">

<p>&nbsp;</p>
<div style="border-top:1px solid #ccc;">&nbsp;</div>
<p>&nbsp;</p>
<p>用户如果在注册或者登录过程中，存在任何问题和建议，欢迎和我们联系</p>
        
</td></tr>

<tr><td align="left" height="30">

QQ：21646523

        
</td></tr>
<tr><td align="left" height="30">

Email：21646523@QQ.com

        
</td></tr>

</table>
</div>



<div class="clear"></div>
<p>&nbsp;</p>
<p>&nbsp;</p>
</asp:Content>


