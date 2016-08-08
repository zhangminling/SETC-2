<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Tag_Edit.aspx.cs" Inherits="Tag_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div id="CurrentPosition">当前位置：<a href="Tags_Man.aspx">标签管理 </a>>><a href="#">用户标签</a> >> <a href="#">更新标签</a></div>
      <div style="margin-top:20px;"></div>
     <div class="col-lg-8 col-sm-12 col-xs-12">
    <div class="row">
                                <div class="col-lg-12">
                                    <div class="widget">
                                        <div class="widget-header bordered-bottom bordered-themesecondary">
                                            <i class="widget-icon fa fa-tags themesecondary"></i>
                                            <span class="widget-caption themesecondary">修改标签</span>
                                        </div><!--Widget Header-->
                                        <div class="widget-body">
                                            <div class="widget-main no-padding">
                                                <div class="tickets-container">
                                                 <h6>标签名</h6>
                                        <asp:TextBox ID="TagName"  class="form-control" TextMode="MultiLine" Columns="20" Rows="1" placeholder="此字段不能为空" runat="server"></asp:TextBox>
                                                     <hr class="wide" />
                                        <h6>标签描述</h6>
                                        <asp:TextBox ID="TagDescription"  class="form-control" TextMode="MultiLine" Columns="40" Rows="4" placeholder="关于你的标签" runat="server"></asp:TextBox>
                                        <div style="margin-top:20px;"></div>
                                            <asp:Button ID="Button1" runat="server" class="btn btn-magenta" Text="新建标签" style="margin-left:5px;margin-top:2px;"/>
                                                        </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
         </div>
</asp:Content>

