<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test_Nav.aspx.cs" Inherits="Test_Nav" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>导航栏</title>
    <link rel="stylesheet" href="Master.css" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/Master.js"></script>    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <ul id="NavMenu">
        <li style="margin-left:30px;"><a href="Index.aspx">首页</a></li>
        <li><a href="Article_List2.aspx?ID=1">学院概况</a>
            <span>
                <a href="Article_List2.aspx?ID=1">学院简介</a> |
                <a href="Article_List2.aspx?ID=2">领导班子</a> |
                <a href="Article_List2.aspx?ID=3">机构设置</a> |
                <a href="Article_List2.aspx?ID=4">系和教研室</a> | 
                <a href="Article_List2.aspx?ID=50">教育技术中心</a> 
            </span>
        </li>
        <li><a href="Article_List.aspx?c=新闻通知">新闻通知</a>
           <span>
                <a href="Article_List2.aspx?ID=5">学院动态</a> |
                <a href="Article_List2.aspx?ID=6">教师通知</a> |
                <a href="Article_List2.aspx?ID=7">学生通知</a>
            </span> 
        </li>
        <li><a href="Article_List.aspx?c=学生园地">学生园地</a>
           <span>
                <a href="Article_List2.aspx?ID=7">学生通知</a> |
                <a href="Article_List2.aspx?ID=39">活动剪影</a> |
                <a href="Article_List2.aspx?ID=48">周程安排</a> |
                <a href="Article_List2.aspx?ID=17">招聘信息</a> |
                <a href="Article_List2.aspx?ID=49">花名册</a>
            </span> 
        </li>
        <li><a href="Article_List2.aspx?ID=8">学科专业</a>
            <span>
                <a href="Article_List2.aspx?ID=8">专业设置</a> |
                <a href="Article_List2.aspx?ID=40">教育技术学</a> |
                <a href="Article_List2.aspx?ID=41">广播电视编导</a> |
                <a href="Article_List2.aspx?ID=42">数字媒体技术</a> |                
                <a href="Article_List2.aspx?ID=46">网络与新媒体</a> | 
                <a href="Article_List2.aspx?ID=12">实验中心</a> |
                <a href="Article_List2.aspx?ID=13">实践基地</a>                
            </span>
        </li>
        <li><a href="Article_List2.aspx?ID=14">招生就业</a>
        	<span>
        	    <a href="Article_List2.aspx?ID=14">本科生招生</a> |
        	    <a href="Article_List2.aspx?ID=15">研究生招生</a> |
                <a href="Article_List2.aspx?ID=16">学生就业</a> |                
                <a href="Article_List2.aspx?ID=17">招聘信息</a>             
            </span>
        </li>
        <li><a href="Article_List2.aspx?ID=18">师资队伍</a>
            <span>
        	    <a href="Article_List2.aspx?ID=18">师资力量</a> |
        	    <a href="Article_List2.aspx?ID=19">教师简介</a>                
            </span>        	
        </li>
        <!--
        <li><a href="Article_List2.aspx?ID=20">教学科研</a>
            <span>
                <a href="Article_List2.aspx?ID=20">教学成果</a> |
                <a href="Article_List2.aspx?ID=21">科研成果</a> |
                <a href="Article_List2.aspx?ID=22">教师获奖</a> |
                <a href="Article_List2.aspx?ID=23">学生获奖</a>                
            </span>
        </li>
        -->
        <li><a href="Article_List2.aspx?ID=24">学生活动</a>
            <span>
                <a href="Article_List2.aspx?ID=24">学生社团</a> |
                <a href="Article_List2.aspx?ID=25">广师视频</a> |
                <a href="Article_List2.aspx?ID=26">数媒协会</a> |
                <a href="Article_List2.aspx?ID=27">社会实践</a> |
                <a href="Article_List2.aspx?ID=39">活动剪影</a>
            </span>
        </li>
        <li><a href="Show_List.aspx">作品展示</a>
            <span>
                <a href="Show_List.aspx?ID=1&c=影视作品">影视作品</a> |
                <a href="Show_List.aspx?ID=2&c=摄影作品">摄影作品</a> |
                <a href="Show_List.aspx?ID=3&c=多媒体课件">多媒体课件</a> |
                <a href="Show_List.aspx?ID=8&c=平面设计">平面设计</a> |
                <a href="Show_List.aspx?ID=4&c=数字期刊">数字期刊</a> |                
                <a href="Show_List.aspx?ID=5&c=动漫游戏">动漫游戏</a> |
                <a href="Show_List.aspx?ID=6&c=网站设计">网站设计</a> |
                <a href="Show_List.aspx?ID=7&c=移动媒体">移动媒体</a>                               
            </span>
        </li>
        <li><a href="#">党团校友</a>
            <span>
                <a href="Article_List2.aspx?ID=35">党建工作</a> |
                <a href="Article_List2.aspx?ID=36">团建工作</a> |
                <a href="Article_List2.aspx?ID=37">校友荣誉</a> |
                <a href="Article_List2.aspx?ID=38">校友通讯录</a>
            </span>
        </li>
        <li><a href="#">下载中心</a>
            <span>
                <a href="Article_List2.aspx?ID=43">教师表格</a> |
                <a href="Article_List2.aspx?ID=44">学生表格</a> |
                <a href="Article_List2.aspx?ID=45">资源下载</a>
            </span>
        </li>
    </ul>  
    </div>
    </form>
</body>
</html>
