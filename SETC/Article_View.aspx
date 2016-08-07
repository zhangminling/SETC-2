<%@ Page Title="" Language="C#" MasterPageFile="~/Master2Col.master" AutoEventWireup="true" CodeFile="Article_View.aspx.cs" Inherits="Article_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderSideBar" Runat="Server">
<div style="padding-bottom:20px; padding-top:2px;">
   <asp:Image ID="Image1" runat="server" width="240" height="60" />
</div> 
<div class="box">
	<h2 style="background-image:url(images/32/time_clock24.png);">
        <asp:Label ID="CategoryLabel" runat="server" Text="Label"></asp:Label>
    </h2>
    <div style="DivInBox">            
    <p class="indent24"><asp:Label ID="DescriptionLabel" runat="server" Text="Label"></asp:Label></p>
    <asp:GridView ID="GridView2" runat="server" ShowHeader="false" AutoGenerateColumns="false" RowStyle-Height="26" GridLines="None">
    <Columns>
        <asp:ImageField DataImageUrlField="ID" ItemStyle-Width="20" ItemStyle-HorizontalAlign="left" 
            DataImageUrlFormatString="images/irow_o_r.gif">
        </asp:ImageField>
        <asp:HyperLinkField DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="Article_List2.aspx?ID={0}" 
            DataTextField="SubName" />
    </Columns>
</asp:GridView>        
</div>
</div>
<p>&nbsp;</p>
<div class="box">
    <div style="padding:5px 5px;">    	    
    <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
        <tr valign="middle" ><td>
        <input id="Text2" type="text" 
                style="height: 24px; width: 200px; line-height:24px;font-size:16px;" />
        </td>
        <td width="60px" id="Td1" align="center"><img src="images/32/search_lense.png" width="26px" height="26px" alt="" /></td>
        </tr>
    </table>
    </div> 
</div>
<br />
<div style="padding:20px 0;">
  <img src="images/h/h1.jpg" width="240" height="60">
</div> 
<br />     
     
<div class="box">
	<h2 style="background-image:url(images/32/network24.png);"><a href="#">友情链接</a></h2>
<div>
<table width="100%" align="center">
<tr>
<td align="left"><p><a href="http://www.gdin.edu.cn" target="_blank">1、广东技术师范学院</a></p>
<p><a href="http://setc.gdin.edu.cn:9000/" target="_blank">2、数字传媒实验中心</a></p>
<p><a href="http://www.edu.cn" target="_blank">3、中国教育与科研计算机网</a></p>
<p><a href="http://www.gdhed.org.cn" target="_blank">4、广东省教育厅</a></p>
<p><a href="http://www.moe.gov.cn" target="_blank">5、中华人民共和国教育部</a></p>        
<p>&nbsp;</p>
</td>
</tr>
</table>
</div>
</div>
<div style="padding:20px 0;">
  <img src="images/h/h5.jpg" width="240" alt="" />
</div>       
<div class="box">
	<h2 style="background-image:url(images/32/network24.png);"><a href="#">联系我们</a></h2>
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
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" Runat="Server">
<br />
<asp:Label ID="ArticleID" runat="server" Text="Label" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="Index.aspx">网站首页</a> >> 
<asp:HyperLink ID="CategoryHyperLink" runat="server"></asp:HyperLink>
<asp:Label ID="SubLabel" runat="server" Text=""></asp:Label>
<asp:HyperLink ID="SubHyperLink" runat="server"></asp:HyperLink>
</div>
    
<p>&nbsp;</p>
<table width="99%" align="center">
    <tr><td align="center">
        <asp:Label ID="ArticleTitle" runat="server" Text="Label" Font-Bold="true" Font-Size="16"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
    </td></tr>
    <tr><td align="center"><br />
        作者：<asp:Label ID="TagName" runat="server" Text="Label"></asp:Label>--<asp:Label ID="Author" runat="server" Text="Label"></asp:Label>&nbsp;|&nbsp;
   日期：<asp:Label ID="CDT" runat="server" Text="Label"></asp:Label>&nbsp;|&nbsp;
   浏览次数：<asp:Label ID="ViewTimes" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;<asp:Label ID="ReviewTimes" runat="server" Text="Label" Visible="false" ></asp:Label>
    </td></tr>  
    <tr><td align="left"><br />
    <asp:Label ID="Content" runat="server" Text="Label" class="ArticleContent"></asp:Label>
    </td></tr>        
</table>
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
</asp:Content>

