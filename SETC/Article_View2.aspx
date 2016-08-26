<%@ Page Title="" Language="C#" MasterPageFile="~/frontend.master" AutoEventWireup="true" CodeFile="Article_View2.aspx.cs" Inherits="Article_View2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       #txt{
           text-align:center; 
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
        <div class="col-lg-9 col-md-9 col-sm-8 col-lg-push-3 col-md-push-3 col-sm-push-4">
            <div class="row">
                <!----- 主体1111111----->
                 <br />
<asp:Label ID="ArticleID" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="ArticleRandomID" runat="server" Text="Label" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="Index.aspx">网站首页</a> >> 
<asp:HyperLink ID="CategoryHyperLink" runat="server"></asp:HyperLink>
<asp:Label ID="SubLabel" runat="server" Text=""></asp:Label>
<asp:HyperLink ID="SubHyperLink" runat="server"></asp:HyperLink>
</div>

                <p>&nbsp;</p>

                <div id="txt">  <asp:Label ID="ArticleTitle" runat="server" Text="Label" Font-Bold="true" Font-Size="16"></asp:Label> </div>
                <br />
                <div id="txt"> 作者：<asp:Label ID="TagName" runat="server" Text="Label"></asp:Label>--<asp:Label ID="Author" runat="server" Text="Label"></asp:Label>&nbsp;|&nbsp;
   日期：<asp:Label ID="CDT" runat="server" Text="Label"></asp:Label>&nbsp;|&nbsp;
   浏览次数：<asp:Label ID="ViewTimes" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;<asp:Label ID="ReviewTimes" runat="server" Text="Label" Visible="false" ></asp:Label></div>
                <br />
                <div id="txt">  <asp:Label ID="Content" runat="server" Text="Label" class="ArticleContent"></asp:Label></div>

<p>&nbsp;</p>
<!-- JiaThis Button BEGIN -->
<div class="jiathis_style">
	<span class="jiathis_txt">分享到：</span>
	<a class="jiathis_button_tools_1"></a>
	<a class="jiathis_button_tools_2"></a>
	<a class="jiathis_button_tools_3"></a>
	<a class="jiathis_button_tools_4"></a>
	<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank">更多</a>
	<a class="jiathis_counter_style"></a>
</div>
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
<!-- JiaThis Button END -->
<p>&nbsp;</p>


                 <!----- /主体----->
            </div>
        </div>


        <div class="col-lg-3 col-md-3 col-sm-4  col-lg-pull-9 col-md-pull-9 col-sm-pull-8 sidebar" style="background:white;">
            <!----- 侧边栏22222---->
            <div>&nbsp;</div>
             <div style="padding-bottom:20px; padding-top:2px;">
   <asp:Image ID="Image1" runat="server" width="240" height="60" />
</div>
            <!---- GridWiew1--->
  <div class="banner-wrapper" style="opacity:1; " >
	<a class="banner" href="#" style="opacity:1;">
        <i class="icons icon-calendar icons-fadeout"></i><i class ="icons icon-calendar"></i>
        <h4>
        <asp:Label ID="CategoryLabel" runat="server" Text="Label"></asp:Label>
    </h4>
         <p><asp:Label ID="DescriptionLabel" runat="server" Text="Label"></asp:Label></p>
	</a>
      </div>

            <div  style="margin:-2px 0px; ">  
    <asp:GridView ID="GridView2" runat="server" ShowHeader="false" AutoGenerateColumns="false" RowStyle-Height="30" GridLines="None"  BackColor="#ffffcc" >
    <Columns>
        
        <asp:HyperLinkField DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="Article_List2.aspx?ID={0}" 
            DataTextField="SubName" />
    </Columns>
</asp:GridView>        

</div>

               <!---- /GridWiew1--->
<p>&nbsp;</p>

<br />
<div  class="blog-post style2" style="opacity:1;padding:20px 0;">
  <img src="images/h/h1.jpg" width="240" height="60">
</div> 
<br />     
     
              <div class="banner-wrapper" style="opacity:1; " >
	<a class="banner" href="#" style="opacity:1;">
        <i class="icons icon-user icons-fadeout"></i><i class ="icons icon-user"></i>
      	<h4>友情链接</h4>
	</a>
      </div>
<div  style="background-color:#ffffcc;margin:-2px 0px;">
    
<p style="width:100%;background-color:red;"><a href="http://www.gdin.edu.cn" target="_blank"> &nbsp;&nbsp;1、广东技术师范学院</a></p>
<p><a href="http://setc.gdin.edu.cn:9000/" target="_blank">&nbsp;&nbsp;2、数字传媒实验中心</a></p>
<p><a href="http://www.edu.cn" target="_blank">&nbsp;&nbsp;3、中国教育与科研计算机网</a></p>
<p><a href="http://www.gdhed.org.cn" target="_blank">&nbsp;&nbsp;4、广东省教育厅</a></p>
<p><a href="http://www.moe.gov.cn" target="_blank">&nbsp;&nbsp;5、中华人民共和国教育部</a></p>        
<p>&nbsp;</p>
</div>



<div class="blog-post style2" style="opacity:1;padding:20px 0;">
  <img src="images/h/h5.jpg" width="240" alt="" />
</div>       
<div class="blog-post style2" style="opacity:1;">
	<h2 ><a href="#">联系我们</a></h2>
    <div>
    <p class="strong">教育技术与传播学院</p>
    <p class="strong">教育技术中心</p>
    <p>地址：广州市天河区中山大道西293号实验楼505</p>
    <p>邮编：510665</p>
    <p>电话：020-38256633</p>
    <p>邮箱：21646523@QQ.com</p>
    <br />
    </div>
</div>
<p>&nbsp;</p>
       
                   </div>


    </div>

</asp:Content>

