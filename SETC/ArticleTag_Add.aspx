<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ArticleTag_Add.aspx.cs" Inherits="ArticleTag_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <style type="text/css">
#margin{
 margin-top:20px;
}
#margin th {
  text-align:center;
           }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="TagIDLabel" runat="server" Text="" Visible="false"></asp:Label>
     <asp:Label ID="LabelUserID" runat="server" Visible="false" Text=""></asp:Label>
       <div id="CurrentPosition">当前位置：<a href="">文章管理 </a>>><a href="#">文章标签</a> >> <a href="#">添加标签</a></div>
    <p></p>


    <div class="row">
     <div class="col-lg-6 col-sm-6 col-xs-12">
                                    <div class="well with-header">
                                        <div class="header bordered-darkpink">添加标签       </div>
                                        <h6>标签名   <asp:Label ID="ErrorLabel" runat="server" Text="" ForeColor="Red"></asp:Label></h6> 
                                       <div><asp:TextBox ID="TagName"  class="form-control" TextMode="MultiLine" Columns="20" Rows="1" placeholder="此字段不能为空" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="/*标签名必填*/" ControlToValidate="TagName"></asp:RequiredFieldValidator>
                                      </div> 
                                        <hr class="wide" />
                                        <h6>标签描述</h6>
                                        <asp:TextBox ID="TagDescription"  class="form-control" TextMode="MultiLine" Columns="40" Rows="4" placeholder="关于标签的描述" runat="server"></asp:TextBox>
                                       
                                        
                                     
                                        <p>
     <asp:Button ID="Button1" runat="server" class="btn btn-magenta" Text="添加" style="margin-left:5px;margin-top:2px;" OnClick="Button1_Click"/>
                                       </p>
                                    </div>
     </div>
        </div>
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
        <div class="row">
             
    <div class="col-lg-10 col-sm-10 col-xs-16"   style=" Width:950px"    >
                                    <div class="well with-header">
                                         <div class="header bordered-blueberry">
                                            <span class="badge badge-sky graded">
                                                ●
                                            </span>
                                            <strong>已存在的用户标签</strong> </div>
                                        <div class="row">
                                              
 <div class="col-lg-5 col-sm-5 col-xs-8">
                                      
                
                                            <div style="margin:10px 0;">
                                           <asp:CheckBoxList ID="TagsList" runat="server" RepeatDirection="Horizontal" style="margin-left:20px" RepeatLayout="Table" RepeatColumns="7" Width="950px"></asp:CheckBoxList>
</div>
                                        
    </div>
                                    </div>
                                        </div>
                                </div>
                
        </div>
             </ContentTemplate>
        </asp:UpdatePanel>
       

</asp:Content>

