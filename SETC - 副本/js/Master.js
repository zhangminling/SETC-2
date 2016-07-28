$(document).ready(function() {
    $(".showList img").hover(function() { $(this).css({ "opacity": 0.5 }); }, function() { $(this).css({ "opacity": 1 }); });

    // 搜索栏
    $("#SearchImg").hover(function() { $(this).css({ "opacity": 0.5, "cursor": "pointer" }); }, function() { $(this).css({ "opacity": 1, "cursor": "auto" }); });

    // 二级菜单
    $("ul#NavMenu li").hover(function() { //Hover over event on list item
        $(this).css({ 'background-color': '#1376c9', 'color': '#fff' }); //Add background color + image on hovered list item
        $(this).find("span").show(); //Show the subnav
        //$(this).find("span").css({'width':'1000px'});
        var textIndent = $(this).find("span").css("text-indent"); //获取子栏目的缩进
        var menuIndex = $(this).index(); //获取当前主栏目的位置序号
        var subItems = $(this).find("span").find("a").length; //获取子栏目的数量
        var menuWidth = 100;
        var subMiddle = menuIndex * menuWidth + menuWidth / 2;
        var subLeft = subMiddle - subItems * menuWidth / 2;
        var subRight = subMiddle + subItems * menuWidth / 2;
        //alert("menuIndex="+menuIndex+"temp="+temp);
        if (subLeft < 120) {
            subLeft = 120;
        }
        if (subRight > 970) {
            subLeft = subLeft - (subRight - 970);
        }

        var subPosition = subLeft + "px";
        $(this).find("span").css({ "text-indent": subPosition });
        //alert();
    }, function() { //on hover out...
        $(this).css({ 'background-color': '#fff' }); //Ditch the background
        $(this).find("span").hide(); //Hide the subnav
    });

    // slider begin
    var pageCount = 4;
    var pageIndex = 0;
    function doRotateImages(curIndex, nextIndex) {
        var curPhoto = $('#photoShow div').eq(curIndex);
        var curPage = $('#photoPage span').eq(curIndex);
        var nextPhoto = $('#photoShow div').eq(nextIndex);
        var nextPage = $('#photoPage span').eq(nextIndex);
        curPhoto.removeClass('current').addClass('previous');
        curPage.removeClass('pageCurrent').addClass('pageNormal');
        nextPage.removeClass('pageNormal').addClass('pageCurrent');
        $("#photoCaptionText").html($("#photoCaptionTextList li").eq(nextIndex).html());
        nextPhoto.css({ opacity: 0.0 }).addClass('current').animate({ opacity: 1.0 }, 1000,
            function() {
                curPhoto.removeClass('previous');
            });
    }

    //rotateImages的函数变量定义，必须在调用它的前面 
    var rotateImages = function() {
        var oldPageIndex = pageIndex; //保留上一张图片的index
        pageIndex++;
        if (pageIndex == pageCount) {
            pageIndex = 0;
        }
        doRotateImages(oldPageIndex, pageIndex);
    }

    var rotator = setInterval(rotateImages, 3000);

    $("#photoShow img").hover(function() { clearInterval(rotator); }, function() { rotator = setInterval(rotateImages, 3000); });

    $("#photoPage span").hover(function() { clearInterval(rotator); }, function() { rotator = setInterval(rotateImages, 3000); });

    $("#photoPage span").click(function() {
        var oldPageIndex = pageIndex; //保留上一张图片的index
        pageIndex = $(this).index(); //得到当前点击的图片的index
        //进行一个效果变换，切换到当前图片
        doRotateImages(oldPageIndex, pageIndex);
    });

});
