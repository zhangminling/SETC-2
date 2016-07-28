<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SETC._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Profile</title>
    <link rel="stylesheet" href="Master.css" type="text/css" />
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
        padding:24px 0;        
        height:32px;
        line-height:32px;
        background-color:#005fb1;	
	    color:#FFFFFF;		             
        margin-bottom:1px;     
    }
    #TopMenu
    {
        width:960px;
        padding:0px 20px;
        margin: 0 auto;
        font-size:13px;    
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
    
    
    #TopBigImage
    {
        display:none;
    }
    #TopBigImage p
    {
        margin-top:5px;
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
    #ProfileBox h1
    {
        font-size:48px;
        margin:20px 0px;
    }
    #ProfileBox p
    {
        font-size:16px;        
        padding:10px 10px;
    }
    #ProfileBox ul 
    {
        padding:0 20px;
    }
    #ProfileBox ul li
    {
        font-size:16px;
        height:32px;
        line-height:32px;
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
    </asp:ScriptManager><div style="background-color:#F90;height:8px;">&nbsp;</div>
        <div class="BlueBackground Foot">
    <p>&nbsp;</p>
    <p>版权所有 2012-2013 @ <a href="#">广东技术师范学院</a> <a href="#">教育技术与传播学院</a> <a href="#">现代教育技术中心</a></p>
	<p>网站开通日期：2013-05-01 | 技术支持：Justin | 联系邮箱：21646523@QQ.com </p>
    <p>&nbsp;</p>
    </div>
 


    <div style="background-color:#F90;height:8px;">&nbsp;</div>
    <div id="Top">
        <div id="TopMenu">
            <a href="Index.aspx" target="_blank">教育技术与传播学院</a>&nbsp;&nbsp;|&nbsp;&nbsp;                
            <asp:Label id="UserIDLabel" runat="server" visible="false" Text=""></asp:Label>
            <asp:Label id="UserNameLabel" runat="server" Text=""></asp:Label> 的用户首页 &nbsp;&nbsp;                
            &nbsp;&nbsp;
            &nbsp;&nbsp;
            </div>
    </div>
    </form>
</body>
</html>
