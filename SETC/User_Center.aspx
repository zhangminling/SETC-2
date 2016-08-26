<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Center.aspx.cs" Inherits="User_Center" %>

<%@ Register Src="~/SearchControl/Search_Box.ascx" TagPrefix="uc1" TagName="Search_Box" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>教育技术与传播学院</title>
    <meta name="description" content="后台" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.jpg" type="image/x-icon" />

    <!--Basic Styles-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="#" rel="stylesheet" />--%>
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Beyond styles-->
    <link href="assets/css/beyond.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/demo.min.css" rel="stylesheet" />
    <link href="assets/css/typicons.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <%--<link href="#" rel="stylesheet" type="text/css" />--%>
    <link href="assets/css/style.css" rel="stylesheet" />
    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script type="text/javascript" src="assets/js/skins.min.js"></script>
    <script src="assets/js/jquery-2.0.3.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
   <div>
            <div class="navbar">
                <div class="navbar-inner">
                    <div class="navbar-container">
                        <!-- Navbar Barnd -->
                        <div class="navbar-header pull-left">
                            <a href="User_Center.aspx" class="navbar-brand">
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
                                            <div class="avatar" title="View your public profile" style="border-left: 0px;">
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
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #5DB2FF;" rel="assets/css/skins/blue.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #2dc3e8;" rel="assets/css/skins/azure.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #03B3B2;" rel="assets/css/skins/teal.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #53a93f;" rel="assets/css/skins/green.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #FF8F32;" rel="assets/css/skins/orange.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #cc324b;" rel="assets/css/skins/pink.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #AC193D;" rel="assets/css/skins/darkred.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #8C0095;" rel="assets/css/skins/purple.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #0072C6;" rel="assets/css/skins/darkblue.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #585858;" rel="assets/css/skins/gray.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #474544;" rel="assets/css/skins/black.min.css"></a></li>
                                                    <li><a class="colorpick-btn" href="#" style="background-color: #001940;" rel="assets/css/skins/deepblue.min.css"></a></li>
                                                </ul>
                                            </li>
                                            <!--/Theme Selector Area-->
                                            <li class="dropdown-footer">
                                                <a href="login.aspx">退出
                                                </a>
                                            </li>
                                        </ul>
                                        <!--/Login Area Dropdown-->
                                    </li>
                                    <!-- /Account Area -->
                                    <!--Note: notice that setting div must start right after account area list.
                            no space must be between these elements-->
                                    <!-- Settings -->
                                </ul>
                                <div class="setting">
                                    <a id="btn-log-out" title="回到前台主页" href="index2.aspx">
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
                            <a href="User_Center.aspx">
                                <i class="menu-icon glyphicon glyphicon-home"></i>
                                <span class="menu-text">个人空间 </span>
                            </a>
                        </li>
                              
                        <!--UI Elements-->
                        <li>
                            <a href="User_Man.aspx" class="menu-dropdown">
                                <i class="menu-icon fa fa-desktop"></i>
                                <span class="menu-text">用户管理 </span>
                                <i class="menu-expand"></i>
                            </a>

                            <ul class="submenu">
                                <li>
                                    <a href="User_Edit2.aspx?ID=<%= Session["UserID"] %>">
                                        <span class="menu-text">个人信息</span>
                                    </a>
                                </li>
                       
                                <asp:PlaceHolder ID="AdminUser" runat="server">
                                <li>  
                                    <a href="#" class="menu-dropdown">
                                        <span class="menu-text">管理员操作
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
                                            <a href="User_Manage.aspx">
                                                <i class="menu-icon wi-day-snow"></i>
                                                <span class="menu-text">管理用户 </span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                </asp:PlaceHolder>
                          
                                <li>
                                    <a href="User_Password.aspx">
                                        <span class="menu-text">修改密码</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                   <%--  用户标签--%>
                        <asp:PlaceHolder ID="UserTagPanel" runat="server">
                        <li>    
                            
                           <a href="#" class="menu-dropdown">
                                <i class="menu-icon fa fa-table"></i>
                                <span class="menu-text">用户标签 </span>

                                <i class="menu-expand"></i>
                            </a>
                            
                      <ul class="submenu">
                         
                                <li>
                                    <a href="UserTags_Add.aspx">
                                        <span class="menu-text">添加标签</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="Tags_Man.aspx">
                                        <span class="menu-text">标签管理</span>
                                    </a>
                                </li>
                         
                            </ul>
                            
                        </li>
              </asp:PlaceHolder>
                    <%--  用户标签--%>
                      <%--  焦点图Panel--%>
                        <asp:PlaceHolder ID="FocusPanel" runat="server">
                       <li>
                            <a href="#" class="menu-dropdown">
                                <i class="menu-icon fa fa-pencil-square-o"></i>
                                <span class="menu-text">焦点图管理 </span>

                                <i class="menu-expand"></i>
                            </a>

                            <ul class="submenu">
                                <li>
                                    <a href="Focus_Man.aspx">
                                        <span class="menu-text">焦点图管理</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="Focus_Upload.aspx">
                                        <span class="menu-text">上传焦点图</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="Focus_Recycle.aspx">
                                        <span class="menu-text">候选焦点图</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                      </asp:PlaceHolder>
                            <%--  焦点图Panel--%>
                       <%-- 分类Panel--%>
                    <asp:PlaceHolder ID="ClassPanel" runat="server">
                        <!--Charts-->
                        <li>
                           
                            <a href="#" class="menu-dropdown">
                                <i class="menu-icon fa fa-bar-chart-o"></i>
                                <span class="menu-text">分类管理 </span>

                                <i class="menu-expand"></i>
                            </a>

                            <ul class="submenu">
                                <li>
                                    <a href="Cat_Man.aspx">
                                        <span class="menu-text">一级分类管理</span>
                                    </a>
                                </li>

                            </ul>
                        </li>
                     </asp:PlaceHolder>
                          <%-- 分类Panel--%>
                      
                 <%--   菜单Panel--%>
                       <asp:PlaceHolder ID="MenuPanel" runat="server">
                        <li>
                            <a href="#" class="menu-dropdown">
                                <i class="menu-icon fa fa-envelope-o"></i>
                                <span class="menu-text">菜单管理 </span>

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
                           </asp:PlaceHolder>
                         <%--   菜单Panel--%>
                        <!--Pages-->
                        <li>
                            <a href="#" class="menu-dropdown">
                                <i class="menu-icon glyphicon glyphicon-paperclip"></i>
                                <span class="menu-text">文章管理 </span>

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
                             <%--   文章panel--%>
                                <asp:PlaceHolder ID="EditorArctile" runat="server">
                                <li>
                                    <a href="#" class="menu-dropdown">
                                        <span class="menu-text">审核文章
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
                                        <span class="menu-text">文章标签
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
                              </asp:PlaceHolder>
                            <%--   文章panel--%>
                            </ul>
                        </li>
                        <!--More Pages-->
                        <li>
                            <a href="#" class="menu-dropdown">
                                <i class="menu-icon glyphicon glyphicon-link"></i>

                                <span class="menu-text">资源管理
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
                               <%-- 资源panel--%>
                                 <asp:PlaceHolder ID="FilePanel" runat="server">
                                <li>
                                    <a href="File_Recycle.aspx">
                                        <span class="menu-text">回收站</span>
                                    </a>
                                </li>
                               </asp:PlaceHolder>
                                 <%-- 资源panel--%>
                                <li>
                                
                                    <a href="#" class="menu-dropdown">
                                        <span class="menu-text">文件夹
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

                        </ul>
                </div>
                    <!-- /Page Sidebar -->
                    <!-- Page Content -->
                    <div class="page-content">

                        <!-- Page Header -->
                        <div class="page-header position-relative">
                            <asp:Label ID="UserIDs" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text="" Visible="false"></asp:Label>
                            <asp:Label ID="IsTrueUsers" runat="server" Text="" Visible="false"></asp:Label>

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
                        <p>&nbsp;</p>
                        <div style="margin-left:20px;">当前位置：<a href="#">用户中心</a></div>
                        <div style="margin-left:150px;margin-top:-20px;">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
         <ContentTemplate>  
      <asp:DropDownList ID="RoleName" runat="server" Height="30" AutoPostBack="True"  OnSelectedIndexChanged="OrderDDL_SelectedIndexChanged">
                      </asp:DropDownList>
                      </ContentTemplate>
                   </asp:UpdatePanel>

                <uc1:Search_Box runat="server" id="Search_Box" />
                     </div>
                        <div class="page-body" style="padding: 18px 20px 24px;">
                             
                            <div class="row">
                                <div class="col-xs-12 col-md-12">
                                    <div class="widget">
                                        <div class="widget-header ">
                                            <span class="widget-caption">定制您的功能</span>
                                            <div class="widget-buttons compact">
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
                                        <div class="text-primary" style="font-size:20px;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;text-indent:10px;letter-spacing:3px;"> 欢迎使用Resys!</div>
                                        <h5 class="text-muted" style="text-indent:10px;">我们准备了几个链接供您开始：</h5>
                       
                                         <div class="row">
                                             <div class="col-lg-4 col-sm-4 col-xs-10">
                                                 <h4 style="text-indent:10px;">开始使用</h4>
                                                 <a href="Index.aspx" target="_blank" class="palegreen" style="margin-left:10px;font-size:15px;margin-top:15px;">前台主页</a>
                                              </div>
                                             <div class="col-lg-4 col-sm-4 col-xs-10">
                                                 <div style="text-indent:10px;">
                                                   <h4 >接下来</h4>
                                                 <a href="Article_Add.aspx"><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;发表文章</a>
                                                   <p></p>
                                                 <a href="File_Man.aspx"><i class="fa  fa-file"></i>&nbsp;&nbsp;资源管理</a>
                                                      <p></p>
                                                     <asp:PlaceHolder ID="UserMamPanel" runat="server">
                                                 <a href="User_Manage.aspx"><i class="fa   fa-user"></i>&nbsp;&nbsp;用户管理</a>
                                                    </asp:PlaceHolder>
                                                 
                                                     </div>
                                              </div>
                                             <asp:PlaceHolder ID="MorePanel" runat="server">
                                             <div class="col-lg-4 col-sm-4 col-xs-10">
                                                 <div style="text-indent:10px;">
                                                   <h4 >更多操作</h4>
                                                 <a href="User_History.aspx" class="success"><i class="fa  fa-bullhorn"></i>&nbsp;&nbsp;历史记录</a>
                                                   <p></p>
                                                 <a href="Cat_Man.aspx" class="success"><i class="fa  fa-book"></i>&nbsp;&nbsp;分类管理</a>
                                                      <p></p>
                                                 <a href="Focus_Man.aspx" class="success"><i class="fa   fa-picture-o"></i>&nbsp;&nbsp;焦点图管理</a>
                                                     <p></p>
                                                </div>
                                              </div>
                                                 </asp:PlaceHolder>
                                         </div>
                                            <p></p>
                                    <div class="row">
                                        <asp:PlaceHolder ID="WaitForAuditPanel" runat="server">
                                        <div class="col-lg-4 col-sm-4 col-xs-10">    
                                      <a href="Article_Audit.aspx" style="padding-left:10px;">待审核（<asp:Label ID="WaitForAudit" runat="server" Text=""></asp:Label>）</a>
                                            </div>
                                        </asp:PlaceHolder>
                                         <asp:PlaceHolder ID="WaitForAuditExceptAdminPanel" runat="server">
                                        <div class="col-lg-4 col-sm-4 col-xs-10">    
                                      <a href="Article_Audit.aspx" style="padding-left:10px;">待审核（<asp:Label ID="WaitForAuditExceptAdmin" runat="server" Text=""></asp:Label>）</a>
                                            </div>
                                        </asp:PlaceHolder>
                                        <asp:PlaceHolder ID="ForPassPanel" runat="server">
                                        <div class="col-lg-4 col-sm-4 col-xs-10">
                                      <a href="Article_Man.aspx" style="padding-left:10px;">已批准（<asp:Label ID="ForPass" runat="server" Text=""></asp:Label>）</a>
                                             </div>
                                        </asp:PlaceHolder>
                                        <asp:PlaceHolder ID="ForPassExceptAdminPanel" runat="server">
                                         <div class="col-lg-4 col-sm-4 col-xs-10">
                                      <a href="Article_Man.aspx" style="padding-left:10px;">已批准（<asp:Label ID="ForPassExceptAdmin" runat="server" Text=""></asp:Label>）</a>
                                             </div>
                                            </asp:PlaceHolder>
                                         <div class="col-lg-4 col-sm-4 col-xs-10">
                                      <a href="Article_Recycle.aspx" style="padding-left:10px;">草稿箱（<asp:Label ID="Draft" runat="server" Text=""></asp:Label>）</a>
                                             </div>
                                 </div>
                                    </div>


                                </div>
                            </div>
                        </div>

                    <div class="row">
                        <div class="col-lg-6 col-sm-6 col-xs-12">
                             <div class="widget">
                                        <div class="widget-header ">
                                            <span class="widget-caption">概览</span>
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
                                             <div class="row">
                                             <div class="col-lg-4 col-sm-4 col-xs-6">
                                                   <asp:PlaceHolder ID="ALLArctileNumsPanel" runat="server">
                                                  <div><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;文章数&nbsp;<a href="Article_Man.aspx"><asp:Label ID="ALLArctileNums" runat="server" Text=""></asp:Label></a></div>
                                                   <p></p>
                                                       </asp:PlaceHolder>
                                                  <asp:PlaceHolder ID="ArctileNumsPanel" runat="server">
                                                 <div><i class="fa fa-pencil-square-o"></i>&nbsp;&nbsp;发表了<a href="Article_Man.aspx"><asp:Label ID="ArctileNums" runat="server" Text=""></asp:Label></a>篇文章</div>
                                                 <p></p>
                                                    <asp:PlaceHolder ID="UserTagNumsPanel" runat="server">
                                                 
                                          <div><i class="fa fa-users"></i>&nbsp;&nbsp;用户标签数&nbsp;<a href="Tags_Man.aspx"><asp:Label ID="UserTagNums" runat="server" Text=""></asp:Label></a></div>
                                               </asp:PlaceHolder>
                                                       </asp:PlaceHolder>
                                                 
                                             </div>

                                              <div class="col-lg-4 col-sm-4 col-xs-6" style="float:right">
                                                  <asp:PlaceHolder ID="UserNumsPanel" runat="server">
                                                  <div ><i class="fa fa-user"></i>&nbsp;&nbsp;用户数&nbsp;<a href="User_Manage.aspx"><asp:Label ID="UserNums" runat="server" Text=""></asp:Label></a></div>
                                                      <p></p>
                                                  </asp:PlaceHolder>
                                                    
                                            <div><i class="fa fa-film"></i>&nbsp;&nbsp;资源数&nbsp;<a href="File_Man.aspx"><asp:Label ID="FileNums" runat="server" Text=""></asp:Label></a></div>
                                                        </div>
                                             </div>
                                            <asp:PlaceHolder ID="Repeater1Panel" runat="server">
                                       <h4 class="danger" style="text-align:center">最火文章</h4>
                                           <asp:Repeater ID="Repeater1" runat="server">
                                                <HeaderTemplate> <!-- 显示头部 -->
                                                <div style="font-size:16px;">
                                                   <span style="padding-right:50px;">文章标题</span>
                                                    <span style="float:right;padding-right:30px;">点击数</span>
                                                </div>
                                              </HeaderTemplate>
                                <ItemTemplate>
                                        <h6><a href='Article_View.aspx?ID=<%# Eval("ID") %>' target="_blank"><%# Eval("Title") %></a></h6>
                                        <div style="float: right; margin-top: -30px;margin-bottom:8px; margin-right:29px;">
                                            <%# Eval("ViewTimes") %>&nbsp;&nbsp;
                
                                        </div>
                              </ItemTemplate>
                            </asp:Repeater>
                     </asp:PlaceHolder>  
                                            </div>
                                          </div>
                                 </div>

            <div class="col-lg-6 col-sm-6 col-xs-12">
                             <div class="widget">
                                        <div class="widget-header ">
                                            <span class="widget-caption">关于平台</span>
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
                                             <table class="table table-hover">
        <tr class="active"><td>用户权限</td><td>Author</td><td>Editor</td><td>Administrator</td>
        </tr>
        <tr class="success"><td>用户管理</td><td>No</td><td>No</td><td>Yes</td>
        </tr>
        <tr class="warning"><td>文章管理</td><td>No</td><td>Yes</td><td>Yes</td>
        </tr>
        <tr class="danger"><td>发布作品</td><td>需审核</td><td>无需</td><td>无需</td>
        </tr>
        <tr class="active"><td>作品管理</td><td>限自己</td><td>不限</td><td>不限</td>
        </tr>
    </table>
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
          <!--Basic Scripts-->

        <script src="assets/js/bootstrap.min.js"></script>

        <!--Beyond Scripts-->
        <script src="assets/js/beyond.min.js"></script>
    </form>
</body>
</html>
