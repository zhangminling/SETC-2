<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ArticleTag_Man.aspx.cs" Inherits="ArticleTag_Man" %>

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
        <div id="CurrentPosition">当前位置：<a href="#">文章标签</a> >> <a href="ArticleTag_Man.aspx">标签管理</a></div>
    <p></p> 
   

                                    <div class="well with-header">
                                         <div class="header bordered-blueberry">文章标签</div>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                        <div class="row" >
                                          <div id="Man_Nav">
    &nbsp;&nbsp;
    <asp:TextBox ID="SearchTB" runat="server" ></asp:TextBox> &nbsp; 
    <asp:Button ID="SearchBtn" runat="server" Text="搜索" class="btn btn-sky" 
        onclick="SearchBtn_Click" />&nbsp;&nbsp;
       <asp:DropDownList ID="OrderDDL" runat="server" 
        onselectedindexchanged="OrderDDL_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem Value=" Order by ID Desc">默认排序</asp:ListItem>
        <asp:ListItem Value=" Order by Articles Desc">热门标签</asp:ListItem>
        <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>        
    </asp:DropDownList>
    &nbsp;&nbsp;
    &nbsp;&nbsp;
    &nbsp;&nbsp;

</div><br />
<div>
    &nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="UpdateBtn" runat="server" Text="修改标签信息" class="btn btn-darkorange active" 
        onclick="UpdateBtn_Click" /> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DelAr" runat="server" Text="删除关联文章" class="btn btn-darkorange active" OnClick="DelAr_Click" 
        /> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AddAr" runat="server" Text="增加关联文章" class="btn btn-darkorange active" OnClick="AddAr_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="DelBtn" runat="server" Text="删除" class="btn btn-success tooltip-success" 
        onclick="DelBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
</div>
<p>&nbsp;</p>
                                            
 <div class="row" style="width:95%; margin:auto;">   
         <div class="widget-body">
<div>
总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>
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
共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>页

</div>
                                            <br />
     <div style="float:left;">                                 
 <asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true" oncheckedchanged="SelectAllCheckBox_CheckedChanged"/>
&nbsp;&nbsp;</div>    
            
                                            <div>
<webdiyer:aspnetpager CssClass="pages"  class="pagination" CurrentPageButtonClass="cpb"   AlwaysShow="true"
        ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" 
        NextPageText="下一页" PrevPageText="上一页" 
        onpagechanged="AspNetPager1_PageChanged" LayoutType="Div">
</webdiyer:aspnetpager></div>
<div id="RightContent" >   

<asp:GridView ID="GridView1" runat="server" DataKeyNames="ID"  AutoGenerateColumns="false"  class="table table-striped table-bordered table-hover" 
        GridLines="Horizontal"  style="text-align:center;" ForeColor="#333333" HeaderStyle-HorizontalAlign="Center" Width="99%"  >
<Columns >
    <asp:BoundField DataField="Orders" HeaderText="排序" ItemStyle-Width="30" Visible="false" /> 
    <asp:TemplateField HeaderText="序" HeaderStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
        </ItemTemplate>
        <ItemStyle Width="30px" HorizontalAlign="center"/>
        <HeaderStyle Width="30px" />
    </asp:TemplateField>
    <asp:TemplateField>
    <ItemTemplate>
    <asp:CheckBox ID="ChechBox1" runat="server" />    
    </ItemTemplate>
    <ItemStyle Width="30px" HorizontalAlign="Left" />
    </asp:TemplateField> 
        <asp:BoundField DataField="TagName" HeaderText="文章标签名" ItemStyle-Width="80" />    
  
    <asp:BoundField DataField="Description" HeaderText="标签描述" ItemStyle-Width="200" />    
     <asp:BoundField DataField="Articles" HeaderText="文章数" ItemStyle-Width="80" />  
    <asp:BoundField DataField="UserName" HeaderText="创建者" ItemStyle-Width="30" />                              
    </Columns>
</asp:GridView>
<br />
</div>         </div>
                                        </div>

                                </div>
</ContentTemplate>
                                        </asp:UpdatePanel>
                
        </div>
        
</asp:Content>

