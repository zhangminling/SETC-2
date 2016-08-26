<%@ Page Title="" Language="C#" MasterPageFile="~/frontend.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
<style type="text/css">
     #page 
        {
          margin-top:40px;
          position: relative;
		  z-index: 1;
		  background: #FFFFFF;
		  max-width: 360px;
		  margin: 100px auto 100px;
		  padding: 45px;
		  text-align: center;
		  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);                                    
        }     
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="page">
    <div><asp:Label ID="ErrorLabel" runat="server" ForeColor="Red" Text=""></asp:Label></div>    
    <div><asp:TextBox ID="UserName" runat="server" placeholder="用户名" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></div>
    <div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名必填" ControlToValidate="UserName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="不符合用户名规则" ControlToValidate="UserName" 
            ValidationExpression="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$"></asp:RegularExpressionValidator>
        </div>  
   <div id="div1" style="font-size:12px;color:#999;"> 3-20位字符，可由中文、英文、数字及"_"组成</div>    
    <div><asp:TextBox ID="Password" placeholder="密码" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox></div>
    <div><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码必填" ControlToValidate="Password"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="不符合密码规则" ControlToValidate="Password" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
    </div>    
   <div id="div2" style="font-size:12px;color:#999;"> 3-20位字符，可由英文、数字及"_"组成</div>         
    <div><asp:TextBox ID="Password2" placeholder="再次输入密码" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox></div>    
    
    <div>
        <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToCompare="Password" ControlToValidate="Password2" Operator="Equal"
            ErrorMessage="两次输入的密码不一致"></asp:CompareValidator>
        </div> 
     <div id="div5" style="font-size:12px;color:#999;"> 请再次输入密码</div>  
    <div><asp:TextBox ID="Email" runat="server" placeholder="邮箱" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></div> 
<div id="div4" style="font-size:12px;color:#999;"> 请输入常用邮箱，建议使用QQ邮箱</div> 
    <p style="height:3px;">&nbsp;</p>     
    <div>
         <asp:CheckBox ID="CheckBox1" runat="server" onclick="if(this.checked){ }else{alert('请选择同意协议后注册!') ;}" Checked="true" Text="已阅读并同意"/>
         <asp:HyperLink ID="HyperLink1"
            runat="server" NavigateUrl="#">《教育技术与传播学院网站服务条款》</asp:HyperLink> </div>    
    <div> 
        <asp:Button ID="Button1" runat="server" Text=" 用户注册 " CssClass="Button" 
            onclick="Button1_Click" Visible="true" />
</div>
  <p>&nbsp;</p>   
<div style="right:auto;">
    已经有账号  <a href="Login2.aspx">立即登录</a> 
</div>
</div>
</asp:Content>


