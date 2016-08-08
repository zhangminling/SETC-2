<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Article_Add.aspx.cs" Inherits="Article_Add" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Make sure the path to CKEditor is correct. -->
<script type="text/javascript" src="ckeditor201507/ckeditor.js"></script>

<div class="clear"></div>
    <div class="row">
<asp:Label ID="RandomID" runat="server" Text="" Visible="false"></asp:Label>
<asp:Label ID="IDLabel" runat="server" Text="" Visible="false"></asp:Label>
<asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="2000" Enabled="false" />
<div id="CurrentPosition">当前位置：<a href="Article_Man.aspx">文章管理</a> >> <a href="#">发表新文章</a></div>
<p>&nbsp;</p>


<table width="100%" align="left" id="RegistTable">
    <tr><td align="center" class="auto-style1"><asp:Button ID="Button3" runat="server" Text=" 保存并提交 " CssClass="Button" onclick="Button3_Click" /> 
        </td>
    <td width="200" align="left" style="text-align:center">        
               <asp:Button ID="Button2" runat="server" Text=" 文章预览 " CssClass="Button" onclick="Button2_Click" />
    </td>
    <td width="120" align="left"><asp:Button ID="Button1" runat="server" Text=" 保存草稿 " CssClass="Button" onclick="Button1_Click" />&nbsp;</td>
    <td width="200"><asp:Button ID="Button4" runat="server" Text=" 更多操作 " CssClass="Button"  onclick="Button4_Click" /></td>
    </tr>
    <tr height="4px">
    <td class="auto-style1">&nbsp;</td>
    <td align="left" colspan="3"><asp:Label ID="ResultLabel" runat="server" 
            Font-Bold="True" ForeColor="#00CC00"></asp:Label></td>    
    </tr>
    <tr><td style="text-align:center" class="auto-style1">文章标题：</td>
    <td width="300" align="left" colspan="3"><asp:TextBox ID="TitleTB" runat="server" MaxLength="30" CssClass="TextBox" Width="560"></asp:TextBox></td>
    
    </tr>    
    <tr><td class="auto-style1">&nbsp;</td>
    <td align="left" colspan="3"><div id="div4" style="font-size:12px;color:#999;"> 文章标题，请勿超过20个字符</div></td>    
    </tr>

      
    <tr><td class="auto-style1">&nbsp;</td>
    </tr>

     <tr><td style="text-align:center" class="auto-style1">文章分类：：</td>
    <td width="200" align="left" colspan="3"><asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                             <ContentTemplate>
                                    <asp:DropDownList ID="Cats" runat="server" Height="30" AutoPostBack="True"  onselectedindexchanged="Cats_SelectedIndexChanged">
                                     </asp:DropDownList>
                                           &nbsp;&nbsp;
                                        <asp:DropDownList ID="Subs" runat="server" Height="30">
                                             </asp:DropDownList>
                                            </ContentTemplate>
                                           </asp:UpdatePanel>  </td>
  
    </tr>  
        
    <tr><td class="auto-style1">&nbsp;</td></tr>
     <tr><td style="text-align:center" class="auto-style1">发布位置：</td>
    <td width="500" align="left" colspan="3"> <asp:CheckBoxList ID="CheckBoxList2" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                            <asp:ListItem Selected="True"> 电脑网站 </asp:ListItem> <asp:ListItem> 手机网站 </asp:ListItem>  <asp:ListItem>微信平台</asp:ListItem>
                                                                          <asp:ListItem> 平板电脑</asp:ListItem> <asp:ListItem> 手机APP </asp:ListItem> <asp:ListItem>大屏幕电视</asp:ListItem>
                                                                        </asp:CheckBoxList></td>
    
    </tr>  
     <tr><td class="auto-style1">&nbsp;</td></tr>
     <tr><td style="text-align:center" class="auto-style1">发表日期：</td>
    <td width="400" align="left" colspan="3"> <p><asp:TextBox ID="CDT_TextBox" runat="server" CssClass="TextBox" Enabled="False"> </asp:TextBox> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</p></td>    
    </tr>

</table>

    </div>
      <div style="clear:both">  </div>     
                                                    <div class="row">   
                                                                 <asp:TextBox ID="Editor1" runat="server" TextMode="MultiLine" />
        <script type="text/javascript">
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.
            var editor = CKEDITOR.replace('<%= Editor1.ClientID %>', { height: "600px" });                    
        </script>
                                                              
                                                 <p>&nbsp;</p>
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
        .auto-style1 {
            width: 120px;
        }
    </style>
</asp:Content>
