<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User_Profile.aspx.cs" Inherits="User_Profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>    
    <style type="text/css">
    *
    {
        padding:0;
        margin:0;        
    }
    img
    {
        border:none;
    }
    #Menu
    {
        position:fixed;
        left:10px;
        top:10px;
        z-index:20;
        width:120px;
        padding:20px 10px;
        border:1px solid red;        
    }
    /*
    #Menu input[type="text"]
    {
        width:30px;
    }
    */
    #Top
    {
        width:100%;
        padding:12px 0;        
        height:32px;
        line-height:32px;
        background-color:#005fb1;	
	    color:#FFFFFF;
    }
    #TopMenu
    {
        width:960px;
        height:32px;
        line-height:32px;
        padding:0px 20px;
        margin: 0 auto;
        font-size:13px;    
        background-image:url(images/32/information.png);
        background-repeat:no-repeat;
    }   
    #TopMenu a
    {
        color:#fff;
        text-decoration:none;
    }
    #TopMenu a:hover
    {
        color:#f90;
        text-decoration:underline;
    } 
    #TopMenu div
    {
        display:inline;
    }
    #TopDesign
    {
        width:100%;        
        background-color:#ffa;
        /* #ffa */
    }
    #TopBigImage
    {
        width:960px;
        margin:0 auto;
        padding:12px 0;
        display:none;        
    }
    #TopBigImage p
    {
        height:24px;
        line-height:24px;
        font-size:12px;
    }
    #Wrapper
    {
        width:1000px;
        margin:0 auto;
    }
    
    #Profile
    {
        width:1000px;
        position:relative;
        z-index:1;
        background-image:url('images/Me_Indian2.jpg');
        background-repeat:no-repeat;
    }
    #Banner
    {
        position:absolute;
        z-index:3;
        width:32px;
        height:32px;
        top:24px;
        right:24px;
    }
    #ProfileRect
    {
        position:absolute;
        background-color:#fff;
        left:60px;
        top:60px;
        width:400px;
        height:600px;
        border:1px solid #ccc;
        padding:20px 20px;        
        z-index:9;
    }
    #ProfileBox
    {
        position:absolute;        
        left:60px;
        top:60px;
        width:400px;
        height:600px;
        border:1px solid #ccc;
        padding:20px 20px;
        z-index:10;
    }
    #ProfileBox .ProfileBoxBigName
    {
        font-size:48px;
        font-family:"黑体","宋体";
    }
    #ProfileBox p
    {
        font-size:16px;        
        padding:10px 10px;
    }
    #ProfileBox a
    {
        color:#005fb1;        
    }
    #ProfileBox a:hover
    {
        color:#f90;
        text-decoration:underline;
    }
    
    
    .BlueBackground{	
	    background-color:#005fb1;	
	    color:#FFFFFF; 
	    
    }
    .Foot
    {
        text-align:center;
	    vertical-align:middle;
	    font-size:12px; 
    }
    .Foot a
    {
        color:#fff;
        text-decoration:none;
    }
    .Foot a:hover
    {
        color:#F90;
        text-decoration:underline;
    }
    .Clear
    {
        clear:both;
    }
    </style>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="background-color:#F90;height:8px;">&nbsp;</div>
    <div id="Top">
        <div id="TopMenu">&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="Index.aspx" target="_blank">教育技术与传播学院</a>&nbsp;&nbsp;>>&nbsp;&nbsp;          
            <a href="#" target="_blank">个人空间</a>
            <!-- <asp:Label id="UserNameLabel" runat="server" Text=""></asp:Label>&nbsp;&nbsp;--><asp:Label id="UserIDLabel" runat="server" visible="false" Text=""></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Panel ID="ControlPanel" runat="server" Visible="false">
                [&nbsp;&nbsp; <asp:HyperLink ID="EditHyperLink" runat="server" NavigateUrl="###">设计</asp:HyperLink> &nbsp;&nbsp;
                <asp:LinkButton ID="ProfileLinkButton" runat="server" Text="编辑" onclick="ProfileLinkButton_Click"></asp:LinkButton> &nbsp;&nbsp;
                <asp:LinkButton ID="SaveButton" runat="server" onclick="SaveButton_Click" Text="保存"></asp:LinkButton>&nbsp;&nbsp; 
                ]
            </asp:Panel>                
        </div>
    </div>
    
    <div id="TopDesign">
        <div id="TopBigImage">                
            <p>上传背景图：<asp:FileUpload ID="FileUpload1" runat="server" Height="24px" Width="320px"  />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="UploadButton" runat="server" Text=" 上  传 " Height="24px" onclick="UploadButton_Click" />
        &nbsp;&nbsp;&nbsp;
            <asp:Label ID="ResultLabel" runat="server" Text=""></asp:Label>
            </p>
            <p>设置文本框：顶边距<asp:TextBox ID="BoxTop" runat="server" Text="60" Width="30"></asp:TextBox>&nbsp;&nbsp;
            左边距<asp:TextBox ID="BoxLeft" runat="server" Text="60" Width="30"></asp:TextBox>&nbsp;&nbsp;
            宽度<asp:TextBox ID="BoxWidth" runat="server" Text="240" Width="30"></asp:TextBox>&nbsp;&nbsp;
            高度<asp:TextBox ID="BoxHeight" runat="server" Text="600" Width="30"></asp:TextBox>&nbsp;&nbsp;
            透明度<asp:TextBox ID="BoxOpacity" runat="server" Text="0.3" Width="30" ToolTip="取值为0到1之间的小数，0为完全透明，1为完全不透明。"></asp:TextBox>&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="调整" />&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="默认" />
            </p>                
        </div>
    </div>     
    <div id="Wrapper">
        <div id="Profile">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
            <!-- <div id="Banner">
                <a href="Index.aspx"><img src="images/32/bug.png" width="32" height="32" alt="" /></a>
            </div>
            -->
            <asp:Image ID="BigImage" runat="server" Width="1000" ImageUrl="" AlternateText="Big Image" />
            <div id="ProfileRect"></div>
            <div id="ProfileBox">
                <p><asp:Label ID="BigNameLabel" runat="server" Text="" CssClass="ProfileBoxBigName"></asp:Label>
                <asp:TextBox ID="BigNameTextBox" runat="server" Text="" Width="120" Visible="false"></asp:TextBox>
                </p>
                <!-- 
                <p><asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="StatusTextBox" runat="server" Text="" Width="90%" Height="40" TextMode="MultiLine" Visible="false"></asp:TextBox>                
                </p>-->
                <p>
                    <a href="#"><img src="images/Share Icons/sina.png" width="24" height="24" alt="" /></a>&nbsp;&nbsp;
                    <a href="#"><img src="images/Share Icons/qzone.png" width="24" height="24" alt="" /></a>&nbsp;&nbsp;
                    <a href="#"><img src="images/Share Icons/qspace.png" width="24" height="24" alt="" /></a>&nbsp;&nbsp;
                    <a href="#"><img src="images/Share Icons/ren.png" width="24" height="24" alt="" /></a>&nbsp;&nbsp;
                    <a href="#"><img src="images/Share Icons/qq.png" width="24" height="24" alt="" /></a>&nbsp;&nbsp;
                </p>                
                <p>
                    <asp:Label ID="IntroductionLabel" runat="server" Text="Label"></asp:Label>
                    <asp:TextBox ID="IntroductionTextBox" runat="server" Text="" Visible="false" TextMode="MultiLine" Width="100%" Height="80" style="word-wrap:break-word;word-break:break-all;"></asp:TextBox>
                </p>
                <!-- <p><a href="#">&gt;&gt;进去瞧瞧</a></p> -->
            </div>
            </ContentTemplate></asp:UpdatePanel>
        </div>
    </div>
    
    <!-- 页脚 -->

    <div class="BlueBackground Foot">
    <br />    
    <p>版权所有 2012-2013 &copy; <a href="http://gdin.edu.cn" target="_blank">广东技术师范学院</a> <a href="Index.aspx">教育技术与传播学院</a> <a href="#">现代教育技术中心</a></p>
	<p>网站开通日期：2013-05-01 | 技术支持：Justin | 联系邮箱：21646523@QQ.com </p>
<br />
    </div>
 
<div style="background-color:#F90;height:8px;">&nbsp;</div>
    </form>
</body>
<script type="text/javascript">
    $(function() {
        var vTopBigImage = $("#TopBigImage");
        var vTopSwitch = true;
        $("#EditHyperLink").click(function() { if (vTopSwitch) { vTopBigImage.slideDown(); vTopSwitch = false; } else { vTopBigImage.slideUp(); vTopSwitch = true;} return false; });
        setBox();

        $("#Button1").click(function() {
            setBox(); //alert($("#ProfileRect").css("opacity"));
            return false;
        });

        function setBox() {                        
            var ProfileRectDiv = $("#ProfileRect");
            var ProfileBoxDiv = $("#ProfileBox");
            var vBoxTop = $("#BoxTop").val();
            var vBoxLeft = $("#BoxLeft").val();
            var vBoxWidth = $("#BoxWidth").val();
            var vBoxHeight = $("#BoxHeight").val();
            var vBoxOpacity = $("#BoxOpacity").val();

            ProfileBoxDiv.css({
                "top": vBoxTop + "px",
                "left": vBoxLeft + "px",
                "width": vBoxWidth + "px",
                "height": vBoxHeight + "px"
            });

            ProfileRectDiv.css({
                "top": vBoxTop + "px",
                "left": vBoxLeft + "px",
                "width": vBoxWidth + "px",
                "height": vBoxHeight + "px",
                "opacity": vBoxOpacity
            });
        }
    });
    
</script>
</html>
