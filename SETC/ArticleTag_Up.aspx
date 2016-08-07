<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ArticleTag_Up.aspx.cs" Inherits="ArticleTag_Up" %>

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
       <asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="TagID" runat="server" Visible="false" Text=""></asp:Label>

       <div id="CurrentPosition">当前位置：<a href="">文章管理 </a>>><a href="#">文章标签</a> >> <a href="#">更新标签</a></div>
    <p></p>

    <div class="row">
     <div class="col-lg-6 col-sm-6 col-xs-12">
                                    <div class="well with-header">
                                        <div class="header bordered-darkpink">更新标签</div>
                                        <h6>标签名</h6>
                                        <asp:TextBox ID="TagName"  class="form-control" TextMode="MultiLine" Columns="20" Rows="1" placeholder="此字段不能为空" runat="server"></asp:TextBox>
                 
                                        <hr class="wide" />
                                        <h6>标签描述</h6>
                                        <asp:TextBox ID="TagDescription"  class="form-control" TextMode="MultiLine" Columns="40" Rows="4" placeholder="关于你的标签" runat="server"></asp:TextBox>
                                        <p>
                                        
     <asp:Button ID="Button1" runat="server" class="btn btn-magenta" Text="更新标签" style="margin-left:5px;margin-top:2px;" OnClick="Button1_Click"/>
                                            <asp:Button ID="Last" runat="server" class="btn btn-magenta" Text="返回上一步" style="margin-left:5px;margin-top:2px;" OnClick="Last_Click"/>
                                        </p>
                                    </div>
     </div>
        </div>

        <div class="row">
     <div class="col-lg-10 col-sm-10 col-xs-16"   style=" Width:950px">
                          
</div>
            </div>
   
          
</asp:Content>

