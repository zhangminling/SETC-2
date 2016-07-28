<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_Upload.aspx.cs" Inherits="File_Upload" %>
<%@ Register TagPrefix="CuteWebUI" Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文件上传</title>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            var s1 = ["", "", "", ""];
            var s2 = ["请选择文件夹", ["音频1", "音频3", "音频2"], ["视频2014", "视频2015"], ["图片201506", "图片201507", "图片2", "图片201508", "图片201507", "图片201509"]];
            $("#select1").change(function() {
                var index = $(this)[0].selectedIndex;
                var option = "";
                for (var i = 0; i < s2[index].length; i++) {
                    option += "<option>" + s2[index][i] + "</option>";
                }
                $("#select2").html(option);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <h1>File Upload</h1>
    <div>
    <asp:ScriptManager ID="Scriptmanager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                                       
                    <p>1、选择保存的目录</p>
                    <div>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            <asp:ListItem>资源类型</asp:ListItem>
                            <asp:ListItem>音频</asp:ListItem>
                            <asp:ListItem>视频</asp:ListItem>
                            <asp:ListItem>图片</asp:ListItem>
                            <asp:ListItem>Flash</asp:ListItem>
                            <asp:ListItem>文档</asp:ListItem>
                            <asp:ListItem>压缩</asp:ListItem>
                            <asp:ListItem>其他</asp:ListItem>
                        </asp:DropDownList> &nbsp;&nbsp; <asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                        &nbsp;&nbsp;
                        <select id="select1">
                            <option value="资源类型">资源类型</option>
                            <option value="音频">音频</option>
                            <option value="视频">视频</option>
                            <option value="图片">图片</option>
                            <option value="Flash">Flash</option>
                            <option value="文档">文档</option>
                        </select>
                        <select id="select2" width="120">
                            
                        </select> 
                    </div> 
                    <p>
                        2、点击上传，选择要上传的文件。合法的文件包括：音频、视频、图片、文档、压缩、Flash等。</p>
                    <div>                    
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
