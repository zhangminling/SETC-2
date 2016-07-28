<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Slider_LeftToRight.aspx.cs" Inherits="Slider_LeftToRight" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Slider Focus</title>
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
#Focus
{
    position:relative;
    width:700px;
    height:290px;
    overflow:hidden;
    left:50px;
    top:80px;
    border:1px solid red;   
}
#Slider
{
    position:relative;        
    height:270px;
    left:0px;
}
#Slider a
{
    padding:0;
    margin:0;
}
/*
#Focus a
{
    display:block;
    width:700px;
    height:290px;
    position:relative;
}
*/
</style>
<script src="js/jquery-1.9.0.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div><a id="PreBtn" href="#"><<上一张></a> | 
    <a id="NextBtn" href="#">下一张>></a>
    </div>
    <div id="Focus">
    <div id="Slider">
        <asp:Repeater ID="Repeater1" runat="server">    
        <ItemTemplate><a href="#"><asp:Image ID="SliderImage1" runat="server" ImageUrl='<%# Eval("PhotoSrc") %>' AlternateText='<%# Eval("PhotoTitle") %>' /></a></ItemTemplate>
        </asp:Repeater>
    </div>  
    </div>
    </form>
</body>
<script type="text/javascript">
    $(function() {
        var viewWidth = $("#Focus").width(); //每一张图片的宽度
        var sliderLength = $("#Slider a").length; //总的图片数
        var sliderIndex = 0; //当前图片的下标
        var nextSlider = function() {
            if (!$("#Slider").is(":animated")) {
                if (sliderLength == sliderIndex + 1) {
                    $("#Slider").animate({ left: '0px' }, "slow");
                    sliderIndex = 0;
                } else {
                    $("#Slider").animate({ left: '-=' + viewWidth }, "slow");
                    sliderIndex += 1;
                }
            }
        }
        var preSlider = function() {
            if (!$("#Slider").is(":animated")) {
                if (sliderIndex == 0) {
                    $("#Slider").animate({ left: -viewWidth*(sliderLength-1) }, "slow");
                    sliderIndex = sliderLength - 1;
                } else {
                    $("#Slider").animate({ left: '+=' + viewWidth }, "slow");
                    sliderIndex -= 1;
                }
            }
        }
        $("#NextBtn").click(nextSlider);
        $("#PreBtn").click(preSlider);
        var rotator = setInterval(nextSlider, 3000);
        $("#Focus").hover(function() { clearInterval(rotator); }, function() { rotator = setInterval(nextSlider, 3000); });
    });
</script>
</html>
