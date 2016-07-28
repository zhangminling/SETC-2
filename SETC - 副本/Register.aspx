<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
<style type="text/css">
#RegistTable td
{
    height:30px;
}
#RegistTable h2 a
{
    font-size:16px;font-family:"黑体";
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="float:left;width:560px;padding-left:80px;margin-right:40px;border-right:1px dotted #ccc;">
<table width="100%" align="center" id="RegistTable">
    <tr><td colspan="3"><h2><a href="Register.aspx">用 户 注 册</a></h2></td></tr>
    <tr><td width="160">&nbsp;</td>
    <td align="left" colspan="2"><asp:Label ID="ErrorLabel" runat="server" Text=""></asp:Label></td>    
    </tr>
    <tr><td width="100">用户名：</td>
    <td width="200" align="left"><asp:TextBox ID="UserName" runat="server" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></td>
    <td width="200" align="left">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名必填" ControlToValidate="UserName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="不符合用户名规则" ControlToValidate="UserName" 
            ValidationExpression="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$"></asp:RegularExpressionValidator>
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
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
    </td>
    </tr>
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2"><div id="div2" style="font-size:12px;color:#999;"> 3-20位字符，可由英文、数字及"_"组成</div></td>    
    </tr>
    <tr><td width="100">再输入一次：</td>
    <td width="200" align="left"><asp:TextBox ID="Password2" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox></td>
    <td width="260" align="left">
        <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToCompare="Password" ControlToValidate="Password2" Operator="Equal"
            ErrorMessage="两次输入的密码不一致"></asp:CompareValidator>
        </td>
    </tr>
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2"><div id="div3" style="font-size:12px;color:#999;"> 请再次输入密码</div></td>    
    </tr>
    <tr><td width="100">邮箱：</td>
    <td width="200" align="left"><asp:TextBox ID="Email" runat="server" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></td>
    <td width="260" align="left">&nbsp;</td>
    </tr>
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2"><div id="div4" style="font-size:12px;color:#999;"> 请输入常用邮箱，建议使用QQ邮箱</div></td>    
    </tr>
    
    <tr><td width="100">&nbsp;</td>
    <td align="left" colspan="2">
        <asp:CheckBox ID="CheckBox1" runat="server" Checked="true" /> 已阅读并同意 <asp:HyperLink ID="HyperLink1"
            runat="server" NavigateUrl="#">《教育技术与传播学院网站服务条款》</asp:HyperLink> </td>    
    </tr>
    
    <tr><td width="100">&nbsp;</td>
    <td width="200" align="left"><br /> 
        <asp:Button ID="Button1" runat="server" Text=" 用户注册 " CssClass="Button" 
            onclick="Button1_Click" Visible="true" /></td>
    <td width="260" align="left">&nbsp;</td>
    </tr>
        
    </table>
</div>

<div style="float:left;width:300px;">
<table width="100%">
<tr><td align="left" height="30">

        已经有教育技术与传播学院网站的帐号？
</td></tr>
       
<tr><td align="left" height="30">
<asp:Button ID="Button2" runat="server" Text=" 登 录 " CssClass="Button" onclick="Button2_Click" CausesValidation="false" />
</td></tr>

<tr><td align="left" height="30">

<p>&nbsp;</p>
<div style="border-top:1px solid #ccc;">&nbsp;</div>
<p>&nbsp;</p>
<p>用户如果在注册或者登录过程中，存在任何问题和建议，请和我们联系：</p>
        
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


