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
        	<h2 style="background-image:url(images/32/network24.png);"><a href="#">������</a></h2>
            <div>
            <p class="strong"><a href="#">��������ѧ���㶫ʡ�ۺϽ�ѧ�ĸ��Ե���Ŀ</a></p>
            <p class="strong"><a href="#">���ִ�ýʵ�����ġ��㶫ʡʵ���ѧʾ������</a></p>
            <p class="strong"><a href="#">��ʦ��Ƶ����ѧ��Ӱ������ʵ������</a></p>            
            <br />
            </div>
        </div>
        <div style="padding:20px 0;">
          <img src="images/h/h3.jpg" width="240" alt="" />
        </div>       
    	<div class="box">
        	<h2 style="background-image:url(images/32/network24.png);"><a href="#">��������</a></h2>
        <div>
        <table width="100%" align="center">
        <tr>
        <td align="left"><p><a href="http://www.gdin.edu.cn" target="_blank">1���㶫����ʦ��ѧԺ</a></p>
        <p><a href="http://setc.gdin.edu.cn:9000/" target="_blank">2�����ִ�ýʵ������</a></p>
        <p><a href="http://www.edu.cn" target="_blank">3���й���������м������</a></p>
        <p><a href="http://www.gdhed.org.cn" target="_blank">4���㶫ʡ������</a></p>
        <p><a href="http://www.moe.gov.cn" target="_blank">5���л����񹲺͹�������</a></p>        
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
        	<h2 style="background-image:url(images/32/network24.png);"><a href="#">��ϵ����</a></h2>
            <div>
            <p class="strong">���������봫��ѧԺ</p>
            <p class="strong">������������</p>
            <p>��ַ���������������ɽ�����293��ʵ��¥505</p>
            <p>�ʱࣺ510665</p>
            <p>�绰��020-38256633</p>
            <p>���䣺21646523@QQ.com</p>
            <br />
            </div>
        </div>
        <p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" Runat="Server">
<br />
<!-- ��ǰλ�� -->
<asp:Label ID="CategoryIDLabel" runat="server" Text="Label" Visible="false"></asp:Label>
<div id="CurrentPosition">��ǰλ�ã�<a href="Index.aspx">��վ��ҳ</a> >> 
<asp:HyperLink ID="CategoryHyperLink" runat="server"></asp:HyperLink>
</div>

<!-- ��ʾ����Ŀ�б� -->
<asp:Panel ID="Panel1" runat="server">    
    <asp:GridView ID="GridView1" DataKeyNames="ID" runat="server" AutoGenerateColumns="false" Width="99%" RowStyle-Height="30" ShowHeader="false">
    <Columns>
        <asp:TemplateField HeaderText="��" HeaderStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="60px" HorizontalAlign="center"/>        
        </asp:TemplateField>
        <asp:HyperLinkField DataNavigateUrlFields="ID,Title" 
            DataNavigateUrlFormatString="Article_View.aspx?ID={0}&T={1}" DataTextField="Title" 
            HeaderText="����"  ItemStyle-HorizontalAlign="Left"  >
        </asp:HyperLinkField> 
        <asp:BoundField DataField="Author" HeaderText="����" ItemStyle-Width="60" Visible="True" />        
        <asp:BoundField DataField="CDT" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-Width="80" ItemStyle-HorizontalAlign="Left"  />
        <asp:BoundField DataField="ViewTimes" DataFormatString="{0}"  HeaderText="���" ItemStyle-Width="30" Visible="True" />                        
    </Columns>
    </asp:GridView>
    <br />
<webdiyer:aspnetpager CssClass="paginator" CurrentPageButtonClass="cpb"   AlwaysShow="true"
        ID="AspNetPager1" runat="server" FirstPageText="��ҳ" LastPageText="βҳ" 
        NextPageText="��һҳ" PrevPageText="��һҳ" 
        onpagechanged="AspNetPager1_PageChanged" LayoutType="Div">
</webdiyer:aspnetpager>
<p>&nbsp;</p>
<div id="PageDiv" runat="server">
�ܹ���<asp:Label ID="RecordCountLabel" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>
����¼��ÿҳ��ʾ��<asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true"  Font-Bold="true"
        onselectedindexchanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">          
<asp:ListItem Value="2">2</asp:ListItem>              
        <asp:ListItem Value="10">10</asp:ListItem>        
        <asp:ListItem Value="20">20</asp:ListItem>
        <asp:ListItem Value="50" Selected="True">50</asp:ListItem> 
        <asp:ListItem Value="100">100</asp:ListItem>         
        <asp:ListItem Value="200">200</asp:ListItem>         
        <asp:ListItem Value="500">500</asp:ListItem>         
    </asp:DropDownList> ����¼��
��<asp:Label ID="TotalPagesLabel" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>ҳ
</div><br />
</asp:Panel>

<!-- ��ʾ����Ŀ�б� -->
<asp:Panel ID="Panel2" runat="server">
<asp:Repeater ID="Repeater1" runat="server" >
    <ItemTemplate>    
    <div class="Cat">
	  <h3><a href='Article_List2.aspx?ID=<%# Eval("ID") %>'><%# Eval("SubName") %></a></h3>
	</div>    
    <div><UserControl:UC_Article_List ID="UC_Article_List1"  runat="server" SubID=<%# Eval("ID") %> /></div>
    <div style="float:right;height:30px;line-height:30px;"><a href='Article_List2.aspx?ID=<%# Eval("ID") %>'>���� >> </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>    
    <p>&nbsp;<br />&nbsp;</p>
    <!-- <img src="images/random/H1.jpg" /> -->    
    </ItemTemplate>
</asp:Repeater>	
</asp:Panel>
</asp:Content>

