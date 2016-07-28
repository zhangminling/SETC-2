<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="Focus">
    <div id="Slider">
        <asp:Repeater ID="Repeater1" runat="server">    
        <ItemTemplate><a href='<%# Eval("LinkURL") %>'><asp:Image ID="SliderImage1" runat="server" ImageUrl='<%# Eval("PhotoSrc") %>' AlternateText='<%# Eval("PhotoTitle") %>' /></a></ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="SliderButton">
        <a id="PreBtn" href="###"><img src="images/SliderPre.jpg" width="28px" height="28px" alt="" /></a>
        <a id="NextBtn" href="###"><img src="images/SliderNext.jpg" width="28px" height="28px" alt="" /></a>
    </div>  
</div>

<div class="clear"></div>
<table width="1000" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
  <tr valign="top">
    <td width="24">&nbsp;</td>
    <td width="330" valign="top" align="left">
    	<div style="height:19px;">&nbsp;</div> 
    	<div class="box">
        	<h2 style="background-image:url(images/32/time_clock24.png);"><a href="Article_List2.aspx?ID=6">教师通知</a></h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false" Width="100%">
            <Columns>
            <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="20px" HorizontalAlign="left"/>        
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ID,Title" 
                DataNavigateUrlFormatString="Article_View.aspx?ID={0}&T={1}" DataTextField="Title" 
                HeaderText="标题"  ItemStyle-HorizontalAlign="Left"  >
            </asp:HyperLinkField>                  
            <asp:BoundField DataField="CDT" HeaderText="创建日期" DataFormatString="{0:MM-dd}" ItemStyle-Width="40" ItemStyle-HorizontalAlign="Left"  />
            </Columns>
        </asp:GridView>
        <div><p><a href="Article_List2.aspx?ID=6">更多 >></a></p></div>
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
        	<h2 style="background-image:url(images/32/options24.png);"><a href="Article_List2.aspx?ID=7">学生通知</a></h2>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" ShowHeader="false" Width="100%">
            <Columns>
            <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="20px" HorizontalAlign="left"/>        
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ID,Title" 
                DataNavigateUrlFormatString="Article_View.aspx?ID={0}&T={1}" DataTextField="Title" 
                HeaderText="标题"  ItemStyle-HorizontalAlign="Left"  >
            </asp:HyperLinkField>                  
            <asp:BoundField DataField="CDT" HeaderText="创建日期" DataFormatString="{0:MM-dd}" ItemStyle-Width="40" ItemStyle-HorizontalAlign="Left"  />
            </Columns>
        </asp:GridView>
        <div><p><a href="Article_List2.aspx?ID=7">更多 >></a></p></div>
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
		<td align="left"><p><a href="http://www.gdin.edu.cn" target="_blank">1、广东技术师范学院</a></p>
		<p><a href="http://lib.gdin.edu.cn" target="_blank">2、广东技术师范学院图书馆</a></p>
		<p><a href="http://setc.gdin.edu.cn:9000/" target="_blank">3、数字传媒实验中心</a></p>
		<p><a href="http://202.192.72.58:8081/gstv/" target="_blank">4、广师视频</a></p>
		<p><a href="http://www.edu.cn" target="_blank">5、中国教育与科研计算机网</a></p>
		<p><a href="http://www.gdhed.edu.cn" target="_blank">6、广东省教育厅</a></p>
		<p><a href="http://www.moe.gov.cn/" target="_blank">7、中华人民共和国教育部</a></p>
		<p><a href="http://202.192.72.100:8888/cbxy/" target="_blank">8、学生综合测评系统</a></p>
		<p><a href="http://www2.gdin.edu.cn/jyjsx/" target="_blank">9、传播学院旧版网站</a></p>  
		<p><a href="http://setc.gdin.edu.cn:8080/WebDesign201509/" target="_blank">10、201509网页设计课程网站</a></p>       
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
            <p class="strong">教育技术中心</p>
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
        	<h2 style="background-image:url(images/32/rss.png);"><span><a href="Article_List2.aspx?ID=5">更多>></a></span><a href="Article_List2.aspx?ID=5">学院动态</a></h2>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" ShowHeader="false" Width="100%">
            <Columns>
            <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="20px" HorizontalAlign="left"/>        
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ID,Title" 
                DataNavigateUrlFormatString="Article_View.aspx?ID={0}&T={1}" DataTextField="Title" 
                HeaderText="标题"  ItemStyle-HorizontalAlign="Left"  >
            </asp:HyperLinkField>                  
            <asp:BoundField DataField="CDT" HeaderText="创建日期" DataFormatString="{0:MM-dd}" ItemStyle-Width="40" ItemStyle-HorizontalAlign="Left"  />
            </Columns>
        </asp:GridView>    
        </div>
         <div style="padding:20px 0; text-align:center;">
          <img src="images/header-jason2.jpg" width="600" alt="" />
        </div>
        <div class="listContainer">
        	<h2 style="background-image:url(images/32/record.png);"><span><a href="Article_List2.aspx?ID=39">更多>></a></span><a href="Article_List2.aspx?ID=5">活动剪影</a></h2>
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" ShowHeader="false" Width="100%">
            <Columns>
            <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="20px" HorizontalAlign="left"/>        
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="ID,Title" 
                DataNavigateUrlFormatString="Article_View.aspx?ID={0}&T={1}" DataTextField="Title" 
                HeaderText="标题"  ItemStyle-HorizontalAlign="Left"  >
            </asp:HyperLinkField>                  
            <asp:BoundField DataField="CDT" HeaderText="创建日期" DataFormatString="{0:MM-dd}" ItemStyle-Width="40" ItemStyle-HorizontalAlign="Left"  />
            </Columns>
        </asp:GridView>    
        </div>  
        <div style="padding:20px 0; text-align:center;">
                <img src="images/toystory2.jpg" width="600" alt="" />
            </div> 
        <div class="listContainer">
        	<h2 style="background-image:url(images/32/forward.png);"><span><a href="Show_List.aspx">更多>></a></span><a href="#">作品展示</a></h2>
        	<asp:GridView ID="GridView4" runat="server" Width="100%" AutoGenerateColumns="false" CellSpacing="0" CellPadding="4" CssClass="showList">
        	<Columns>
        	    <asp:TemplateField ItemStyle-Width="340px" ItemStyle-HorizontalAlign="Center"  ItemStyle-VerticalAlign="Top">
        	        <ItemTemplate>
        	            <a href='Show_View.aspx?ID=<%# Eval("ID") %>&c=<%# Eval("Catalog") %>&T=<%# Eval("Title") %>'><img src='<%# Eval("CoverPhotoURL") %>' width="320px" alt="" /></a>
        	            <p>&nbsp;</p>
        	        </ItemTemplate>        	        
        	    </asp:TemplateField>
        	    <asp:TemplateField ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Left">
        	        <ItemTemplate>
        	        <h3><a href='Show_View.aspx?ID=<%# Eval("ID") %>&c=<%# Eval("Catalog") %>&T=<%# Eval("Title") %>'><%# Eval("Title") %></a></h3>
                    <p class="author"><a href="#"><%# Eval("Author") %></a> | <%# String.Format("{0:yyyy-MM-dd}",Eval("CDT") ) %></p>
                    <p><%# Eval("Abs") %></p>
                    <p class="read"><a href='Show_View.aspx?ID=<%# Eval("ID") %>&c=<%# Eval("Catalog") %>'>阅读>></a></p>
        	        </ItemTemplate>
        	    </asp:TemplateField>
        	</Columns>
        	</asp:GridView>            
        </div>
    </td>    
  </tr> 
</table>
<script type="text/javascript">
    $(function() {
        var viewWidth = $("#Focus").width(); //每一张图片的宽度
        var sliderLength = $("#Slider a").length; //总的图片数
        $("#Slider").css("width", sliderLength * 1000 + "px");
        var sliderIndex = 0; //当前图片的下标
        var nextSlider = function() {
            if (!$("#Slider").is(":animated")) {
                if (sliderLength == sliderIndex + 1) {
                    $("#Slider").animate({ left: '0px' }, "slow");
                    sliderIndex = 0;
                } else {
                    $("#Slider").animate({ left: '-=' + viewWidth }, "slow");
                    sliderIndex += 1;
                }
            }
        }
        var preSlider = function() {
            if (!$("#Slider").is(":animated")) {
                if (sliderIndex == 0) {
                    $("#Slider").animate({ left: -viewWidth * (sliderLength - 1) }, "slow");
                    sliderIndex = sliderLength - 1;
                } else {
                    $("#Slider").animate({ left: '+=' + viewWidth }, "slow");
                    sliderIndex -= 1;
                }
            }
        }
        $("#NextBtn").click(nextSlider);
        $("#PreBtn").click(preSlider);
        var rotator = setInterval(nextSlider, 4000);
        $("#Focus").hover(function() { clearInterval(rotator); }, function() { rotator = setInterval(nextSlider, 4000); });
    });
</script>
</asp:Content>

