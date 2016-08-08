<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Tags_Man.aspx.cs" Inherits="Tags_Man" %>

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
      <div id="CurrentPosition">当前位置：<a href="Tags_Man.aspx">标签管理</a></div>
    <div class="page-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">管理标签</span>
                                 
                                </div>
                                <div class="widget-body">

                                     <div>
        总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
        条记录，每页显示：
        <asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true"  OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged"  ForeColor="#5D7B9D">
            <asp:ListItem Value="2" >2</asp:ListItem>
            <asp:ListItem Value="5" Selected="True">5</asp:ListItem>
            <asp:ListItem Value="10" >10</asp:ListItem>
            <asp:ListItem Value="15">15</asp:ListItem>
            <asp:ListItem Value="20">20</asp:ListItem>
            <asp:ListItem Value="25">25</asp:ListItem>
            <asp:ListItem Value="30">30</asp:ListItem>
        </asp:DropDownList>
        条记录， 共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>页。
        <asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <br />
  
                                    <div class="widget-body bordered-top bordered-sky">
                                        
                                             
                                       <div class="form-group">
                                                        <span class="input-icon">
                                                            <asp:TextBox ID="SearchTB" runat="server" placeholder="查询标签名" class="form-control input-sm"></asp:TextBox>
                                                            <i class="glyphicon glyphicon-search danger circular"></i>

                                                        </span>


                                           </div>
        <asp:Button ID="SearchBtn" runat="server" Text="搜索"  class="btn btn-sky" OnClick="SearchBtn_Click"  />&nbsp;&nbsp;

       
   
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 "  oncheckedchanged="SelectAllCheckBox_CheckedChanged"  AutoPostBack="true" />&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="UpdateBtn" runat="server" Text="修改" class="btn btn-blue active" OnClick="UpdateBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DelBtn" runat="server" Text="删除" class="btn btn-darkorange active" OnClick="DelBtn_Click"  />&nbsp;&nbsp;&nbsp;&nbsp;
   
    
                                        
        <div style="height:32px;line-height:32px; float:right;">排序：
          <asp:DropDownList ID="OrderDDL" runat="server"  OnSelectedIndexChanged="OrderDDL_SelectedIndexChanged"
            AutoPostBack="True">
            <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>
            <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>
        </asp:DropDownList>
</div>       
    <div id="margin">
      <asp:GridView ID="GridView1" Width="100%" runat="server" 
        AutoGenerateColumns="False"   class="table table-striped table-bordered table-hover" 
        GridLines="Horizontal"  style="text-align:center;" HeaderStyle-HorizontalAlign="Center"  >    
    <Columns >
        <asp:TemplateField HeaderText="序" >
            <ItemTemplate >
                <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Width="30px" HorizontalAlign="center"/>
            <HeaderStyle Width="30px" />
        </asp:TemplateField>
          <asp:TemplateField>
    <ItemTemplate>
    <asp:CheckBox ID="ChechBox1" runat="server" />    
    </ItemTemplate>
    <ItemStyle Width="20px" HorizontalAlign="Left" />
    </asp:TemplateField>          
         <asp:HyperLinkField DataNavigateUrlFields="ID" 
             DataNavigateUrlFormatString="Tag_Edit.aspx?ID={0}" DataTextField="TagName" 
            HeaderText="标签名"  Target="_blank"   ItemStyle-Width="80">
    </asp:HyperLinkField>  
          <asp:BoundField DataField="Description" HeaderText="标签描述"  ItemStyle-Width="150" >
<ItemStyle Width="80px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Users" HeaderText="标签用户数" ItemStyle-Width="50" Visible="true" />
     
    </Columns>
</asp:GridView>
           <p>&nbsp;&nbsp;
        <webdiyer:AspNetPager CssClass="pages" CurrentPageButtonClass="cpb" class="pagination" AlwaysShow="true"
            ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
            PrevPageText="上一页"  OnPageChanged="AspNetPager1_PageChanged" PagingButtonSpacing="0">
        </webdiyer:AspNetPager>
    </p>  
        </div>
                                      </div>      
                                        </div>
                                   
 
             </div>
                            </div>
                        </div>
              </div>         
</asp:Content>

