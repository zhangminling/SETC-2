<%@ Page Language="C#" AutoEventWireup="true" CodeFile="File_Upload.aspx.cs" Inherits="File_Upload" %>
<%@ Register TagPrefix="CuteWebUI" Namespace="CuteWebUI" Assembly="CuteWebUI.AjaxUploader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <style type="text/css">
    .avatar1
    {
        margin-left:-13px;
    }
    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>教育技术与传播学院</title>
    <meta name="description" content="后台" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.jpg" type="image/x-icon"/>

    <!-- 旧版母版的css -->
    <link rel="stylesheet" type="text/css" href="User.master.css" />


    <!--Basic Styles-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="#" rel="stylesheet" />--%>
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
    <%--<link href="http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css"/>--%>

    <!--Beyond styles-->
    <link href="assets/css/beyond.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/demo.min.css" rel="stylesheet" />
    <link href="assets/css/typicons.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <%--<link href="#" rel="stylesheet" type="text/css" />--%>

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script type="text/javascript" src="assets/js/skins.min.js"></script>

    <script src="assets/js/jquery-2.0.3.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="Scriptmanager1" runat="server">
            </asp:ScriptManager>
    <div class="loading-container">
        <div class="loading-progress">
            <div class="rotator">
                <div class="rotator">
                    <div class="rotator colored">
                        <div class="rotator">
                            <div class="rotator colored">
                                <div class="rotator colored"></div>
                                <div class="rotator"></div>
                            </div>
                            <div class="rotator colored"></div>
                        </div>
                        <div class="rotator"></div>
                    </div>
                    <div class="rotator"></div>
                </div>
                <div class="rotator"></div>
            </div>
            <div class="rotator"></div>
        </div>
    </div>
    <!--  /Loading Container -->
    <!-- Navbar -->
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
    <!-- Main Container -->
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
                                <a href="Tags_Man.aspx">
                                    <span class="menu-text">标签管理</span>
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
                                        <a href="ArticleTag_Man.aspx">
                                            <i class="menu-icon fa fa-pencil-square-o"></i>
                                            <span class="menu-text">添加文章标签</span>
                                        </a>
                                    </li>    
                                     <li>
                                        <a href="Article_Tag_Man.aspx">
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
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                   
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
        <!-- Main Container -->

    <!--Basic Scripts-->
    <script src="assets/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>


    <!--Page Related Scripts-->
    <!--Sparkline Charts Needed Scripts-->
    <script type="text/javascript"src="assets/js/charts/sparkline/jquery.sparkline.js"></script>
    <script type="text/javascript"src="assets/js/charts/sparkline/sparkline-init.js"></script>

    <!--Easy Pie Charts Needed Scripts-->
    <script type="text/javascript" src="assets/js/charts/easypiechart/jquery.easypiechart.js"></script>
    <script type="text/javascript"src="assets/js/charts/easypiechart/easypiechart-init.js"></script>

    <!--Flot Charts Needed Scripts-->
    <script type="text/javascript" src="assets/js/charts/flot/jquery.flot.js"></script>
    <script type="text/javascript" src="assets/js/charts/flot/jquery.flot.resize.js"></script>
    <script type="text/javascript" src="assets/js/charts/flot/jquery.flot.pie.js"></script>
    <script type="text/javascript" src="assets/js/charts/flot/jquery.flot.tooltip.js"></script>
    <script type="text/javascript"  src="assets/js/charts/flot/jquery.flot.orderBars.js"></script>

    <script type="text/javascript">
        // If you want to draw your charts with Theme colors you must run initiating charts after that current skin is loaded
        $(window).bind("load", function () {

            /*Sets Themed Colors Based on Themes*/
            themeprimary = getThemeColorFromCss('themeprimary');
            themesecondary = getThemeColorFromCss('themesecondary');
            themethirdcolor = getThemeColorFromCss('themethirdcolor');
            themefourthcolor = getThemeColorFromCss('themefourthcolor');
            themefifthcolor = getThemeColorFromCss('themefifthcolor');

            //Sets The Hidden Chart Width
            $('#dashboard-bandwidth-chart')
                .data('width', $('.box-tabbs')
                    .width() - 20);

            //-------------------------Visitor Sources Pie Chart----------------------------------------//
            var data = [
                {
                    data: [[1, 21]],
                    color: '#fb6e52'
                },
                {
                    data: [[1, 12]],
                    color: '#e75b8d'
                },
                {
                    data: [[1, 11]],
                    color: '#a0d468'
                },
                {
                    data: [[1, 10]],
                    color: '#ffce55'
                },
                {
                    data: [[1, 46]],
                    color: '#5db2ff'
                }
            ];
            var placeholder = $("#dashboard-pie-chart-sources");
            placeholder.unbind();

            $.plot(placeholder, data, {
                series: {
                    pie: {
                        innerRadius: 0.45,
                        show: true,
                        stroke: {
                            width: 4
                        }
                    }
                }
            });

            //------------------------------Visit Chart------------------------------------------------//
            var data2 = [{
                color: themesecondary,
                label: "Direct Visits",
                data: [[3, 2], [4, 5], [5, 4], [6, 11], [7, 12], [8, 11], [9, 8], [10, 14], [11, 12], [12, 16], [13, 9],
                [14, 10], [15, 14], [16, 15], [17, 9]],

                lines: {
                    show: true,
                    fill: true,
                    lineWidth: .1,
                    fillColor: {
                        colors: [{
                            opacity: 0
                        }, {
                            opacity: 0.4
                        }]
                    }
                },
                points: {
                    show: false
                },
                shadowSize: 0
            },
                {
                    color: themeprimary,
                    label: "Referral Visits",
                    data: [[3, 10], [4, 13], [5, 12], [6, 16], [7, 19], [8, 19], [9, 24], [10, 19], [11, 18], [12, 21], [13, 17],
                    [14, 14], [15, 12], [16, 14], [17, 15]],
                    bars: {
                        order: 1,
                        show: true,
                        borderWidth: 0,
                        barWidth: 0.4,
                        lineWidth: .5,
                        fillColor: {
                            colors: [{
                                opacity: 0.4
                            }, {
                                opacity: 1
                            }]
                        }
                    }
                },
                {
                    color: themethirdcolor,
                    label: "Search Engines",
                    data: [[3, 14], [4, 11], [5, 10], [6, 9], [7, 5], [8, 8], [9, 5], [10, 6], [11, 4], [12, 7], [13, 4],
                    [14, 3], [15, 4], [16, 6], [17, 4]],
                    lines: {
                        show: true,
                        fill: false,
                        fillColor: {
                            colors: [{
                                opacity: 0.3
                            }, {
                                opacity: 0
                            }]
                        }
                    },
                    points: {
                        show: true
                    }
                }
            ];
            var options = {
                legend: {
                    show: false
                },
                xaxis: {
                    tickDecimals: 0,
                    color: '#f3f3f3'
                },
                yaxis: {
                    min: 0,
                    color: '#f3f3f3',
                    tickFormatter: function (val, axis) {
                        return "";
                    },
                },
                grid: {
                    hoverable: true,
                    clickable: false,
                    borderWidth: 0,
                    aboveData: false,
                    color: '#fbfbfb'

                },
                tooltip: true,
                tooltipOpts: {
                    defaultTheme: false,
                    content: " <b>%x May</b> , <b>%s</b> : <span>%y</span>",
                }
            };
            var placeholder = $("#dashboard-chart-visits");
            var plot = $.plot(placeholder, data2, options);

            //------------------------------Real-Time Chart-------------------------------------------//


            // Zip the generated y values with the x values

            //var res = [];
            //for (var i = 0; i < data.length; ++i) {
            //    res.push([i, data[i]]);
            //}

            //return res;
            //}
            // Set up the control widget
            var updateInterval = 100;
            var plot = $.plot("#dashboard-chart-realtime", [getRandomData()], {
                yaxis: {
                    color: '#f3f3f3',
                    min: 0,
                    max: 100,
                    tickFormatter: function (val, axis) {
                        return "";
                    }
                },
                xaxis: {
                    color: '#f3f3f3',
                    min: 0,
                    max: 100,
                    tickFormatter: function (val, axis) {
                        return "";
                    }
                },
                colors: [themeprimary],
                series: {
                    lines: {
                        lineWidth: 0,
                        fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 0.5
                            }, {
                                opacity: 0
                            }]
                        },
                        steps: false
                    },
                    shadowSize: 0
                },
                grid: {
                    hoverable: true,
                    clickable: false,
                    borderWidth: 0,
                    aboveData: false
                }
            });
        });

    </script>
    <div id="Content">
        <div id="CurrentPosition">
        当前位置：<a href="File_Man.aspx">资源管理</a> >> <a href="#">上传资源</a></div>
        <h1>上传资源</h1>
    <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                                                           
                    <p>
                        1、点击上传，选择要上传的文件。合法的文件包括：音频、视频、图片、文档、压缩、Flash等。</p>
                    <div>&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="FET" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:Label ID="FS" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:Label ID="FN" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:Label ID="FP" runat="server" Text="Label" Visible="false"></asp:Label>
                    <asp:Label ID="ResourceTypeLabel" runat="server" Text="" Visible="false"></asp:Label>
                    <CuteWebUI:Uploader runat="server" ID="Uploader1" InsertText="上传" OnFileUploaded="Uploader_FileUploaded">
                    </CuteWebUI:Uploader>
                    </div>
                                        
                    <p>2、对资源重命名</p>
                    <p><small>&nbsp;&nbsp;&nbsp;输入有意义的名字，方便日后对资源的查找和管理</small></p>
                    <p id="IMG">
                        <asp:Image ID="Image1" runat="server" />
                    </p>          
                    <div>&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server" Width="280px"></asp:TextBox>&nbsp; 
                        </div>

                    <p>3、选择保存的目录</p>
                    <div>&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="FolderDDL" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="FolderDDL_SelectedIndexChanged">
                        </asp:DropDownList> &nbsp;&nbsp;&nbsp;
                    </div> 
            
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
                    <div>&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="确定" CssClass="Button" 
                        onclick="Button1_Click"  />
                        &nbsp;&nbsp;<asp:Button ID="Abolish" runat="server" Text="取消" Visible="false" />
                    </div>
            
                </ContentTemplate>
            </asp:UpdatePanel>
    </div>
    </div>
    </form>
</body>
</html>
