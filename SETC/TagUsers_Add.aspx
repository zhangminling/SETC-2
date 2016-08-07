<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="TagUsers_Add.aspx.cs" Inherits="TagUsers_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="IDSLabel" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>

      <h5 class="row-title"><i class="typcn typcn-tag"></i>添加群组用户</h5>

     <div class="row">
             
    <div class="col-lg-11 col-sm-11 col-xs-17">
                                    <div class="well with-header">
                                         <div class="header bordered-sky">你的标签</div>
    <asp:CheckBoxList ID="TagsList" runat="server" style="margin-left:20px" RepeatDirection="Horizontal" 
                                              RepeatLayout="Table" RepeatColumns="7" Width="950px">
                                                    
                                                   </asp:CheckBoxList>

                                    </div>
        </div>
         </div>

 <div class="row">
     
         <div class="widget-body">

                                     <div>
        总共：<asp:Label ID="Label1" runat="server" ForeColor="#5D7B9D" Font-Bold="true"></asp:Label>
        条记录，每页显示：
        <asp:DropDownList ID="PageSizeDDL" runat="server" AutoPostBack="true" Font-Bold="true"   ForeColor="#5D7B9D"  OnSelectedIndexChanged="PageSizeDDL_SelectedIndexChanged">
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
  
                                    <div class="widget-body bordered-top bordered-yellow">
                                        
                                             
                                       <div class="form-group">
                                                        <span class="input-icon">
                                                            <asp:TextBox ID="SearchTB" runat="server" placeholder="查询用户名" class="form-control input-sm"></asp:TextBox>
                                                            <i class="glyphicon glyphicon-search danger circular"></i>

                                                        </span>


                                           </div>
         <asp:CheckBoxList ID="CheckBoxList1" runat="server" style="margin-left:20px" RepeatDirection="Horizontal" 
                                           RepeatLayout="Table" RepeatColumns="7" Width="950px">
                                                    
                                                   </asp:CheckBoxList>
        <asp:Button ID="SearchBtn" runat="server" Text="搜索"  class="btn btn-sky"  OnClick="SearchBtn_Click"/>&nbsp;&nbsp;

        <asp:DropDownList ID="OrderDDL" runat="server"  OnSelectedIndexChanged="OrderDDL_SelectedIndexChanged"
            AutoPostBack="True">
            <asp:ListItem Value=" Order by ID Desc">ID从大到小</asp:ListItem>
            <asp:ListItem Value=" Order by ID Asc">ID从小到大</asp:ListItem>
        </asp:DropDownList>
   
        &nbsp;&nbsp;&nbsp;&nbsp;
        
            
        <asp:CheckBox ID="SelectAllCheckBox" runat="server" Text=" 全选 " AutoPostBack="true"  oncheckedchanged="SelectAllCheckBox_CheckedChanged"/>&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="UpdateBtn" runat="server" Text="修改" class="btn btn-blue active" onclick="UpdateBtn_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="DelBtn" runat="server" Text="删除" class="btn btn-darkorange active"   onclick="DelBtn_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AddBtn" runat="server" Text="确认添加" class="btn btn-success tooltip-success" OnClick="AddBtn_Click"  />
                                        
       
      <asp:DropDownList ID="CatsDDL" runat="server" 
        onselectedindexchanged="CatsDDL_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
      
              <div style="height:32px;line-height:32px; float:right;">角色分类：
         
          <asp:DropDownList ID="RoleTypeDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RoleTypeDDL_SelectedIndexChanged" >
        </asp:DropDownList>   
</div>    
      <p></p>    
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
         <asp:HyperLinkField DataNavigateUrlFields="ID" 
             DataNavigateUrlFormatString="User_Edit2.aspx?ID={0}" DataTextField="RoleName" 
            HeaderText="角色"  Target="_blank"   ItemStyle-Width="90">
    </asp:HyperLinkField>  
        <asp:BoundField DataField="Valid" HeaderText="有效" SortExpression="Valid"  ItemStyle-Width="90"/>
    </Columns>
</asp:GridView>
        
       
           <p>&nbsp;&nbsp;
        <webdiyer:AspNetPager CssClass="pages" CurrentPageButtonClass="cpb" class="pagination" AlwaysShow="true"
            ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页"
            PrevPageText="上一页" OnPageChanged="AspNetPager1_PageChanged"  PagingButtonSpacing="0">
        </webdiyer:AspNetPager>
               <p>
               </p>
    </p>  
        </div>
                                      </div>      
                                        </div>
        </div>
         
</asp:Content>

