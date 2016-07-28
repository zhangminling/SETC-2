<%@ Page Title="" Language="C#" MasterPageFile="~/Master2Col.master" AutoEventWireup="true" CodeFile="Article_List.aspx.cs" Inherits="Article_List" %>
<%@ Register TagPrefix="UserControl" TagName="UC_Article_List" Src="~/UC_Article_List.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderSideBar" Runat="Server">
<style type="text/css">
.Cat
{        
    padding-left:0px;
    padding-bottom:2px;
	margin-bottom:5px;
	margin-top:5px;
	border-bottom:2px solid #04377c;
	
}
.Cat H3
{
    height:24px;
	line-height:24px;
	color:#04377c;
	text-indent:20px;	
	background-image:url(images/vbar_blue.png);
	background-repeat:no-repeat;
}
</style>

<div style="padding-bottom:20px; padding-top:2px;">
   <asp:Image ID="Image1" runat="server" width="240" height="60" />
</div>   
<div class="box">
        	<h2 style="background-image:url(images/32/time_clock24.png);">
                <asp:Label ID="CategoryLabel" runat="server" Text="Label"></asp:Label>
            </h2>
            <div style="DivInBox">            
            <p class="indent24"><asp:Label ID="DescriptionLabel" runat="server" Text="Label"></asp:Label></p>
            <asp:GridView ID="GridView2" runat="server" Width="100%" ShowHeader="false" AutoGenerateColumns="false" RowStyle-Height="26" GridLines="None">
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
          <img src="images/h/h3.jpg" width="240" alt="" />
        </div>       
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
<!-- 当前位置 -->
<asp:Label ID="CategoryIDLabel" runat="server" Text="Label" Visible="false"></asp:Label>
<div id="CurrentPosition">当前位置：<a href="Index.aspx">网站首页</a> >> 
<asp:HyperLink ID="CategoryHyperLink" runat="server"></asp:HyperLink>
</div>

<!-- 显示主栏目列表 -->
<asp:Panel ID="Panel1" runat="server">    
    <asp:GridView ID="GridView1" DataKeyNames="ID" runat="server" AutoGenerateColumns="false" Width="99%" RowStyle-Height="30" ShowHeader="false">
    <Columns>
        <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="60px" HorizontalAlign="center"/>        
        </asp:TemplateField>
        <asp:HyperLinkField DataNavigateUrlFields="ID,Title" 
            DataNavigateUrlFormatString="Article_View.aspx?ID={0}&T={1}" DataTextField="Title" 
            HeaderText="标题"  ItemStyle-HorizontalAlign="Left"  >
        </asp:HyperLinkField> 
        <asp:BoundField DataField="Author" HeaderText="作者" ItemStyle-Width="60" Visible="false" />        
        <asp:BoundField DataField="CDT" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Left"  />
        <asp:BoundField DataField="ViewTimes" DataFormatString="{0}"  HeaderText="浏览" ItemStyle-Width="30" Visible="false" />                        
    </Columns>
    </asp:GridView>
    <br />
<webdiyer:aspnetpager CssClass="paginator" CurrentPageButtonClass="cpb"   AlwaysShow="true"
        ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" 
        NextPageText="下一页" PrevPageText="上一页" 
        onpagechanged="AspNetPager1_PageChanged" LayoutType="Div">
</webdiyer:aspnetpager>
<p>&nbsp;</p>
<div id="PageDiv" runat="server">
总共：<asp:Label ID="RecordCountLabel" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>
条记录，每页显示：<asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true"  Font-Bold="true"
        onselectedindexchanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">          
<asp:ListItem Value="2">2</asp:ListItem>              
        <asp:ListItem Value="10">10</asp:ListItem>        
        <asp:ListItem Value="20">20</asp:ListItem>
        <asp:ListItem Value="50" Selected="True">50</asp:ListItem> 
        <asp:ListItem Value="100">100</asp:ListItem>         
        <asp:ListItem Value="200">200</asp:ListItem>         
        <asp:ListItem Value="500">500</asp:ListItem>         
    </asp:DropDownList> 条记录，
共<asp:Label ID="TotalPagesLabel" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>页
</div><br />
</asp:Panel>

<!-- 显示子栏目列表 -->
<asp:Panel ID="Panel2" runat="server">
<asp:Repeater ID="Repeater1" runat="server" >
    <ItemTemplate>    
    <div class="Cat">
	  <h3><a href='Article_List2.aspx?ID=<%# Eval("ID") %>'><%# Eval("SubName") %></a></h3>
	</div>    
    <div><UserControl:UC_Article_List ID="UC_Article_List1"  runat="server" SubID=<%# Eval("ID") %> /></div>
    <div style="float:right;height:30px;line-height:30px;"><a href='Article_List2.aspx?ID=<%# Eval("ID") %>'>更多 >> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>    
    <p>&nbsp;<br />&nbsp;</p>
    <!-- <img src="images/random/H1.jpg" /> -->    
    </ItemTemplate>
</asp:Repeater>	
</asp:Panel>
</asp:Content>

