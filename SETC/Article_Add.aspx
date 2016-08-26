<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Article_Add.aspx.cs" Inherits="Article_Add" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <link href="assets/css/style.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function (e) {
            $(".login2").click(function (e) {
                $('.blanks2').show();
                $('.blanks2').height($(document).height());
                $(".module-area2").slideDown(400);//fadeIn()


            });
            $(".module-close2").click(function (e) {
                $('.blanks2').hide();
                $(".module-area2").slideUp(400);//fadeOut()
            });

            $(".Sure").click(function (e) {
                $('.blanks2').hide();
                $(".module-area2").slideUp(400);//fadeOut()
            });
            
        });

    </script>
    <!-- Make sure the path to CKEditor is correct. -->
    <script type="text/javascript" src="ckeditor201507/ckeditor.js"></script>
    <%--插入资源用的js代码--%>
    <script type="text/javascript">
        var fileUrl = "<%= RandomIDCD %>";
        CKEDITOR.plugins.add('timestamp', {
            icons: 'timestamp',
            init: function (editor) {
                //Plugin logic goes here.
                editor.addCommand('insertTimestamp', {
                    exec: function showMyDialog(e) {
                        var str = 'width=980,height=650,left=' + ((screen.width - 900) / 2) + ',top=' + ((screen.height - 650) / 2) + ',scrollbars=no,scrolling=no,location=no,toolbar=no'
                        var w = window.open('File_Browse2.aspx?ID=' + fileUrl + '', 'MyWindow', str);
                    }
                });
                editor.ui.addButton('Timestamp', {
                    label: '插入资源',
                    command: 'insertTimestamp',
                    toolbar: 'insert'
                });
            }
        });
    </script>

 
    <div class="row">

            <!-- 模态框弹出部分  --->
        
                    <div class="blanks2"></div>
                  

                    <div class="module-area2 modal-content2">
                        <div class="module-head2">
                            <span>标签查询</span>
                            <div class="module-close2"></div>

                        </div>
                        <div id="BDCenter">
                            <div id="loginInput">
                              
                                <asp:CheckBoxList ID="TagsList" runat="server" Style="margin-left: 5px; margin-top:0px; text-align:left;" RepeatDirection="Horizontal"
                                    RepeatLayout="Table" RepeatColumns="4" Width="100%">
                                </asp:CheckBoxList>
                               
                                <div class="Sure" runat="server" > 取消 </div>
                                
                                <p class="loginBnt">
                                    <asp:Button ID="Clear" runat="server" Text="确定"  class="btn btn-info " OnClick="Sure_Click"  />

                                </p>
                            </div>
                        </div>
                    </div>
           
                      <!-- 模态框弹出部分  --->
        <asp:Label ID="RandomID" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="IDLabel" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="TagiIDs" runat="server" Text="" Visible="false"></asp:Label> <!---存放模态框选中的TagID -->
        <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>   <!---存放数据库中“Articles_ArticleTags”的TagID数-->
        <asp:Label ID="Count" runat="server" Text="" Visible="false"></asp:Label>

        <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="2000" Enabled="false" />
        <div id="CurrentPosition">当前位置：<a href="Article_Man.aspx">文章管理</a> >> <a href="#">发表新文章</a></div>
        <p>&nbsp;</p>
        <table width="100%" align="left" id="RegistTable">
            <tr>
                <td align="center" class="auto-style1">
                    <asp:Button ID="Button3" runat="server" Text=" 保存并提交 " OnClick="Button3_Click" class="btn btn-default shiny" />
                </td>
                  
                <td width="200" align="left" style="text-align: center">
                    <a><asp:Button ID="Button2" runat="server" Text=" 文章预览 " class="btn btn-default shiny" OnClick="Button2_Click" /></a>
                    
                </td>
                <td width="120" align="left">
                    <asp:Button ID="Button1" runat="server" Text=" 保存草稿 " class="btn btn-default shiny" OnClick="Button1_Click" />&nbsp;</td>
                <td width="200">
                    <asp:Button ID="Button4" runat="server" Text=" 更多操作 " class="btn btn-default shiny" OnClick="Button4_Click"  Visible="false"/></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td align="left" colspan="3">
                    <asp:Label ID="ResultLabel" runat="server"
                        Font-Bold="True" ForeColor="#00CC00"></asp:Label></td>
            </tr>
            <tr>
                <td style="text-align: center" class="auto-style1">文章标题：</td>
                <td width="300" align="left" colspan="3">
                    <asp:TextBox ID="TitleTB" runat="server" MaxLength="30" CssClass="TextBox" Width="560"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td align="left" colspan="3" class="noUi-horizontal">
                    <div id="div4" style="font-size: 12px; color: #999;">文章标题，请勿超过20个字符</div>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center" class="auto-style1">文章分类：</td>
                <td width="200" align="left" colspan="3">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:DropDownList ID="Cats" runat="server" Height="30" AutoPostBack="True" OnSelectedIndexChanged="Cats_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <asp:DropDownList ID="Subs" runat="server" Height="30">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center" class="auto-style1">发布位置：</td>
                <td width="500" align="left" colspan="3">
                    <asp:CheckBox ID="PC" runat="server" Text="电脑网站" Checked="true" /><asp:CheckBox ID="Phone" runat="server" Text="手机网站" />
                    <asp:CheckBox ID="Wechat" runat="server" Text="微信平台" /><asp:CheckBox ID="iPad" runat="server" Text="平板电脑" />
                    <asp:CheckBox ID="APP" runat="server" Text="手机App" /><asp:CheckBox ID="TV" runat="server" Text="大屏幕电视" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: center" class="auto-style1">发表日期：</td>
                <td width="400" align="left" colspan="3">
                    <p>
                        <asp:TextBox ID="CDT_TextBox" runat="server" CssClass="TextBox" Enabled="False"> </asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</p>
                </td>
            </tr>
        </table>
    </div>


    <div style="clear: both"></div>
         

    <div class="row">


        
                            <div>
                            
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
                                                    <li >
                                                        <a data-toggle="tab" href="#realtime">
                                                            更多操作
                                                        </a>
                                                    </li>
                                                   
                                                    
                                                </ul>
         
                                                <!--  1  --->
                                                <div class="tab-content tabs-flat no-padding">
                                                    <div id="visits" class="tab-pane active animated fadeInUp">
                                                        <div class="row">
                                                            <div class="col-lg-12 chart-container" style="height:500px">
                                                                <div id="dashboard-chart-visits" class="chart chart-lg no-margin">
                                                               <asp:TextBox ID="Editor1" runat="server" TextMode="MultiLine" />
        <script type="text/javascript">
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.
            var editor = CKEDITOR.replace('<%= Editor1.ClientID %>', { height: "600px" });                    
        </script>
        <p>&nbsp;</p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                            
      
                                                    <!---  2  -->

                                                    <div id="realtime" class="tab-pane   padding-left-5 padding-right-10 animated fadeInUp">
                                                        <div class="row">
                                                            <div class="col-lg-12" style="height:550px">
                                                                <div id="dashboard-chart-realtime" class="chart chart-lg no-margin" style="width:100%">
                                                               
                                                                  
            <div style="margin: auto; width: 90%;">                
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#00CC00"></asp:Label>
                  <p></p>
                <div class="txt">
                    <p></p>
                    <p>文章摘要：</p>
                    <p style="width:40%">
                       <asp:TextBox ID="Summary" class="form-control" TextMode="MultiLine" Columns="60" Rows="6" Width="100%" placeholder="简述文章内容" runat="server"></asp:TextBox>
                         
                    </p>
                 
                    <p></p>
                </div>
                <p></p>
                <div class="txt">
                    <p></p>
                    <p>文章排序：</p>
                    <p>
                        <asp:TextBox ID="Orders" runat="server" CssClass="TextBox" Text="1"></asp:TextBox></p>
                    <p style="font-size: 12px; color: #999;">如需置顶，排序值需><asp:Label ID="MaxOrders" runat="server" Text="0"></asp:Label></p>
                </div>
                <p></p>
                <div class="txt">
                    <p></p>
                    <p>发表部门：</p>
                    <p>
                        <asp:DropDownList ID="UserTag" runat="server" Height="30" Width="100px"></asp:DropDownList>
                    </p>
                    <p></p>
                </div>
                <p></p>
                <div class="txt">
                    <p></p>
                    <p>关键字(标签)：</p>
                    
                    <p><asp:ListBox ID="ListBox1" runat="server"  Width="80%"  Rows="3"  ></asp:ListBox>
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" class="btn btn-info login2" runat="server" Text="添加标签"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
   <%-- <asp:Button ID="TagBtn" runat="server" Text="标签查询" class="btn btn-info "  onclick="TagBtn_Click" />&nbsp;&nbsp;&nbsp;&nbsp;--%></p>
                    
                </div>
               
                <p></p> 


                <div class="txt">
                    <p></p>
                    <p>文章封面图：</p>
                    <p>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="Button" />
                    </p>
           
                    <p>&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="UploadButton" runat="server" Text=" 上传 " class="btn btn-info" OnClick="UploadButton_Click" /></p>
        
                    <p style="width: 5%"></p>
                </div>
         
                <p></p>
                <div class="txt">
                    <p></p>
                    <p></p>
                    <p>
                        <asp:Image ID="CoverPhoto" runat="server" Width="320" Height="160" AlternateText="文章封面图" /></p>
                </div>

            </div>            


                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
  

                                                    
                                                   
                                                </div>
                                            </div>

                                        </div>
                                        
                                    </div>
                                </div>
                                
                                
                                
                                </div>





       
    </div>
                                        
  



    <div class="clear">
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        #txt p {
            float: left;
            text-align: center;
            width: 200px;
        }

        .auto-style1 {
            width: 120px;
        }

        .auto-style2 {
            width: 120px;
            height: 18px;
        }
      
        .txt p {
            float: left;
            width: 20%;
        }

        .txt {
            clear: both;
            width: 90%;
        }
   
    </style>
</asp:Content>
