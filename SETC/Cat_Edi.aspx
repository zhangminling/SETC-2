<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.master"  CodeFile="Cat_Edi.aspx.cs" Inherits="Cat_Edi" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="LabelUserID" runat="server" Visible="false" Text=""></asp:Label>
    <div id="CurrentPosition" ><h4>当前位置：</h4><a href="Cat_Man.aspx"><h4>分类管理</a>&nbsp;&nbsp;&nbsp;>>&nbsp;&nbsp;<span><a href="Cat_Edi.aspx">分类编辑</a></span></div>
    <div class="auto-style1"><h4>分类名称：</h4></div>
            <div><asp:TextBox ID="CatName" runat="server" Width="374px" Height="29px"></asp:TextBox></div>
        
     
        <div class="auto-style1"><h4>描述：</h4></div>
            <div><asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Columns="50" Rows="5" CssClass="TextBoxMultiLine" MaxLength="140" Height="65px" Width="433px" ></asp:TextBox></div>
       
        
        <div class="auto-style1"><h4>锁定状态：</h4>  
                <asp:RadioButton ID="true1" runat="server" GroupName="Valid" Checked="true" Text="True" />
          <asp:RadioButton ID="false1" runat="server" GroupName="Valid" Text="False" /></div>
            <div><asp:Button ID="CatSave" runat="server" Text="保存" Height="35px" Width="97px" CssClass="button" OnClick="ButtonSave_Click" />
            <asp:Button ID="Button1" runat="server" Text="取消" Height="35px" Width="97px" CssClass="button" OnClick="Button4_Click"/>
                <asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label>
            </div>
</asp:Content>
   


