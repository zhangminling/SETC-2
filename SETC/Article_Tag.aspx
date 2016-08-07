<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Article_Tag.aspx.cs" Inherits="Article_Tag" %>

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

    <asp:Label ID="LabelUserID" runat="server" Visible="false" Text=""></asp:Label>
       <div id="CurrentPosition">当前位置：<a href="">文章管理 </a>>><a href="#">文章标签</a> >> <a href="#">添加标签</a></div>
    <p></p>


    <div class="row">
     <div class="col-lg-6 col-sm-6 col-xs-12">
                                    <div class="well with-header">
                                        <div class="header bordered-darkpink">添加标签</div>
                                        <h6>标签名</h6>
                                        <asp:TextBox ID="TagName"  class="form-control" TextMode="MultiLine" Columns="20" Rows="1" placeholder="此字段不能为空" runat="server"></asp:TextBox>
                 
                                        <hr class="wide" />
                                        <h6>标签描述</h6>
                                        <asp:TextBox ID="TagDescription"  class="form-control" TextMode="MultiLine" Columns="40" Rows="4" placeholder="关于你的标签" runat="server"></asp:TextBox>
                                        <p>
                                        
     <asp:Button ID="Button1" runat="server" class="btn btn-magenta" Text="新建标签" style="margin-left:5px;margin-top:2px;" OnClick="Button1_Click"/>
                                       </p>
                                    </div>
     </div>
        </div>
               
        <div class="row">
             
    <div class="col-lg-10 col-sm-10 col-xs-16">
                                    <div class="well with-header">
                                         <div class="header bordered-blueberry">用户标签</div>
                                        <div class="row">
                                              
                  <div class="col-lg-5 col-sm-5 col-xs-8">
                                        <div class="alert alert-info fade in radius-bordered alert-shadowed">
                                      
                                            <button class="close" data-dismiss="alert">
                                                ×
                                            </button>
                                            <span class="badge badge-sky graded">
                                                8
                                            </span>
                                            <strong>文章标题</strong> 
                                             <div>  
                                        <asp:CheckBoxList ID="TagsList" runat="server" RepeatDirection="Horizontal" 
                RepeatLayout="Flow"></asp:CheckBoxList>

                                             </div>  
                                        </div>

                                        

    </div>
                                    </div>
                                        </div>
                                </div>
                
        </div>

          



</asp:Content>
