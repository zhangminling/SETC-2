<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Article_Add.aspx.cs" Inherits="Article_Add" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Make sure the path to CKEditor is correct. -->
<script type="text/javascript" src="ckeditor201507/ckeditor.js"></script>

<div class="clear"></div>
    <div class="row">
<asp:Label ID="RandomID" runat="server" Text="" Visible="false"></asp:Label>
<asp:Label ID="IDLabel" runat="server" Text="" Visible="false"></asp:Label>
<asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="2000" Enabled="false" />
<div id="CurrentPosition">��ǰλ�ã�<a href="Article_Man.aspx">���¹���</a> >> <a href="#">����������</a></div>
<p>&nbsp;</p>


<table width="100%" align="left" id="RegistTable">
    <tr><td align="center" class="auto-style1"><asp:Button ID="Button3" runat="server" Text=" ���沢�ύ " CssClass="Button" onclick="Button3_Click" /> 
        </td>
    <td width="200" align="left" style="text-align:center">        
               <asp:Button ID="Button2" runat="server" Text=" ����Ԥ�� " CssClass="Button" onclick="Button2_Click" />
    </td>
    <td width="120" align="left"><asp:Button ID="Button1" runat="server" Text=" ����ݸ� " CssClass="Button" onclick="Button1_Click" />&nbsp;</td>
    <td width="200"><asp:Button ID="Button4" runat="server" Text=" ������� " CssClass="Button"  onclick="Button4_Click" /></td>
    </tr>
    <tr height="4px">
    <td class="auto-style1">&nbsp;</td>
    <td align="left" colspan="3"><asp:Label ID="ResultLabel" runat="server" 
            Font-Bold="True" ForeColor="#00CC00"></asp:Label></td>    
    </tr>
    <tr><td style="text-align:center" class="auto-style1">���±��⣺</td>
    <td width="300" align="left" colspan="3"><asp:TextBox ID="TitleTB" runat="server" MaxLength="30" CssClass="TextBox" Width="560"></asp:TextBox></td>
    
    </tr>    
    <tr><td class="auto-style1">&nbsp;</td>
    <td align="left" colspan="3"><div id="div4" style="font-size:12px;color:#999;"> ���±��⣬���𳬹�20���ַ�</div></td>    
    </tr>

      
    <tr><td class="auto-style1">&nbsp;</td>
    </tr>

     <tr><td style="text-align:center" class="auto-style1">���·��ࣺ��</td>
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
     <tr><td style="text-align:center" class="auto-style1">����λ�ã�</td>
    <td width="500" align="left" colspan="3"> <asp:CheckBoxList ID="CheckBoxList2" runat="server"  RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                            <asp:ListItem Selected="True"> ������վ </asp:ListItem> <asp:ListItem> �ֻ���վ </asp:ListItem>  <asp:ListItem>΢��ƽ̨</asp:ListItem>
                                                                          <asp:ListItem> ƽ�����</asp:ListItem> <asp:ListItem> �ֻ�APP </asp:ListItem> <asp:ListItem>����Ļ����</asp:ListItem>
                                                                        </asp:CheckBoxList></td>
    
    </tr>  
     <tr><td class="auto-style1">&nbsp;</td></tr>
     <tr><td style="text-align:center" class="auto-style1">�������ڣ�</td>
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
