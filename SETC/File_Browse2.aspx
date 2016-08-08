﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_Browse2.aspx.cs" Inherits="File_Browse2" %>

<%@ Register TagPrefix="CuteWebUI" Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>资源管理</title>
    <style type="text/css">
        /* Tab样式 */
        #container
        {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

    <!--Basic Styles-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Beyond styles-->
    <link href="assets/css/beyond.min.css" rel="stylesheet" />
    <link href="assets/css/demo.min.css" rel="stylesheet" />
    <link href="assets/css/typicons.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script type="text/javascript" src="assets/js/skins.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <p>
           &nbsp;</p>
        <div class="col-lg-10 col-sm-10 col-xs-10" id="container">

            <div class="tabbable">
                <ul class="nav nav-tabs nav-justified" id="myTab5">
                    <li class="active">
                        <a data-toggle="tab" href="#profile5">
                            上传新资源
                        </a>
                    </li>

                    <%--<li class="">
                        <a data-toggle="tab" href="#home5">
                            媒体库资源
                        </a>
                    </li>--%>

                </ul>

                <div class="tab-content">
                    <%--<div id="home5" class="tab-pane">
                        <p>勾选服务器上已有的资源，插入到文章中。 </p>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        <div id="Man_Nav">
                            <asp:TextBox ID="SearchTB" runat="server" CssClass="TextBox"></asp:TextBox>
                            &nbsp;
                            <asp:Button ID="SearchBtn" runat="server" Text="搜索" CssClass="Button" OnClick="SearchBtn_Click" />&nbsp;&nbsp;
                            <asp:DropDownList ID="AuthorDDL" runat="server" OnSelectedIndexChanged="AuthorDDL_SelectedIndexChanged"
                                AutoPostBack="True">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:DropDownList ID="ResourceTypeDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ResourceTypeDDL_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:DropDownList ID="OrderDDL" runat="server" OnSelectedIndexChanged="OrderDDL_SelectedIndexChanged"
                                AutoPostBack="True">
                                <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>
                                <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>
                            </asp:DropDownList>
                        </div>    
                            <p>
                            &nbsp;</p>
                            <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true" OnCheckedChanged="SelectAllCheckBox_CheckedChanged" />
                        <div class="Label1">
                            总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
                            条记录，每页显示：
                            <asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true" OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="5" Selected="True">5</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>
                                <asp:ListItem Value="50">50</asp:ListItem>
                                <asp:ListItem Value="100">100</asp:ListItem>
                                <asp:ListItem Value="200">200</asp:ListItem>
                                <asp:ListItem Value="500">500</asp:ListItem>
                            </asp:DropDownList>
                            条记录， 共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>页。
                            <asp:Label ID="Label3" runat="server" Text="" Visible="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <br />
                        <div id="GridViewDiv">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-Height="24px" class="table table-striped table-bordered table-hover"
                                GridLines="Horizontal"  style="text-align:center;" ForeColor="#333333" HeaderStyle-HorizontalAlign="Center" Width="99%">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <Columns>
                                    <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="30px" HorizontalAlign="center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="多选" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </ItemTemplate>
                                        <ItemStyle Width="30px" HorizontalAlign="center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ResourceName" HeaderText="资源名称" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Left"   />
                                    <asp:BoundField DataField="FileType" HeaderText="类型" SortExpression="FileType"  ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"   />
                                    <asp:BoundField DataField="FileSizeInKB" HeaderText="大小(KB)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"   />
                                </Columns>
                            </asp:GridView>
                         </div>
                        <p>&nbsp;&nbsp;
                            <webdiyer:AspNetPager CssClass="pages" CurrentPageButtonClass="cpb" AlwaysShow="true"
                                ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
                                PrevPageText="上一页" OnPageChanged="AspNetPager1_PageChanged" PagingButtonSpacing="0">
                            </webdiyer:AspNetPager>
                        </p>
                                
                        </ContentTemplate>
                        </asp:UpdatePanel>

                        <p>
                            &nbsp;</p>
                        <div>
                            <asp:Button ID="Button1" runat="server" Text="确认" CssClass="Button" 
                                 onclick="Insert_Click1"  />&nbsp;&nbsp;
                            <asp:Button ID="Insert1" runat="server" Text="插入" CssClass="Button"
                            onclick="Insert_Click1"  />
                            &nbsp;&nbsp;<asp:Button ID="Button3" runat="server" Text="取消" Visible="false" />
                        </div>
                        <p>
                            &nbsp;</p>
                    </div>--%>

                    <div id="profile5" class="tab-pane in active">
                        <p>1、从本地上传新资源到服务器</p>
                        <p><small>合法的文件包括：音频、视频、图片、文档、压缩、Flash等，音频、视频、Flash、文档和压缩文件最大200M，图片最大20M。</small></p>
                        <div>
                            <asp:Label ID="FET" runat="server" Text="Label" Visible="false"></asp:Label>
                            <asp:Label ID="FS" runat="server" Text="Label" Visible="false"></asp:Label>
                            <asp:Label ID="FN" runat="server" Text="Label" Visible="false"></asp:Label>
                            <asp:Label ID="FP" runat="server" Text="Label" Visible="false"></asp:Label>
                            <asp:Label ID="ResourceTypeLabel" runat="server" Text="" Visible="false"></asp:Label>
                            <CuteWebUI:Uploader runat="server" ID="Uploader1" InsertText="上传资源到服务器" OnFileUploaded="Uploader_FileUploaded">
                            </CuteWebUI:Uploader>
                        </div>
                        <p>&nbsp;</p>          
                        <p>2、对资源重命名</p>
                        <p><small>输入有意义的名字，方便日后对资源的查找和管理</small></p>
                        <p id="IMG">
                            <asp:Image ID="Image1" runat="server" />
                        </p>          
                        <div>
                            <asp:TextBox ID="TextBox1" runat="server" Width="280px"></asp:TextBox>&nbsp; 
                        </div>
                        <p>&nbsp;</p>
                        <p>3、选择保存的目录</p>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                        <div>
                            <asp:DropDownList ID="FolderDDL" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="FolderDDL_SelectedIndexChanged">
                            </asp:DropDownList> &nbsp;&nbsp;&nbsp;
                        </div>
                        </ContentTemplate>
                        </asp:UpdatePanel>
            
                        <%--<p>3、选择资源的类型</p>
                        <p><small>对于图片和视频资源，请选择他们对应的版本</small></p>
                        <div>
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Selected="True">电脑</asp:ListItem>
                                <asp:ListItem>手机</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>--%>
                        <p>
                            &nbsp;</p>
                        <div>
                            <asp:Button ID="Insert2" runat="server" Text="插入" CssClass="Button" 
                            onclick="Insert_Click"  />
                            &nbsp;&nbsp;<asp:Button ID="Abolish" runat="server" Text="取消" Visible="false" />
                        </div>
                        <p>
                            <asp:Label ID="TestLabel" runat="server" Text="Test Label" Visible="false"></asp:Label></p>
                        <p>
                            &nbsp;</p>

                    </div>
                </div>
            </div>
        </div>                          
    </form>

    <!--Basic Scripts-->
    <script src="assets/js/jquery-2.0.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>

</body>

<script type="text/javascript">
    var fileUrl = "<%= insertFileHTML %>";
    //var btn1 = document.getElementById("Insert1");
    //btn1.onclick = function() {
    //    //alert(fileUrl);
    //    window.opener.CKEDITOR.instances.ctl00_ContentPlaceHolder1_Editor1.insertHtml(fileUrl);
    //    window.close();
    //};

    var btn2 = document.getElementById("Insert2");
    btn2.onclick = function() {
        //alert(fileUrl);
        window.opener.CKEDITOR.instances.ctl00_ContentPlaceHolder1_Editor1.insertHtml(fileUrl);
        window.close();
    };    

</script>

</html>
