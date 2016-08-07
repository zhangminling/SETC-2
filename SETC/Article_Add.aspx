<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Article_Add.aspx.cs" Inherits="Article_Add" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Make sure the path to CKEditor is correct. -->
<script type="text/javascript" src="ckeditor201507/ckeditor.js"></script>

<div class="clear"></div>
<asp:Label ID="RandomID" runat="server" Text="" Visible="false"></asp:Label>
<asp:Label ID="IDLabel" runat="server" Text="" Visible="false"></asp:Label>
<asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="2000" Enabled="false" />
<div id="CurrentPosition">当前位置：<a href="Article_Man.aspx">文章管理</a> >> <a href="#">发表新文章</a></div>
<p>&nbsp;</p>

<table width="100%" align="left" id="RegistTable">
    <tr><td width="120" align="center"><asp:Button ID="Button3" runat="server" Text=" 保存并提交 " CssClass="Button" onclick="Button3_Click" /> 
        </td>
    <td width="200" align="left">        
               <asp:Button ID="Button2" runat="server" Text=" 文章预览 " CssClass="Button" onclick="Button2_Click" />
    </td>
    <td width="120" align="left"><asp:Button ID="Button1" runat="server" Text=" 保存草稿 " CssClass="Button" onclick="Button1_Click" />&nbsp;</td>
    <td width="200"><asp:Button ID="Button4" runat="server" Text=" 退出编辑 " CssClass="Button"  onclick="Button4_Click" /></td>
    </tr>
    <tr height="4px">
    <td width="120">&nbsp;</td>
    <td align="left" colspan="3"><asp:Label ID="ResultLabel" runat="server" 
            Font-Bold="True" ForeColor="#00CC00"></asp:Label></td>    
    </tr>
    <tr><td width="120" style="text-align:center">文章标题：</td>
    <td width="300" align="left" colspan="3"><asp:TextBox ID="TitleTB" runat="server" MaxLength="30" CssClass="TextBox" Width="560"></asp:TextBox></td>
    
    </tr>    
    <tr><td width="120">&nbsp;</td>
    <td align="left" colspan="3"><div id="div4" style="font-size:12px;color:#999;"> 文章标题，请勿超过20个字符</div></td>    
    </tr>
</table>
    <div>&nbsp;</div>
     
     <div style="width:900px" class="clear">
                            
                              <div class="col-xs-12">
                                    <div class="dashboard-box">
                                      <div class="box-tabbs">
                                          <div class="tabbable">
                                                <ul class="nav nav-tabs tabs-flat  nav-justified" id="myTab11">
                                                    <li class="active">
                                                        <a data-toggle="tab" href="#visits">
                                                            内容编辑
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="tab" href="#realtime">
                                                            发布选项
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="tab" href="#bandwidth">
                                                           封面图上传
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="tab" href="#sales">
                                                           已上传资源
                                                        </a>
                                                    </li>
                                                </ul>
                                                <!--  1  --->
                                                <div class="tab-content tabs-flat no-padding">
                                                    <div id="visits" class="tab-pane active animated fadeInUp">
                                                        <div class="row">
                                                            <div class="col-lg-12 chart-container" style="height:600px">
                                                                <div id="dashboard-chart-visits" class="chart chart-lg no-margin">
                                                                 <asp:TextBox ID="Editor1" runat="server" TextMode="MultiLine" />
        <script type="text/javascript">
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.
            var editor = CKEDITOR.replace('<%= Editor1.ClientID %>', { height: "600px" });                    
        </script>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!---  2  -->
                                                    <div id="realtime" class="tab-pane padding-left-5 padding-right-10 animated fadeInUp">
                                                        <div class="row">
                                                            <div class="col-lg-12" style="height:600px">
                                                                <div id="dashboard-chart-realtime" class="chart chart-lg no-margin" style="width:100%">
                                                              <p>&nbsp;</p>
                                                             
                                                                    <div id="txt">
                                                                        <p >&nbsp;&nbsp;&nbsp;&nbsp;文章分类： </p> 
                                                                        <p style="text-align:left; margin:-50px;">
                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                             <ContentTemplate>
                                    <asp:DropDownList ID="Cats" runat="server" Height="30" AutoPostBack="True"  onselectedindexchanged="Cats_SelectedIndexChanged">
                                     </asp:DropDownList>
                                           &nbsp;&nbsp;
                                        <asp:DropDownList ID="Subs" runat="server" Height="30">
                                             </asp:DropDownList>
                                            </ContentTemplate>
                                           </asp:UpdatePanel></p><p></p></div> 
                                                                 
                                                                     <p>&nbsp;</p>
                                                                     <div id="txt">
                                                                         <p>&nbsp;&nbsp;&nbsp;&nbsp;文章排序:</p><p><asp:TextBox ID="Orders" runat="server" CssClass="TextBox" Text="1"></asp:TextBox></p><p  style="font-size:12px;color:#999;">如需置顶，排序值需><asp:Label ID="MaxOrders" runat="server" Text="0"></asp:Label></p>
                                                                     </div>
                                                                    <p>&nbsp;</p>
                                                                       <p>&nbsp;</p>
                                                                    <div id="txt"><p>&nbsp;&nbsp;&nbsp;&nbsp;发表位置:</p><p style="width:500px;">
                                                                       
                                                                        <asp:CheckBoxList ID="CheckBoxList2" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                            <asp:ListItem Selected="True"> 电脑网站 </asp:ListItem> <asp:ListItem> 手机网站 </asp:ListItem>  <asp:ListItem>微信平台</asp:ListItem>
                                                                          <asp:ListItem> 平板电脑</asp:ListItem> <asp:ListItem> 手机APP </asp:ListItem> <asp:ListItem>大屏幕电视</asp:ListItem>
                                                                        </asp:CheckBoxList></p>
                                                                        

                                                                    </div>
                                                                    <p>&nbsp;</p>
                                                                       <p>&nbsp;</p>
                                                                    <div id="txt"> <p>查看权限：</p><p>
                                                                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" Width="195px" Height="100px"></asp:CheckBoxList></p></div>
                                                                     <p>&nbsp;</p>
                                                                       <p>&nbsp;</p>
                                                                    <div id="txt">
                                                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;发表部门：</p><p>
                                                                            <asp:DropDownList ID="UserTag" runat="server" Height="30" Width="100px"></asp:DropDownList ></p><p></p>
                                                                    </div>
                                                                    <p>&nbsp;</p>
                                                                     <p>&nbsp;</p>
                                                                    <div id="txt">
                                                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;发表日期：</p><p><asp:TextBox ID="CDT_TextBox" runat="server" CssClass="TextBox"></asp:TextBox></p><p></p>
                                                                    </div>

                                                                    <p>&nbsp;</p>
                                                                     <p>&nbsp;</p>
                                                                    <div id="txt">
                                                                       <p>&nbsp;&nbsp;&nbsp;&nbsp;关键字(标签):</p><p><asp:TextBox ID="ArticleTag" runat="server" CssClass="TextBox"></asp:TextBox></p><p></p>
                                                                    </div>

                                                                     <p>&nbsp;</p>
                                                                     <p>&nbsp;</p>
                                                                    <div id="txt"><p></p>
                                                                       <p> <asp:ListBox ID="ListBox1" runat="server" Width="195px"></asp:ListBox></p><p></p>
                                                                    </div>



                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    

                                                    <!---  3  --->
                                                    
                                                    <div id="bandwidth" class="tab-pane padding-10 animated fadeInUp">
                                                        <div class="row">
                                                           

                                                            <div class="col-lg-12" style="height:600px">
                                                                <div id="dashboard-chart-realtime1" class="chart chart-lg no-margin" style="width:100%">
                                                     


                                                                 <div style="text-align:center;">                                                                         
                                                                 <p>&nbsp;</p>                                                                     
                                                                    <h2 style="color:red; margin:auto;">可根据需要，自行选择是否上传封面图</h2>
                                                                 <p></p>
                                                            
                                                                   
                                                               
                                                                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="Button" />  &nbsp;&nbsp;&nbsp;&nbsp; 
                                                                <asp:Button ID="UploadButton" runat="server" Text=" 上传 "  CssClass="Button" onclick="UploadButton_Click"/>
                                                                   
                                                              

                                                                 <div id="CurrentAvatar">
                                                            <h4>当前封面图</h4>
                                                                      <asp:Image  ID="CoverPhoto" runat="server" Width="320" Height="160" AlternateText="文章封面图" />
                                                               </div>
                                                                   
                                                                   <div><asp:Button ID="NextButton" runat="server" Text=" 下一步 " CssClass="Button" onclick="NextButton_Click"  Visible="false"/>
                                                                   </div>                                                              
                                                             </div>


                                                                </div>
                                                          </div>
    
                                                        </div>
                                                    </div>
                                                    
                                                     <!---  4  --->
                                                    <div id="sales" class="tab-pane animated fadeInUp no-padding-bottom" style="padding:20px 20px 0 20px;">
                                                        <div class="row" style="height:600px">
                                                            
                                                            
                                                           12345648
                                                           
                                                           
                                                            
                                                            

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-days">
                                            
                                        </div>
                                    </div>
                                </div>
                                
                                
                                
                                </div>
                                


            













   
<div class="clear">
</div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        #txt p {
        float:left;
        text-align:center;
         width:200px;
        }
    </style>
</asp:Content>
