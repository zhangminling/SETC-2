﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="File_Recycle.aspx.cs" Inherits="File_Recycle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #GridViewDiv {
            margin-top: 20px;
        }

            #GridViewDiv table tr td {
                padding: 4px 4px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="CurrentPosition">当前位置：<a href="File_Man.aspx">资源管理</a> >> <a href="#">回收站</a></div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="page-body">
                <div class="row">
                    <div class="col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-header ">
                                <span class="widget-caption">回收站</span>
                            </div>
                            <div class="widget-body">
                                <div id="Man_Nav">
                                    <div class="form-group col-xs-3 col-md-3">
                                        <span class="input-icon">
                                            <asp:TextBox ID="SearchTB" runat="server" placeholder="查询资源" class="form-control input-sm"></asp:TextBox>
                                            <i class="glyphicon glyphicon-search danger circular"></i>
                                        </span>
                                    </div>
                                    <asp:Button ID="SearchBtn" runat="server" Text="搜索" class="btn btn-info" OnClick="SearchBtn_Click" />
                                    &nbsp;&nbsp;
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
                                    &nbsp;
                                </p>
                                <div class=" col-xs-10 col-md-10">
                                    <asp:Button ID="Recovery" runat="server" Text="恢复" class="btn btn-info" OnClick="Recovery_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="DelBtn" runat="server" Text="彻底删除" class="btn btn-danger" OnClick="DelBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                                <div style="margin-top: 60px;"></div>
                                <div class=" col-xs-12 col-md-12">
                                    <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true" OnCheckedChanged="SelectAllCheckBox_CheckedChanged" />&nbsp;&nbsp;
                                    <div class="Label1">
                                        总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
                                        条记录，每页显示：
                                        <asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true" OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="20" Selected="True">20</asp:ListItem>
                                            <asp:ListItem Value="50">50</asp:ListItem>
                                            <asp:ListItem Value="100">100</asp:ListItem>
                                            <asp:ListItem Value="200">200</asp:ListItem>
                                            <asp:ListItem Value="500">500</asp:ListItem>
                                        </asp:DropDownList>
                                        条记录， 共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>页
                                        <asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>
                                    </div>
                                </div>
                                <br />
                                <div id="GridViewDiv">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-Height="24px" class="table table-striped table-bordered table-hover"
                                        GridLines="Horizontal" Style="text-align: center;" ForeColor="#333333" HeaderStyle-HorizontalAlign="Center" Width="99%">
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
                                            <asp:BoundField DataField="ResourceName" HeaderText="资源名称" ItemStyle-Width="160px" ItemStyle-HorizontalAlign="Left" />
                                            <asp:BoundField DataField="FileType" HeaderText="类型" SortExpression="FileType" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="FileSizeInKB" HeaderText="大小(KB)" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="FolderName" HeaderText="原文件夹" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="UserName" HeaderText="上传用户" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="FileName" HeaderText="文件名" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center" />
                                            <asp:BoundField DataField="CDT" HeaderText="上传日期" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <p>
                                    &nbsp;&nbsp;
                                <webdiyer:AspNetPager CssClass="pages" CurrentPageButtonClass="cpb" AlwaysShow="true"
                                    ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
                                    PrevPageText="上一页" OnPageChanged="AspNetPager1_PageChanged" PagingButtonSpacing="0">
                                </webdiyer:AspNetPager>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

