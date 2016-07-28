<%@ Page Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Zoon.aspx.cs" Inherits="User_Zoon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="CurrentPosition">当前位置：<a href="#">个人空间</a></div>

<p>&nbsp;</p>

<!-- Page Body -->
                <div class="page-body">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="databox radius-bordered databox-shadowed databox-graded">
                                        <div class="databox-left bg-themesecondary">
                                            <div class="databox-piechart">
                                                <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="50" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.1)"><span class="white font-90">50%</span></div>
                                            </div>
                                        </div>
                                        <div class="databox-right">
                                            <span class="databox-number themesecondary">14</span>
                                            <div class="databox-text darkgray">待审核文章</div>
                                            <div class="databox-stat themesecondary radius-bordered">
                                                <i class="stat-icon icon-lg fa fa-tasks"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="databox radius-bordered databox-shadowed databox-graded">
                                        <div class="databox-left bg-themethirdcolor">
                                            <div class="databox-piechart">
                                                <div data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="15" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.2)"><span class="white font-90">15%</span></div>
                                            </div>
                                        </div>
                                        <div class="databox-right">
                                            <span class="databox-number themethirdcolor">1</span>
                                            <div class="databox-text darkgray">新的信息</div>
                                            <div class="databox-stat themethirdcolor radius-bordered">
                                                <i class="stat-icon  icon-lg fa fa-envelope-o"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="databox radius-bordered databox-shadowed databox-graded">
                                        <div class="databox-left bg-themeprimary">
                                            <div class="databox-piechart">
                                                <div id="users-pie" data-toggle="easypiechart" class="easyPieChart" data-barcolor="#fff" data-linecap="butt" data-percent="76" data-animate="500" data-linewidth="3" data-size="47" data-trackcolor="rgba(255,255,255,0.1)"><span class="white font-90">76%</span></div>
                                            </div>
                                        </div>
                                        <div class="databox-right">
                                            <span class="databox-number themeprimary">98</span>
                                            <div class="databox-text darkgray">新的用户</div>
                                            <div class="databox-state bg-themeprimary">
                                                <i class="fa fa-check"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <div class="databox radius-bordered databox-shadowed databox-graded">
                                        <div class="databox-left no-padding bordered-left-2 bordered-palegreen">
                                            <!--<img src="assets/img/avatars/John-Smith.jpg" style="width:65px; height:65px;">-->
                                            <asp:Image ID="AvatarImage" runat="server" Width="65" Height="65" />
                                        </div>
                                        <div class="databox-right padding-top-20">
                                            <div class="databox-stat palegreen">
                                                <i class="stat-icon icon-xlg fa fa-phone"></i>
                                            </div>
                                            <div class="databox-text darkgray"><%= Session["UserName"] %></div>
                                            <div class="databox-text darkgray"><%= Session["RoleName"] %></div>
                                        </div>
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>

                  
        <!-- Main Container -->

    </div>
</asp:Content>
