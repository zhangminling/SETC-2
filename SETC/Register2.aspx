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
    <div><asp:TextBox ID="UserName" runat="server" placeholder="�û���" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></div>
    <div>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="�û�������" ControlToValidate="UserName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="�������û�������" ControlToValidate="UserName" 
            ValidationExpression="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$"></asp:RegularExpressionValidator>
        </div>  
   <div id="div1" style="font-size:12px;color:#999;"> 3-20λ�ַ����������ġ�Ӣ�ġ����ּ�"_"���</div>    
    <div><asp:TextBox ID="Password" placeholder="����" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox></div>
    <div><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="�������" ControlToValidate="Password"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="�������������" ControlToValidate="Password" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
    </div>    
   <div id="div2" style="font-size:12px;color:#999;"> 3-20λ�ַ�������Ӣ�ġ����ּ�"_"���</div>         
    <div><asp:TextBox ID="Password2" placeholder="�ٴ���������" runat="server" MaxLength="30" TextMode="Password" CssClass="TextBox"></asp:TextBox></div>    
    
    <div>
        <asp:CompareValidator ID="CompareValidator1" runat="server"  ControlToCompare="Password" ControlToValidate="Password2" Operator="Equal"
            ErrorMessage="������������벻һ��"></asp:CompareValidator>
        </div> 
     <div id="div5" style="font-size:12px;color:#999;"> ���ٴ���������</div>  
    <div><asp:TextBox ID="Email" runat="server" placeholder="����" 
            MaxLength="30" CssClass="TextBox"></asp:TextBox></div> 
<div id="div4" style="font-size:12px;color:#999;"> �����볣�����䣬����ʹ��QQ����</div> 
    <p style="height:3px;">&nbsp;</p>     
    <div>
         <asp:CheckBox ID="CheckBox1" runat="server" onclick="if(this.checked){ }else{alert('��ѡ��ͬ��Э���ע��!') ;}" Checked="true" Text="���Ķ���ͬ��"/>
         <asp:HyperLink ID="HyperLink1"
            runat="server" NavigateUrl="#">�����������봫��ѧԺ��վ�������</asp:HyperLink> </div>    
    <div> 
        <asp:Button ID="Button1" runat="server" Text=" �û�ע�� " CssClass="Button" 
            onclick="Button1_Click" Visible="true" />
</div>
  <p>&nbsp;</p>   
<div style="right:auto;">
    �Ѿ����˺�  <a href="Login2.aspx">������¼</a> 
</div>
</div>
</asp:Content>


