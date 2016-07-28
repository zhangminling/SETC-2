<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewFolder.aspx.cs" Inherits="NewFolder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Text="输入文件名："></asp:Label>&nbsp;&nbsp;<asp:TextBox ID="FolderName" runat="server"></asp:TextBox>
       <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="文件夹名必填" ControlToValidate="FolderName"></asp:RequiredFieldValidator>--%>
    </div>
    <br/>
    <div>
        <asp:Button ID="Add" runat="server" Text="保存" onclick="Add_Click" />&nbsp;&nbsp;
        <asp:Button ID="Abolish" runat="server" Text="取消" onclick="Abolish_Click" />
    </div>
    </form>
</body>
</html>
