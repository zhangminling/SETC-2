<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SETC.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div style="margin-top:35px; width:1000px; height:310px;">
    <!-- Slider Begin -->
        <div id="photoGallery">
            <div id="photoShow">
                <p id="photoCaptionBg">&nbsp;</p>
                <p id="photoCaptionText">采访张敬轩</p>
                <div class="current">
                    <a href="#">
                        <img src="images/newslider/slide2-1.jpg" alt="Photo Gallery" width="1000" height="300" /></a>
                </div>
                <div>
                    <a href="#">
                        <img src="images/newslider/slide2-2.jpg" alt="Photo Gallery" width="1000" height="300" /></a>
                </div>
                <div>
                    <a href="#">
                        <img src="images/newslider/slide2-3.jpg" alt="Photo Gallery" width="1000" height="300" /></a>
                </div> 
                <div>
                    <a href="#">
                        <img src="images/newslider/slide2-4.jpg" alt="Photo Gallery" width="1000" height="300" /></a>
                </div>              
            </div>
        </div>
        <!-- Slider End -->
  </div>
  <div class="clear"></div>
<table width="1000" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
  <tr valign="top">
    <td width="24">&nbsp;</td>
    <td width="330" valign="top" align="left">
    	<div style="height:19px;">&nbsp;</div>    	
    	<!-- <div class="box">
    	    <div style="padding:5px 5px;">    	    
    	    <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
    	        <tr valign="middle" ><td>
    	        <input id="Text1" type="text" 
                        style="height: 24px; width: 260px; line-height:24px;font-size:16px;" />
    	        </td>
    	        <td width="60px" id="SearchImg" align="center"><img src="images/32/search_lense.png" width="26px" height="26px" alt="" /></td>
    	        </tr>
    	    </table>
    	    </div> 
    	</div>
    	<br />
    	-->        
    	<div class="box">
        	<h2 style="background-image:url(images/32/time_clock24.png);"><a href="#">教师通知</a></h2>
        <div>
        <table width="100%" align="center">
		<tr>
		  <td align="left"><p><a href="#">1、非常实用的网站，学到了很多知识！</a></p>
		<p><a href="#">2、网站美工很不错，顶，向你学习！</a></p>
		<p><a href="#">3、不错，继续努力，提供的资料很齐全！谢！</a></p>
		<p><a href="#">4、没有最好只有更好，希望还有更好的设计。</a></p>
        <p><a href="#">5、没有最好只有更好，希望还有更好的设计。</a></p>
        <p><a href="#">6、没有最好只有更好，希望还有更好的设计。</a></p>
        <p><a href="#">7、没有最好只有更好，希望还有更好的设计。</a></p>
        <p><a href="#">8、没有最好只有更好，希望还有更好的设计。</a></p>        
        <p><a href="#" class="more">更多 >></a></p>
        <p>&nbsp;</p>
        </td>
		</tr>
		</table>
            </div>
        </div>
        
        <p>&nbsp;</p>
        <div class="box">
    	    <div style="padding:5px 5px;">    	    
    	    <table width="100%"  border="0" cellspacing="0" cellpadding="0" >
    	        <tr valign="middle" ><td>
    	        <input id="Text2" type="text" 
                        style="height: 24px; width: 260px; line-height:24px;font-size:16px;" />
    	        </td>
    	        <td width="60px" id="Td1" align="center"><img src="images/32/search_lense.png" width="26px" height="26px" alt="" /></td>
    	        </tr>
    	    </table>
    	    </div> 
    	</div>
    	<br />
    	
        <div style="padding:20px 0;">
          <img src="images/h/h1.jpg" width="312" height="60">
        </div>       
    	<div class="box">
        	<h2 style="background-image:url(images/32/options24.png);"><a href="#">学生通知</a></h2>
        <div>
        <table width="100%" align="center">
		<tr>
		  <td align="left"><p><a href="#">1、非常实用的网站，学到了很多知识！</a></p>
		<p><a href="#">2、网站美工很不错，顶，向你学习！</a></p>
		<p><a href="#">3、不错，继续努力，提供的资料很齐全！谢！</a></p>
		<p><a href="#">4、没有最好只有更好，希望还有更好的设计。</a></p>
        <p><a href="#">5、没有最好只有更好，希望还有更好的设计。</a></p>
        <p><a href="#">6、没有最好只有更好，希望还有更好的设计。</a></p>
        <p><a href="#">7、没有最好只有更好，希望还有更好的设计。</a></p>
        <p><a href="#">8、没有最好只有更好，希望还有更好的设计。</a></p>        
        <p><a href="#" class="more">更多 >></a></p>
        <p>&nbsp;</p>
        </td>
		</tr>
		</table>
            </div>
        </div>
        <div style="padding:20px 0;">
          <img src="images/h/h2.jpg" width="312" height="60" alt="" />
        </div>       
    	<div class="box">
        	<h2 style="background-image:url(images/32/network24.png);"><a href="#">荣誉榜</a></h2>
            <div>
            <p class="strong"><a href="#">教育技术学—广东省综合教学改革试点项目</a></p>
            <p class="strong"><a href="#">数字传媒实验中心—广东省实验教学示范中心</a></p>
            <p class="strong"><a href="#">广师视频—大学生影视制作实践基地</a></p>            
            <br />
            </div>
        </div>
        <div style="padding:20px 0;">
          <img src="images/h/h3.jpg" width="312" height="60" alt="" />
        </div>       
    	<div class="box">
        	<h2 style="background-image:url(images/32/network24.png);"><a href="#">友情链接</a></h2>
        <div>
        <table width="100%" align="center">
		<tr>
		<td align="left"><p><a href="#">1、广东技术师范学院</a></p>
		<p><a href="#">2、数字传媒实验中心</a></p>
		<p><a href="#">3、广师视频</a></p>
		<p><a href="#">4、中国教育与科研计算机网</a></p>
		<p><a href="#">5、广东省教育厅</a></p>
		<p><a href="#">6、中国教育部</a></p>        
        <p>&nbsp;</p>
        </td>
		</tr>
		</table>
            </div>
        </div>
        <div style="padding:20px 0;">
          <img src="images/h/h5.jpg" width="312" height="60" alt="" />
        </div>       
    	<div class="box">
        	<h2 style="background-image:url(images/32/network24.png);"><a href="#">联系我们</a></h2>
            <div>
            <p class="strong">教育技术与传播学院</p>
            <p class="strong">现代教育技术中心</p>
            <p>地址：广州市天河区中山大道西293号实验楼505</p>
            <p>邮编：510665</p>
            <p>电话：020-38256633</p>
            <p>邮箱：21646523@QQ.com</p>
            <br />
            </div>
        </div>
        <p>&nbsp;</p>
    </td>      
    <td width="650">
        <div class="clear">&nbsp;</div>
        <div class="listContainer">
        	<h2 style="background-image:url(images/32/rss.png);"><span><a href="#">更多>></a></span><a href="#">学院新闻</a></h2>
            <table width="100%" border="0" cellspacing="0" cellpadding="4">
              <tr>
                <td>1、</td>
                <td><a href="#">非常实用的网站，学到了很多知识！</a></td>
                <td width="80">2012-12-12</td>
              </tr>
              <tr>
                <td>2、</td>
                <td><a href="#">网站美工很不错，顶，向你学习！</a></td>
                <td>2012-11-12</td>
              </tr>
              <tr>
                <td>3、</td>
                <td><a href="#">不错，继续努力，提供的资料很齐全！谢谢！</a></td>
                <td>2012-9-1</td>
              </tr>
              <tr>
                <td>4、</td>
                <td><a href="#">没有最好只有更好，希望还有更出色的网站。</a></td>
                <td>2012-8-12</td>
              </tr>
              <tr>
                <td>5、</td>
                <td><a href="#">没有最好只有更好，希望还有更出色的网站。</a></td>
                <td>2012-7-9</td>
              </tr>
              <tr>
                <td>6、</td>
                <td><a href="#">没有最好只有更好，希望还有更出色的网站。</a></td>
                <td>2012-6-6</td>
              </tr>
              <tr>
                <td>7、</td>
                <td><a href="#">没有最好只有更好，希望还有更出色的网站。</a></td>
                <td>2012-5-1</td>
              </tr>
              <tr>
                <td>8、</td>
                <td><a href="#">没有最好只有更好，希望还有更出色的网站。</a></td>
                <td>2012-12-30</td>
              </tr>
            </table>
        </div>
         <div style="padding:20px 0; text-align:center;">
          <img src="images/header-jason2.jpg" width="600" alt="" />
        </div>  
        <div class="listContainer">
        	<h2 style="background-image:url(images/32/forward.png);"><span><a href="#">更多>></a></span><a href="#">作品展示</a></h2>
            <table width="100%" border="0" cellspacing="0" cellpadding="4" class="showList">
              <tr valign="top">
                <td width="340" height="180">
                    <a href="#"><img src="images/show1.jpg" width="320" /></a>
                </td>
                <td>
                <h3><a href="#">2009年12月完成管理学院网站</a></h3>
                <p class="author"><a href="#">Admin</a> | 2009-12-02</p>
                <p>管理学院网站在设计上，大量运用背景、渐变和阴影等多种效果，营造了富有现代气息、立体感明显的学院网站。</p>
                <p class="read"><a href="#">阅读>></a></p>
                </td>
              </tr>
              <tr>
                <td width="330" height="180">
                    <a href="#"><img src="images/show5.jpg" width="320" /></a>
                </td>
                <td width="330" height="180">
                <h3><a href="#">2009年12月完成管理学院网站</a></h3>
                <p class="author"><a href="#">管理员</a> | 2009-12-02</p>
                <p>管理学院网站在设计上，大量运用背景、渐变和阴影等多种效果，营造了富有现代气息、立体感明显的学院网站。</p>
                <p class="read"><a href="#">阅读>></a></p>
                </td>
              </tr>
              <tr>
                <td width="330" height="180">
                    <a href="#"><img src="images/show3.jpg" width="320" /></a>
                </td>
                <td>
                <h3><a href="#">2009年12月完成管理学院网站</a></h3>
                <p class="author"><a href="#">Admin</a> | 2009-12-02</p>
                <p>管理学院网站在设计上，大量运用背景、渐变和阴影等多种效果，营造了富有现代气息、立体感明显的学院网站。</p>
                <p class="read"><a href="#">阅读>></a></p>
                </td>
              </tr>
              <tr>
                <td width="330" height="180">
                    <a href="#"><img src="images/show4.jpg" width="320" /></a>
                </td>
                <td>
                <h3><a href="#">2009年12月完成管理学院网站</a></h3>
                <p class="author"><a href="#">Admin</a> | 2009-12-02</p>
                <p>管理学院网站在设计上，大量运用背景、渐变和阴影等多种效果，营造了富有现代气息、立体感明显的学院网站。</p>
                <p class="read"><a href="#">阅读>></a></p>
                </td>
              </tr>
            </table>
            <div style="padding:20px 0; text-align:center;">
                <img src="images/toystory2.jpg" width="600" alt="" />
            </div> 
        </div>
    </td>    
  </tr> 
</table>
</asp:Content>
