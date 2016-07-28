<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Edit.aspx.cs" Inherits="User_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
input[type="radio"]{border:none;}
input[type="radio"]+label {margin-right:20px;}
</style>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="LabelUserID" runat="server" Visible="false" Text=""></asp:Label>

<div id="CurrentPosition">当前位置：<a href="User_Man.aspx">用户管理</a> >> <a href="#">修改用户信息</a></div>

<p>&nbsp;</p>

<div id="RightContent">    
    
    <center>
    <table width="760" align="center" class="MyTable" border="0" cellspacing="0" cellpadding="0">
        <tr><td colspan="3"><h2>个 人 信 息</h2></td></tr>
        <tr><td width="180">&nbsp;</td>
        <td align="left" colspan="2"><asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label></td>    
        </tr>
        <tr><td width="140">班级：</td>
        <td width="300" align="left">
            <asp:DropDownList ID="ClassesDDL" runat="server">
            </asp:DropDownList>
        </td>
        <td width="200" align="left">&nbsp;</td>
        </tr>    
        <tr><td>&nbsp;</td>
        <td align="left" colspan="2"><div id="div3" style="font-size:12px;color:#999;"> 请选择教师、游客、或者班级</div></td>    
        </tr>
        <tr><td>邮箱：</td>
        <td width="300" align="left"><asp:TextBox ID="Email" runat="server" 
                MaxLength="30" CssClass="TextBox"></asp:TextBox></td>
        <td width="200" align="left">&nbsp;</td>
        </tr>    
        <tr><td>&nbsp;</td>
        <td align="left" colspan="2"><div id="div4" style="font-size:12px;color:#999;"> 请输入常用邮箱，建议使用QQ邮箱</div></td>    
        </tr>
        <asp:Panel ID="PasswordPanel" runat="server" Visible="false">
        <tr><td>重置密码：</td>
        <td width="300" align="left"><asp:TextBox ID="Password" runat="server" CssClass="TextBox"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="OldPassword" runat="server" Visible="false" Text=""></asp:Label>
        </td>
        <td width="200" align="left">&nbsp;</td>
        </tr>  
        <tr><td>&nbsp;</td>
        <td align="left" colspan="2"><div id="div2" style="font-size:12px;color:#999;"> 不需要修改密码，请保持不变。</div></td>    
        </tr>
        </asp:Panel>        
        <tr><td>当前状态：</td>
        <td align="left"><asp:TextBox ID="Status" runat="server" TextMode="MultiLine" Columns="50" Rows="5" CssClass="TextBoxMultiLine" MaxLength="140" ></asp:TextBox></td>
        <td align="left">
        <asp:RegularExpressionValidator   id= "RegularExpressionValidator7"   runat= "server"   ErrorMessage= "当前状态，不超过140个字符！"   ControlToValidate= "Status" ValidationExpression= ".{0,140}"> </asp:RegularExpressionValidator> 
        </td>
        </tr>    
        <tr><td>&nbsp;</td>
        <td align="left" colspan="2"><div id="div1" style="font-size:12px;color:#999;"> 请输入你的当前状态，不超过140个字符！</div></td>    
        </tr>
        <tr><td>最后登录日期：</td>
        <td width="200" align="left">
            <asp:Label ID="LastLoginDateTime" runat="server" Text="Label"></asp:Label></td>
        <td width="260" align="left">&nbsp;</td>
        </tr>
        <tr><td>角色：</td>
        <td align="left" colspan="2">            
            <asp:RadioButtonList ID="Role" runat="server" RepeatDirection="Horizontal" 
                RepeatLayout="Flow">
            </asp:RadioButtonList>
        </td>        
        </tr>
        <tr><td>积分：</td>
        <td width="200" align="left">
            <asp:Label ID="Credits" runat="server" Text="Label"></asp:Label>
        </td>
        <td width="260" align="left">&nbsp;</td>
        </tr>
        <tr><td>等级：</td>
        <td width="200" align="left">
            <asp:Label ID="Grade" runat="server" Text="Label"></asp:Label>
            </td>
        <td align="left">&nbsp;</td>
        </tr>
        <tr><td>作品数量：</td>
        <td width="200" align="left">
            <asp:Label ID="Shows" runat="server" Text="Label"></asp:Label>
            </td>
        <td width="260" align="left">&nbsp;</td>
        </tr>
        <tr><td>文章数量：</td>
        <td width="200" align="left">
            <asp:Label ID="Articles" runat="server" Text="Label"></asp:Label>
            </td>
        <td width="260" align="left">&nbsp;</td>
        </tr>
        <tr><td>注册日期时间：</td>
        <td width="200" align="left">
            <asp:Label ID="RegisterDateTime" runat="server" Text="Label"></asp:Label>
            </td>
        <td width="260" align="left">&nbsp;</td>
        </tr>    
        <tr><td colspan="3">&nbsp;</td>      
        </tr>
        
        <tr><td>&nbsp;</td>
        <td width="200" align="left"><br />
            <asp:Button ID="Button1" runat="server" Text=" 修改用户信息 " CssClass="Button" 
                onclick="Button1_Click" /></td>
        <td width="260" align="left">&nbsp;</td>
        </tr>
            
        </table>

    </center>
    
    
</div>

</asp:Content>


