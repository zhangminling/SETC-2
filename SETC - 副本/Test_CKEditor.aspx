<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test_CKEditor.aspx.cs" Inherits="Test_CKEditor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CKEditor</title>
    <!-- Make sure the path to CKEditor is correct. -->
    <script src="ckeditor201507/ckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="Editor1" runat="server" TextMode="MultiLine" />
        <script type="text/javascript">
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.           
            alert(<%= Editor1.ClientID %>);
            var editor = CKEDITOR.replace('<%= Editor1.ClientID %>');             
        </script>
    </div>
    </form>
</body>
</html>
