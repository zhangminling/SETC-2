<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Manage.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>教育技术与传播学院</title>
    <meta name="description" content="后台" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.jpg" type="image/x-icon"/>

   <!--Basic Styles-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="#" rel="stylesheet" />--%>
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->

    <!--Beyond styles-->
    <link href="assets/css/beyond.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/demo.min.css" rel="stylesheet" />
    <link href="assets/css/typicons.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <%--<link href="#" rel="stylesheet" type="text/css" />--%>

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script type="text/javascript" src="assets/js/skins.min.js"></script>
    <style type="text/css">
#margin{
 margin-top:20px;
}
#margin th {
  text-align:center;
           }
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <div class="navbar">
        <div class="navbar-inner">
            <div class="navbar-container">
                <!-- Navbar Barnd -->
                <div class="navbar-header pull-left">
                    <a href="User_Zoon.aspx" class="navbar-brand">
                        <small>
                            <img src="assets/img/logo.png" alt="" />
                        </small>
                    </a>
                </div>
                <!-- /Navbar Barnd -->

                <!-- Sidebar Collapse -->
                <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="collapse-icon fa fa-bars"></i>
                </div>
                <!-- /Sidebar Collapse -->
                <!-- Account Area and Settings --->
                <div class="navbar-header pull-right">
                    <div class="navbar-account">
                        <ul class="account-area">
                            <li>
                                <a class="login-area dropdown-toggle" data-toggle="dropdown">
                                    <div class="avatar" title="View your public profile">
                                        <asp:Image ID="AvatarImage" runat="server" Width="25" Height="25" />
                                    </div>
                                    <section>
                                        <h2><span class="profile"><span><%= Session["RoleName"] %></span></span></h2>
                                    </section>
                                </a>
                                <!--Login Area Dropdown-->
                                <ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                                    <!--Avatar Area-->
                                    <li>
                                        <div class="avatar-area">
                                            <asp:Image ID="AvatarImage1" class="avatar1" runat="server" Width="110" Height="110" />
                                            <span class="caption"><%= Session["UserName"] %> </span>
                                        </div>
                                    </li>
                                    <!--Avatar Area-->
                                    <li class="edit">
                                        <a href="#" class="pull-left"><%= Session["Email"] %> </a>
                                    </li>
                                    <!--Theme Selector Area-->
                                    <li class="theme-area">
                                        <ul class="colorpicker" id="skin-changer">
                                            <li><a class="colorpick-btn" href="#" style="background-color:#5DB2FF;" rel="assets/css/skins/blue.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#2dc3e8;" rel="assets/css/skins/azure.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#03B3B2;" rel="assets/css/skins/teal.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#53a93f;" rel="assets/css/skins/green.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#FF8F32;" rel="assets/css/skins/orange.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#cc324b;" rel="assets/css/skins/pink.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#AC193D;" rel="assets/css/skins/darkred.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#8C0095;" rel="assets/css/skins/purple.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#0072C6;" rel="assets/css/skins/darkblue.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#585858;" rel="assets/css/skins/gray.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#474544;" rel="assets/css/skins/black.min.css"></a></li>
                                            <li><a class="colorpick-btn" href="#" style="background-color:#001940;" rel="assets/css/skins/deepblue.min.css"></a></li>
                                        </ul>
                                    </li>
                                    <!--/Theme Selector Area-->
                                    <li class="dropdown-footer">
                                        <a href="login.aspx">
                                            退出
                                        </a>
                                    </li>
                                </ul>
                                <!--/Login Area Dropdown-->
                            </li>
                            <!-- /Account Area -->
                            <!--Note: notice that setting div must start right after account area list.
                            no space must be between these elements-->
                            <!-- Settings -->
                        </ul><div class="setting">
                            <a id="btn-log-out" title="回到主页" href="index.aspx"> 
                                <i class="icon glyphicon glyphicon-home"></i>
                            </a>
                        </div>
                        <!-- Settings -->
                    </div>
                </div>
                <!-- /Account Area and Settings -->
            </div>
        </div>
    </div>
         <!-- /Navbar -->
        <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
                <!-- Page Sidebar Header-->
                <div class="sidebar-header-wrapper">
                    <input type="text" class="searchinput" />
                    <i class="searchicon fa fa-search"></i>
                    <div class="searchhelper">查找资源，用户，文章</div>
                </div>
                <!-- /Page Sidebar Header -->
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
                    <!--Dashboard-->
                    <li class="active">
                        <a href="User_Zoon.aspx">
                            <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text"> 个人空间 </span>
                        </a>
                    </li>
                    <!--UI Elements-->
                    <li>
                        <a href="User_Man.aspx" class="menu-dropdown">
                            <i class="menu-icon fa fa-desktop"></i>
                            <span class="menu-text"> 用户管理 </span>
                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="User_Edit2.aspx?ID=<%= Session["UserID"] %>">
                                    <span class="menu-text">个人信息</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="menu-dropdown">
                                    <span class="menu-text">
                                        管理员操作
                                    </span>
                                    <i class="menu-expand"></i>
                                </a>

                                <ul class="submenu">
                                    <li>
                                        <a href="User_Add.aspx">
                                            <i class="menu-icon fa fa-rocket"></i>
                                            <span class="menu-text">添加新用户</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="User_IsValid.aspx">
                                            <i class="menu-icon glyphicon glyphicon-stats"></i>
                                            <span class="menu-text">管理用户状态</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="User_Manage.aspx">
                                           <i class="menu-icon wi-day-snow"></i>
                                            <span class="menu-text">管理角色 </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="User_Password.aspx">
                                    <span class="menu-text">修改密码</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--Tables-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-table"></i>
                            <span class="menu-text"> 用户标签 </span>

                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="UserTags_Add.aspx">
                                    <span class="menu-text">添加标签</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text">修改--查看标签</span>
                                </a>
                            </li>
                            <li>
                                <a href="TagUsers_Add.aspx">
                                    <span class="menu-text">添加标签用户</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="menu-text">批量删除</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--Forms-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-pencil-square-o"></i>
                            <span class="menu-text"> 焦点图管理 </span>

                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="Focus_Man.aspx">
                                    <span class="menu-text">编辑焦点图</span>
                                </a>
                            </li>
                            <li>
                                <a href="Focus_Recycle.aspx">
                                    <span class="menu-text">查看以往焦点图</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--Charts-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-bar-chart-o"></i>
                            <span class="menu-text"> 分类管理 </span>

                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="Cat_Man.aspx">
                                    <span class="menu-text">一级分类管理</span>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <span class="menu-text"> 新增更改分类</span>
                                </a>
                            </li>
                           
                        </ul>
                    </li>
                    <!--Mail-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-envelope-o"></i>
                            <span class="menu-text"> 菜单管理 </span>

                            <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="#">
                                    <span class="menu-text">一级菜单管理</span>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <span class="menu-text">二级菜单管理</span>
                                </a>
                            </li>
                            <li>
                                <a href="message-compose.html">
                                    <span class="menu-text">新增菜单类</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!--Pages-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon glyphicon glyphicon-paperclip"></i>
                            <span class="menu-text"> 文章管理 </span>

                            <i class="menu-expand"></i>
                        </a>
                        <ul class="submenu">
                            <li>
                                <a href="Article_Add.aspx"> 
                                    <span class="menu-text">添加文章</span>
                                </a>
                            </li>
                            <li>
                                <a href="Article_Man.aspx">
                                    <span class="menu-text">文章列表</span>
                                </a>
                            </li>

                            <li>
                                <a href="Article_draft.aspx">
                                    <span class="menu-text">草稿箱</span>
                                </a>
                            </li>

                            <li>
                                <a href="Article_Recycle.aspx">
                                    <span class="menu-text">回收站</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="menu-dropdown">
                                    <span class="menu-text">
                                        审核文章
                                    </span>
                                    <i class="menu-expand"></i>
                                </a>

                                <ul class="submenu">
                                    <li>
                                        <a href="Article_Audit.aspx">
                                            <i class="menu-icon fa fa-pencil-square-o"></i>
                                            <span class="menu-text">查看未审核文章</span>
                                        </a>
                                    </li>                                                                                                                                       
                                </ul>
                                </li>
                              <li>
                                <a href="#" class="menu-dropdown">
                                    <span class="menu-text">
                                        文章标签
                                    </span>
                                    <i class="menu-expand"></i>
                                </a>

                                <ul class="submenu">
                                    <li>
                                        <a href="ArticleTag_Add.aspx">
                                            <i class="menu-icon fa fa-pencil-square-o"></i>
                                            <span class="menu-text">添加文章标签</span>
                                        </a>
                                    </li>    
                                     <li>
                                        <a href="ArticleTag_Man.aspx">
                                            <i class="menu-icon fa fa-pencil-square-o"></i>
                                            <span class="menu-text">文章标签管理</span>
                                        </a>
                                    </li> 
                                                                                                                                                                       
                                </ul>
                                </li>
                        </ul>
                    </li>
                    <!--More Pages-->
                    <li>
                        <a href="#" class="menu-dropdown">
                            <i class="menu-icon glyphicon glyphicon-link"></i>

                            <span class="menu-text">
                                资源管理
                            </span>
                          <i class="menu-expand"></i>
                        </a>

                        <ul class="submenu">
                            <li>
                                <a href="File_Man.aspx">
                                    <span class="menu-text">媒体管理</span>
                                </a>
                            </li>
                            <li>
                                <a href="File_Upload.aspx">
                                    <span class="menu-text">上传资源</span>
                                </a>
                            </li>                            
                            <li>
                                <a href="File_Recycle.aspx">
                                    <span class="menu-text"> 回收站</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="menu-dropdown">
                                    <span class="menu-text">
                                       文件夹
                                    </span>
                                    <i class="menu-expand"></i>
                                </a>

                                <ul class="submenu">
                                    <li>
                                        <a href="Folder_Man.aspx">
                                            <i class="menu-icon fa fa-camera"></i>
                                            <span class="menu-text">文件夹管理</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="Folder_Add.aspx">
                                            <i class="menu-icon fa fa-camera"></i>
                                            <span class="menu-text">新建文件夹</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </li>
                 <!-- /Sidebar Menu -->
            </div>
            <!-- /Page Sidebar -->
            <!-- Page Content -->
            <div class="page-content">
              
                <!-- Page Header -->
                <div class="page-header position-relative">
                      <div id="CurrentPosition">当前位置：<a href="User_Man.aspx">角色管理</a></div>   
         
                    <!--Header Buttons-->
                    <div class="header-buttons">
                        <a class="sidebar-toggler" href="#">
                            <i class="fa fa-arrows-h"></i>
                        </a>
                        <a class="refresh" id="refresh-toggler" href="">
                            <i class="glyphicon glyphicon-refresh"></i>
                        </a>
                        <a class="fullscreen" id="fullscreen-toggler" href="#">
                            <i class="glyphicon glyphicon-fullscreen"></i>
                        </a>
                    </div>
                    <!--Header Buttons End-->
                </div>
                <!-- /Page Header -->
                <!-- Page Body -->
                <div class="page-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">管理角色</span>
                                    <div class="widget-buttons">
                                        <a href="#" data-toggle="maximize">
                                            <i class="fa fa-expand"></i>
                                        </a>
                                        <a href="#" data-toggle="collapse">
                                            <i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="widget-body">

                                     <div>
        总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
        条记录，每页显示：
        <asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true"  OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged"  ForeColor="#5D7B9D">
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="10" Selected="True">10</asp:ListItem>
            <asp:ListItem Value="15">15</asp:ListItem>
            <asp:ListItem Value="20">20</asp:ListItem>
            <asp:ListItem Value="25">25</asp:ListItem>
            <asp:ListItem Value="30">30</asp:ListItem>
        </asp:DropDownList>
        条记录， 共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>页。
        <asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <br />
  
                                    <div class="widget-body bordered-top bordered-sky">
                                        
                                             
                                       <div class="form-group">
                                                        <span class="input-icon">
                                                            <asp:TextBox ID="SearchTB" runat="server" placeholder="查询用户名" class="form-control input-sm"></asp:TextBox>
                                                            <i class="glyphicon glyphicon-search danger circular"></i>

                                                        </span>


                                           </div>
        <asp:Button ID="SearchBtn" runat="server" Text="搜索"  class="btn btn-sky" OnClick="SearchBtn_Click" />&nbsp;&nbsp;

        <asp:DropDownList ID="OrderDDL" runat="server" OnSelectedIndexChanged="OrderDDL_SelectedIndexChanged"
            AutoPostBack="True">
            <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>
            <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>
        </asp:DropDownList>
   
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true"  oncheckedchanged="SelectAllCheckBox_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="UpdateBtn" runat="server" Text="修改" class="btn btn-blue active" onclick="UpdateBtn_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DelBtn" runat="server" Text="删除" class="btn btn-darkorange active" onclick="DelBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
   
    
                                        
        <div style="height:32px;line-height:32px; float:right;">角色分类：
          <asp:DropDownList ID="RoleTypeDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RoleTypeDDL_SelectedIndexChanged">
        </asp:DropDownList>
</div>       
    <div id="margin">
      <asp:GridView ID="GridView1" Width="100%" runat="server" 
        AutoGenerateColumns="False"   class="table table-striped table-bordered table-hover" 
        GridLines="Horizontal"  style="text-align:center;" HeaderStyle-HorizontalAlign="Center"  >    
    <Columns >
        <asp:TemplateField HeaderText="序" >
            <ItemTemplate >
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="30px" HorizontalAlign="center"/>
            <HeaderStyle Width="30px" />
        </asp:TemplateField>
          <asp:TemplateField>
    <ItemTemplate>
    <asp:CheckBox ID="ChechBox1" runat="server" />    
    </ItemTemplate>
    <ItemStyle Width="30px" HorizontalAlign="Left" />
    </asp:TemplateField>          
        <asp:BoundField DataField="UserName" HeaderText="用户名"  ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center" >
<ItemStyle Width="80px"></ItemStyle>
        </asp:BoundField>
          <asp:BoundField DataField="TrueName" HeaderText="姓名"  ItemStyle-Width="80" >
<ItemStyle Width="80px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="90" Visible="true" />
        <asp:BoundField DataField="TelePhone" HeaderText="联系方式" ItemStyle-Width="90" Visible="true" />
        <asp:TemplateField HeaderText="头像" >
            <ItemTemplate>
                <img src='<%# Eval("Avatar")%>' alt='<%# Eval("UserName")%>' width="80" />
            </ItemTemplate>
        </asp:TemplateField>                
        <asp:BoundField DataField="Status" HeaderText="个性签名" SortExpression="Status"   />
         <asp:HyperLinkField DataNavigateUrlFields="ID" 
             DataNavigateUrlFormatString="User_Edit2.aspx?ID={0}" DataTextField="RoleName" 
            HeaderText="角色"  Target="_blank"   ItemStyle-Width="90">
    </asp:HyperLinkField>  
        <asp:BoundField DataField="Valid" HeaderText="有效" SortExpression="Valid"  ItemStyle-Width="90"/>
    </Columns>
</asp:GridView>
           <p>&nbsp;&nbsp;
        <webdiyer:AspNetPager CssClass="pages" CurrentPageButtonClass="cpb" class="pagination" AlwaysShow="true"
            ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
            PrevPageText="上一页" OnPageChanged="AspNetPager1_PageChanged"  PagingButtonSpacing="0">
        </webdiyer:AspNetPager>
    </p>  
        </div>
                                      </div>      
                                        </div>
                                   
 
             </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Page Body -->
            </div>
            <!-- /Page Content -->
        </div>
        <!-- /Page Container -->
        <!-- Main Container -->

    </div>
   
         <!--Basic Scripts-->
    <script src="assets/js/jquery-2.0.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>
   
    </form>
</body>
</html>
