<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Avatar.aspx.cs" Inherits="User_Avatar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div id="CurrentPosition">当前位置：<a href="#">用户中心</a> >> <a href="#">用户头像和标签</a></div>
     <asp:Label ID="RandomID" runat="server" Visible="false" Text=""></asp:Label>
    <p>&nbsp;</p>

    <div class="row">
                                <div class="col-lg-12">
                                    <div class="widget">
                                        <div class="widget-header bordered-bottom bordered-themesecondary">
                                            <i class="widget-icon fa fa-tags themesecondary"></i>
                                            <span class="widget-caption themesecondary">插入新建用户头像和标签</span>
                                        </div><!--Widget Header-->
                                        <div class="widget-body">
                                            <div class="widget-main no-padding">
                                                <div class="tickets-container">
                                      
                                                    <div class="row">
                                       <div class="col-lg-4 col-sm-4 col-xs-8">
                                         
                                           <asp:Image ID="Image1" runat="server" width="180px" Height="250px" AlternateText="用户头像" />
                               
                                           </div>
                              <div class="col-lg-4 col-sm-4 col-xs-3">
                                    <p style="margin-left:15px;" class="text-muted">请上传您的用户头像</p>
                       <asp:FileUpload ID="FileUpload1" CssClass="btn btn-link" style="margin-left:15px;margin-top:50px;" runat="server" BackColor="#CCCCCC" ForeColor="White" />
                        <asp:Button ID="Button1" style="margin:60px 30px;" runat="server" class="btn btn-palegreen" Text=" 上 传 " OnClick="Button1_Click"/>
    <p>
<asp:Label ID="ResultLabel" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
       
</p>      

        
                                  </div>

                                      </div>
                            <p></p>
         <span class="text-primary">用户所属标签：</span>
          <asp:CheckBoxList ID="TagsList" runat="server" style="margin-left:10px;margin-top:10px;" RepeatDirection="Horizontal" 
                 RepeatLayout="Table" RepeatColumns="4" Width="500px">
          </asp:CheckBoxList>

<asp:Button ID="Button2" runat="server" Text=" 完成操作 " style="margin-top:50px;margin-left:400px;" class="btn btn-palegreen"  onclick="Button2_Click" />
                                                      
                                                      
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

</asp:Content>
