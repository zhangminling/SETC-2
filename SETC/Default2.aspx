<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<!-- Make sure the path to CKEditor is correct. -->
<script type="text/javascript" src="ckeditor201507/ckeditor.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:TextBox ID="Editor1" runat="server" TextMode="MultiLine" />
        <script type="text/javascript">
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.                       
            var editor = CKEDITOR.replace('<%= Editor1.ClientID %>');             
        </script>
</asp:Content>

