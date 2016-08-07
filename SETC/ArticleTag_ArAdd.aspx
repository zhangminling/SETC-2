<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="ArticleTag_ArAdd.aspx.cs" Inherits="ArticleTag_ArAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div id="CurrentPosition">当前位置：<a href="#">文章标签 </a>>><a href="ArticleTag_Man.aspx">标签管理</a> >> <a href="#">更新标签文章</a></div>
    <p></p>
     <div class="row">
     <div class="col-lg-12 col-sm-12 col-xs-18"  >
                                    <div class="well with-header">
                                        <div class="header bordered-darkpink">添加标签文章>>当前文章标签为： <asp:Label ID="TagName" runat="server" Text=""></asp:Label>
     <asp:Label ID="ArticleID" runat="server" Text="" Visible="True"></asp:Label>
                                            <asp:Label ID="Label5" runat="server" Text="" Visible="True"></asp:Label>
     <asp:Label ID="TagID" runat="server" Text="" Visible="false"></asp:Label>
                                      <asp:Label ID="Label4" runat="server" Text="" Visible="True"></asp:Label>         
       <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>

                                        </div>
                                        
                                   
                                        <div class="row" >
                                          <div id="Man">
                                              <asp:CheckBoxList ID="TagsList" runat="server" RepeatDirection="Horizontal" style="margin-left:20px" RepeatLayout="Table" RepeatColumns="7" Width="90%"></asp:CheckBoxList>
                <div style="float:right">
<asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true" oncheckedchanged="SelectAllCheckBox_CheckedChanged"/>
&nbsp;&nbsp;<asp:Button ID="ArAddBtn" runat="server" Text="确认添加" class="btn btn-success tooltip-success" OnClick="ArAddBtn_Click"/></div>
                                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                       <ContentTemplate>
                                                                           
                                                                       <div id="Man_Nav"  >
    &nbsp;&nbsp;
    <asp:TextBox ID="SearchTB" runat="server" CssClass="TextBox"></asp:TextBox> &nbsp; 
    <asp:Button ID="SearchBtn" runat="server" Text="搜索" CssClass="Button" 
        onclick="SearchBtn_Click" />&nbsp;&nbsp;
    <asp:DropDownList ID="AuthorDDL" runat="server" 
        onselectedindexchanged="AuthorDDL_SelectedIndexChanged" 
        AutoPostBack="True">
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:DropDownList ID="CatsDDL" runat="server" 
        onselectedindexchanged="CatsDDL_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:DropDownList ID="SubsDDL" runat="server" AutoPostBack="True" 
        onselectedindexchanged="SubsDDL_SelectedIndexChanged1">
    </asp:DropDownList>
    &nbsp;&nbsp;
    <asp:DropDownList ID="OrderDDL" runat="server" 
        onselectedindexchanged="OrderDDL_SelectedIndexChanged" AutoPostBack="True">
        <asp:ListItem Value=" Order by Orders Desc,ID Desc">默认排序</asp:ListItem>
        <asp:ListItem Value=" Order by LDT Desc">最后更新</asp:ListItem>
        <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>        
        <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>
    </asp:DropDownList>
</div>
    <br />

   <div class="row" style="width:95%; margin:auto;">   
         <div class="widget-body">
<div>
总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>
条记录，每页显示：<asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true"  Font-Bold="true"
        onselectedindexchanged="PageSizeDDL_SelectedIndexChanged" ForeColor="#5D7B9D">          
<asp:ListItem Value="5">5</asp:ListItem>              
        <asp:ListItem Value="10">10</asp:ListItem>        
        <asp:ListItem Value="20" Selected="True">20</asp:ListItem>
    <asp:ListItem Value="50">50</asp:ListItem>      
    </asp:DropDownList> 条记录，
共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D"   Font-Bold="true"></asp:Label>页
 <asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</div>    
                                                                          
<br />

<div id="RightContent">  

<webdiyer:aspnetpager CssClass="pages"  class="pagination"  CurrentPageButtonClass="cpb"   AlwaysShow="true"
        ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" 
        NextPageText="下一页" PrevPageText="上一页" 
        onpagechanged="AspNetPager1_PageChanged" LayoutType="Div">
</webdiyer:aspnetpager> 
    <br />
<asp:GridView ID="GridView1" runat="server" DataKeyNames="ID"  AutoGenerateColumns="false"  class="table table-striped table-bordered table-hover" 
        GridLines="Horizontal"  style="text-align:center;" ForeColor="#333333" HeaderStyle-HorizontalAlign="Center">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Height="30px" HorizontalAlign="Center" />
    <HeaderStyle HorizontalAlign="Center" />
<Columns>
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
    <asp:HyperLinkField DataNavigateUrlFields="ID" 
            DataNavigateUrlFormatString="Article_View.aspx?ID={0}" DataTextField="Title" 
            HeaderText="标题" ItemStyle-Width="350" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" Target="_blank" >
    </asp:HyperLinkField>    
    <asp:BoundField DataField="SubName" HeaderText="二级分类" ItemStyle-Width="60"  />        
    <asp:BoundField DataField="Author" HeaderText="作者" ItemStyle-Width="40" />    
    <asp:BoundField DataField="ViewTimes" HeaderText="点击" ItemStyle-Width="30" />                                   
    </Columns>

</asp:GridView>
<br />
</div>
             </div></div>
                                                                           
                                                                       </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                              








</div> 

                                        </div> 


   </div>
 </div>  
  </div>
     

</asp:Content>

