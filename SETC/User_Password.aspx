<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Password.aspx.cs" Inherits="User_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">           
<div id="CurrentPosition">��ǰλ�ã�<a href="User_Man.aspx">�û�����</a> >> <a href="User_Password.aspx">�޸�����</a></div>
                  
          <div class="register-container animated fadeInDown">
        <div class="registerbox bg-white">
            <p class="text-info" style="font-size:20px;padding:10px 130px;">�޸�����</p>
            <div class="registerbox-textbox">
                 <asp:TextBox ID="Password1" class="form-control"  placeholder="�����������"  runat="server" TextMode="Password"
                MaxLength="30" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="�������" ControlToValidate="Password1"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="�������������" ControlToValidate="Password1" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
         
            </div>
            <div class="registerbox-textbox">
                <asp:TextBox ID="Password2" class="form-control"  placeholder="����������" runat="server" TextMode="Password"
                MaxLength="30" ></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="�������" ControlToValidate="Password2"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="�������������" ControlToValidate="Password2" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
            </div>
            <div class="registerbox-textbox">
                 <asp:TextBox ID="Password3" placeholder="ȷ��������" runat="server" TextMode="Password"
                MaxLength="30" class="form-control"></asp:TextBox>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="�������" ControlToValidate="Password3"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ErrorMessage="�������������" ControlToValidate="Password3" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="�����������벻һ��" ControlToCompare="Password2" ControlToValidate="Password3" Width="100%"></asp:CompareValidator>    
           </div>
          <div class="registerbox-submit">
               <asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label>
               <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="true"
                oncheckedchanged="CheckBox1_CheckedChanged" Text="��ʾ����" Visible="true" />  
               <asp:Button ID="Button1" runat="server" class="btn btn-primary pull-right" Text=" �޸��û����� " 
                onclick="Button1_Click" />
            </div>
        </div>
    </div>
</asp:Content>

