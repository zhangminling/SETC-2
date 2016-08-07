<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Edit2.aspx.cs" Inherits="User_Edit2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:Label ID="LabelUserID" runat="server" Visible="false" Text=""></asp:Label>
    <div id="CurrentPosition">当前位置：<a href="#">用户管理</a> >> <a href="#">完善个人信息</a></div>
    <p>&nbsp;</p>
     <div class="row">
                        <div class="col-lg-6 col-sm-6 col-xs-12">
                            <div class="well with-header  with-footer">
                             <div class="header bordered-blue">完善头像：</div>

                                  <div class="row">
                                       <div class="col-lg-4 col-sm-4 col-xs-8">
                                         
                                           <asp:Image ID="Image1" runat="server" width="180px" AlternateText="用户头像" />
                               
                                           </div>
                              <div class="col-lg-5 col-sm-5 col-xs-4">
                                    <p style="margin-left:30px;" class="text-muted">请上传您的用户头像</p>
                       <asp:FileUpload ID="FileUpload1" CssClass="btn btn-link" style="margin-left:25px;margin-top:50px;" runat="server" BackColor="#CCCCCC" ForeColor="White" />
                        <asp:Button ID="Button1" style="margin:60px 30px;" runat="server" class="btn btn-palegreen" Text=" 上 传 " OnClick="Button1_Click"/>
    <p>
<asp:Label ID="ResultLabel" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
       
</p>      
                                  </div>
                                      </div>
                            
                             
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
                            
                        <div class="col-lg-6 col-sm-6 col-xs-12">
                            <div class="well with-header  with-footer">
                                <div class="header bordered-blue">完善个人信息：</div>
                                     <div class="form-group">
                    <span class="text-primary">登录名：</span>
                    <span></span>
                     <span class="input-icon icon-right">
                         <asp:Label ID="Label1" class=" form-control "  runat="server" ></asp:Label>
                         <i class="fa fa-user success circular"></i>
                   </span>
                            
                       
                 </div>

                                  <div class="form-group">
                     <span class="text-primary">姓名：</span>
   
                            <span class="input-icon icon-right">
                                 <asp:TextBox ID="TrueName" class="form-control" runat="server"></asp:TextBox>
                                     <i class="fa fa-user darkorange"></i>
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
               
                <div class="form-group">
                       <label for="exampleInputEmail2" class="text-primary">个性签名：</label>
                       <span class="input-icon icon-right">
                      <asp:TextBox ID="Status" TextMode="MultiLine" class="form-control" Columns="40" Rows="5" MaxLength="140" runat="server"></asp:TextBox>
                      <asp:RegularExpressionValidator   id= "RegularExpressionValidator1"   runat= "server"   ErrorMessage= "当前状态，不超过140个字符！"   ControlToValidate= "Status" ValidationExpression= ".{0,140}"> </asp:RegularExpressionValidator> 
                      <i class="glyphicon glyphicon-briefcase darkorange"></i>
                     </span>
                     <p class="help-block">请输入你的当前状态，不超过140个字符！</p>
                     </div>    
                                  <asp:Panel ID="PasswordPanel" runat="server" Visible="false">
        <p class="text-primary">重置密码： <asp:TextBox ID="Password" runat="server" CssClass="TextBox"></asp:TextBox></p>  
       
        <p><asp:Label ID="OldPassword" runat="server" Visible="false" Text=""></asp:Label></p>
       
       <p class="text-primary">不需要修改密码，请保持不变。</p> 
       
        </asp:Panel>        
                                  <asp:Panel ID="RolePanel" runat="server">
        <span class="text-primary">角色：</span>
         <asp:RadioButtonList ID="Role" runat="server" RepeatDirection="Horizontal" 
                RepeatLayout="Flow">
            </asp:RadioButtonList>
    </asp:Panel>
    <p></p>
      <asp:Panel ID="ValidPanel" runat="server">
           <span class="text-primary">用户的有效性：</span>
          <asp:RadioButton ID="true1" runat="server" GroupName="Valid" Checked="true" Text="True" />
          <asp:RadioButton ID="false1" runat="server" GroupName="Valid" Text="False" />
    
      </asp:Panel>
 
    <p>
        <asp:Button ID="Button2" class="btn btn-success" runat="server" Text="保存信息" OnClick="Button2_Click"  />
    </p>
    <asp:Label ID="ErrorLabel" runat="server" Text="" Font-Bold="true" ForeColor="Red" />       
                                </div>
                            
                        </div>
                    </div>
   
 
      </asp:Content>

