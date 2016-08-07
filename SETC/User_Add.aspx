<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Add.aspx.cs" Inherits="User_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:Label ID="LabelUserID" runat="server" Visible="false" Text=""></asp:Label>
    <div id="CurrentPosition">当前位置：<a href="#">用户管理</a> >> 添加新用户<a href="#"></a></div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <p>&nbsp;</p>
     <div class="row">

         <div class="col-lg-6 col-sm-6 col-xs-12">
                            <div class="well with-header  with-footer">
                                <div class="header bordered-blue">添加个人信息：</div>
                                     <div class="form-group">
                    <span class="text-primary">登录名：</span>
                    <span></span>
                     <span class="input-icon icon-right">
                         <asp:TextBox ID="UserName" class=" form-control " runat="server"></asp:TextBox>
                         <i class="fa fa-user success circular"></i>
                   </span>
           <span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="用户名必填" ControlToValidate="UserName"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
            ErrorMessage="不符合用户名规则" ControlToValidate="UserName" 
            ValidationExpression="^[a-zA-Z0-9\u4e00-\u9fa5]{1,20}$"></asp:RegularExpressionValidator>       
                   </span>    
                 </div>

                                  <div class="form-group">
                     <span class="text-primary">姓名：</span>
   
                            <span class="input-icon icon-right">
                                 <asp:TextBox ID="TrueName" class="form-control"  runat="server"></asp:TextBox>
                                     <i class="fa fa-user darkorange"></i>
                            </span>
                </div>

                 <div class="form-group">
                     <span class="text-primary">密码：</span>
   
                            <span class="input-icon icon-right">
                                 <asp:TextBox ID="Password" class="form-control" placeholder="请输入密码" TextMode="Password" runat="server"></asp:TextBox>
                                     <i class="fa fa-unlock success circular"></i>
                            </span>
                   <span> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码必填" ControlToValidate="Password"></asp:RequiredFieldValidator>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
            ErrorMessage="不符合密码规则" ControlToValidate="Password" 
            ValidationExpression="^[0-9a-zA-Z]{2,20}$"></asp:RegularExpressionValidator></span> 
                </div>

                <div class="form-group">
                     <span class="text-primary">密码：</span>
   
                            <span class="input-icon icon-right">
                                 <asp:TextBox ID="Password1" class="form-control" placeholder="再次确认密码" TextMode="Password" runat="server"></asp:TextBox>
                                     <i class="fa fa-unlock darkorange"></i>
                            </span>
                </div>

                <div class="form-group">
                    <span class="text-primary">邮箱：</span>
                 <span class="input-icon">
                        <asp:TextBox ID="Email" class="form-control" runat="server"></asp:TextBox>
                          <i class="fa fa-envelope palegreen"></i>
              </span>                                          
               </div>

                <div class="form-group">
                     <span class="text-primary">联系方式：</span>
                       <span class="input-icon icon-right">
                                                              <asp:TextBox ID="TelePhone" class="form-control" runat="server"></asp:TextBox>
                                                            
                                                            <i class="glyphicon glyphicon-earphone darkpink circular"></i>
                                                        </span>                                 
                     </div>
               
                 
      </div>
              
                        </div>
    <div class="col-lg-6 col-sm-6 col-xs-12">
         <div class="well with-header  with-footer">
             <div class="header bordered-blue">添加个人信息：</div>
                <div class="form-group">
                       <label for="exampleInputEmail2" class="text-primary">个性签名：</label>
                       <span class="input-icon icon-right">
                      <asp:TextBox ID="Status" TextMode="MultiLine" class="form-control" Columns="40" Rows="5" MaxLength="140" runat="server"></asp:TextBox>
                      <asp:RegularExpressionValidator   id= "RegularExpressionValidator1"   runat= "server"   ErrorMessage= "当前状态，不超过140个字符！"   ControlToValidate= "Status" ValidationExpression= ".{0,140}"> </asp:RegularExpressionValidator> 
                      <i class="glyphicon glyphicon-briefcase darkorange"></i>
                     </span>
                     <p class="help-block">请输入你的当前状态，不超过140个字符！</p>
                </div>  
                <asp:Panel ID="RolePanel" runat="server">
        <span class="text-primary">角色：</span>
         <asp:RadioButtonList ID="Role" runat="server" RepeatDirection="Horizontal" 
                RepeatLayout="Flow">
            </asp:RadioButtonList>
    </asp:Panel>
   
              <p></p>
         <span class="text-primary">用户所属标签：</span>
          <asp:CheckBoxList ID="TagsList" runat="server" style="margin-left:10px;margin-top:10px;" RepeatDirection="Horizontal" 
                 RepeatLayout="Table" RepeatColumns="4" Width="500px">
          </asp:CheckBoxList>
 <p></p>  
              <p style="margin-left:170px ;margin-top:10px;">
        <asp:Button ID="Button1" class="btn btn-azure" runat="server" Text="保存信息" OnClick="Button1_Click"  />
    </p>
    <asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red" />    
               <p>
        <span class="text-muted">注册日期：</span>
        <asp:Label ID="RegisterDateTime" class="text-danger" runat="server" Text=""></asp:Label>
    </p>
     <p>
        <span class="text-muted">最后访问日期：</span>
        <asp:Label ID="LastLoginDateTime" class="text-danger" runat="server" Text=""></asp:Label>
    </p>
                   
         </div>
    </div>
       </div>



   
</asp:Content>

