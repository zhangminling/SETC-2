<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_IsValid.aspx.cs" Inherits="User_IsValid" %>

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
     <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
    <div id="CurrentPosition">当前位置：<a href="User_IsValid.aspx">管理用户状态</a></div>  
  
      <div class="page-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">状态管理</span>
                                    <%--<div class="widget-buttons">
                                        <a href="#" data-toggle="maximize">
                                            <i class="fa fa-expand"></i>
                                        </a>
                                        <a href="#" data-toggle="collapse">
                                            <i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>--%>
                                </div>
                                <div class="widget-body">
 <asp:UpdatePanel ID="UpdatePanel2" runat="server">
         <ContentTemplate>  
                                     <div>
        总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
        条记录，每页显示：
        <asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true"  ForeColor="#5D7B9D" OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged">
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="10" Selected="True">10</asp:ListItem>
            <asp:ListItem Value="15">15</asp:ListItem>
            <asp:ListItem Value="20">20</asp:ListItem>
            <asp:ListItem Value="25">25</asp:ListItem>
            <asp:ListItem Value="30">30</asp:ListItem>
        </asp:DropDownList>
        条记录， 共<asp:Label ID="Label2" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>页。
        <asp:Label ID="TestLabel" runat="server" Text="" Visible="true"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
    <br />
                     </ContentTemplate>
        </asp:UpdatePanel>   
                             
  
                                    <div class="widget-body bordered-top bordered-sky">
                                        
                            
                                       <div class="form-group col-xs-11 col-md-11">
                                                        <span class="input-icon">
                                                            <asp:TextBox ID="SearchTB" runat="server" placeholder="查询用户名" class="form-control input-sm"></asp:TextBox>
                                                            <i class="glyphicon glyphicon-search danger circular"></i>

                                                        </span>
                                       </div>
                                     <asp:Button ID="SearchBtn" runat="server" Text="搜索"  class="btn btn-sky" OnClick="SearchBtn_Click"  />&nbsp;&nbsp;

        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
         <ContentTemplate>     

        <asp:DropDownList ID="OrderDDL" runat="server"  OnSelectedIndexChanged="OrderDDL_SelectedIndexChanged"
            AutoPostBack="True">
            <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>
            <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>
        </asp:DropDownList>
    
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true"   oncheckedchanged="SelectAllCheckBox_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
              </ContentTemplate>
        </asp:UpdatePanel>
        <div style="margin-left:200px;margin-top:-32px;">
        <asp:Button ID="IsTrue" runat="server" Text="启用" AutoPostBack="true"  class="btn btn-palegreen active" OnClick="IsTrue_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="IsFalse" runat="server" Text="禁用" AutoPostBack="true" class="btn btn-yellow active" OnClick="IsFalse_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="UpdateBtn" runat="server" Text="修改" class="btn btn-blue active" OnClick="UpdateBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DelBtn" runat="server" Text="删除" class="btn btn-darkorange active" OnClick="DelBtn_Click"  />&nbsp;&nbsp;&nbsp;&nbsp;
             </div>
   
    
                  <asp:UpdatePanel ID="UpdatePanel3" runat="server">
         <ContentTemplate>                                       
        <div style="height:32px;line-height:32px; float:right;margin-top:-30px;">状态：
          <asp:DropDownList ID="RoleTypeDDL" runat="server" AutoPostBack="True"  OnSelectedIndexChanged="RoleTypeDDL_SelectedIndexChanged">
        </asp:DropDownList>
</div>   
                </ContentTemplate>
        </asp:UpdatePanel>  
           
      
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>  
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
    <ItemStyle Width="30px" HorizontalAlign="Left" />
    </asp:TemplateField>          
        <asp:BoundField DataField="UserName" HeaderText="用户名"  ItemStyle-Width="80" ItemStyle-HorizontalAlign="Center" >
<ItemStyle Width="80px"></ItemStyle>
        </asp:BoundField>
          <asp:BoundField DataField="TrueName" HeaderText="姓名"  ItemStyle-Width="80" >
<ItemStyle Width="80px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-Width="90" Visible="true" />
        <asp:BoundField DataField="TelePhone" HeaderText="联系方式" ItemStyle-Width="90" Visible="true" />
        <asp:TemplateField HeaderText="头像" >
            <ItemTemplate>
                <img src='<%# Eval("Avatar")%>' alt='<%# Eval("UserName")%>' width="80" />
            </ItemTemplate>
        </asp:TemplateField>                
        <asp:BoundField DataField="Status" HeaderText="个性签名" SortExpression="Status"   />
       
        <asp:BoundField DataField="RoleName" HeaderText="角色" SortExpression="RoleName"  ItemStyle-Width="90"/>
         <asp:HyperLinkField DataNavigateUrlFields="ID" 
             DataNavigateUrlFormatString="User_Edit2.aspx?ID={0}" DataTextField="Valid" 
            HeaderText="有效"  Target="_blank"   ItemStyle-Width="90">
    </asp:HyperLinkField>  
    </Columns>
</asp:GridView>
           <p>&nbsp;&nbsp;
        <webdiyer:AspNetPager CssClass="pages" CurrentPageButtonClass="cpb" class="pagination" AlwaysShow="true"
            ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
            PrevPageText="上一页"  OnPageChanged="AspNetPager1_PageChanged" PagingButtonSpacing="0">
        </webdiyer:AspNetPager>
    </p>  
        </div>
                 </ContentTemplate>
        </asp:UpdatePanel>   
                                      </div>      
                                        </div>
                                   
 
             </div>
                            </div>
                        </div>
                    </div>
       
</asp:Content>

