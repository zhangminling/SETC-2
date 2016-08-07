<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Del.aspx.cs" Inherits="User_Del" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="User_Manage.aspx">网站首页</a> >> <a href="#">删除用户</a>
</div>


<p>&nbsp;</p>
    <p style="color:red">您确定要删除以下用户吗？一旦删除，将不可恢复！
    </p>
    <p ></p>
    <asp:Button ID="Button1" runat="server" Text="确定删除" 
            CssClass="btn btn-warning" onclick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Button ID="Button2" 
            runat="server" Text="取消返回" CssClass="btn btn-palegreen" onclick="Button2_Click" />
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ResultLabel" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
</p>
 <div class="col-lg-11 col-sm-15 col-xs-15">

                            <div class="row">
                                <div class="col-lg-15">
                                    <div class="widget">
                                        <div class="widget-header bordered-bottom bordered-themesecondary">
                                            <i class="widget-icon fa fa-tags themesecondary"></i>
                                            <span class="widget-caption themesecondary">用户删除</span>
                                        </div><!--Widget Header-->
                                        <div class="widget-body">
                                            <div class="widget-main no-padding">
                                                <div class="tickets-container">
                                                    <ul class="tickets-list">
                                                        <asp:GridView ID="GridView1" DataKeyNames="ID" runat="server"  CssClass="GridViewStyle"  AutoGenerateColumns="false" Width="99%"  ShowHeader="true" GridLines ="None">
       <RowStyle CssClass="Gridviewticket-item" />  
          <SelectedRowStyle CssClass="GridViewSelectedRowStyle " />                                                
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
       <HeaderStyle CssClass="GridViewHeaderStyle-item" />
       <%--  <FooterStyle CssClass="GridViewFooterStyle" />
       
       
        <PagerStyle CssClass="GridViewPagerStyle" />
       --%>
   
                                                            <Columns>
     <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
    <ItemTemplate >
        <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>' ></asp:Label>
    </ItemTemplate>
    <ItemStyle Width="50px" HorizontalAlign="center" ForeColor="#CCCCCC"  Font-Bold="True" />        
    </asp:TemplateField>
                                                              
    <asp:TemplateField HeaderText="头像" >
            <ItemTemplate>
                <img src='<%# Eval("Avatar")%>' alt='<%# Eval("UserName")%>' width="120" style="margin-left:80px;" />
            </ItemTemplate>
        </asp:TemplateField>   
     <asp:HyperLinkField DataNavigateUrlFields="ID" 
        DataNavigateUrlFormatString="User_Edit2.aspx?ID={0}" DataTextField="UserName" 
        HeaderText="用户名" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center" Target="_blank" >
    </asp:HyperLinkField> 
      <asp:BoundField DataField="TrueName" HeaderText="姓名" ItemStyle-Width="100"  ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="#999999"/> 
      <asp:BoundField DataField="RoleName" HeaderText="用户权限" ItemStyle-Width="110"  ItemStyle-HorizontalAlign="Center" ItemStyle-ForeColor="#999999" />  
     <asp:BoundField DataField="RegisterDateTime" HeaderText="注册日期"  ItemStyle-HorizontalAlign="Center"  DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="130"  ItemStyle-ForeColor="#999999"/>
      <asp:BoundField DataField="LastLoginDateTime" HeaderText="最后登录日期" ItemStyle-HorizontalAlign="Center"  DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="130"  ItemStyle-ForeColor="#999999" />      
    </Columns>
</asp:GridView>
                 </ul>                               </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
   

                        </div>


</asp:Content>

