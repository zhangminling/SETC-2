<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/frontend.master" CodeFile="login2.aspx.cs" Inherits="login2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page">
        <div><asp:Label ID="ErrorLabel" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label></div>
        
        <div style="left:10px;">
            <asp:TextBox ID="UserName" placeholder="请输入用户名" runat="server" MaxLength="30" CssClass="TextBox"></asp:TextBox>
        </div>
        <div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名必填" ControlToValidate="UserName"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="不符合用户名规则" ControlToValidate="UserName" 
            ValidationExpression="^[a-zA-Z0-9\u4e00-\u9fa5]{2,20}$"></asp:RegularExpressionValidator>
        </div>
        <div id="div1" style="font-size:12px;color:#999;"> 3-20位字符，可由中文、英文、数字及"_"组成</div>

        <div><asp:TextBox ID="Password" placeholder="请输入密码" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox></div>
        <div><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码必填" ControlToValidate="Password"></asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
             ErrorMessage="不符合密码规则" ControlToValidate="Password" 
             ValidationExpression="^[a-zA-Z0-9]{2,20}$"></asp:RegularExpressionValidator>
        </div>
        <div id="div2" style="font-size:12px;color:#999;"> 3-20位字符，可由英文、数字及"_"组成</div>
      
      
        <div style=" float:left;width:120px; "><asp:TextBox ID="ValidateCode" runat="server" placeholder="验证码" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></div>
        <div style="float:right;"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="validateCode.aspx" />
        &nbsp; <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false">换一张</asp:LinkButton></div>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <div style="clear:both"><asp:Button ID="Button1" runat="server" Text=" 用户登录 "  onclick="Button1_Click" />
        </div>
        <p>&nbsp;</p>  
        <div style="right:auto;">
            还没有账号？  <a href="Register2.aspx">立即注册</a> 
        </div>
    </div>
                

</asp:Content>