/*!
 * description: 首页列表展示效果
 * require: jquery-1.10.2.js
 * relevancy: post.css
 * 
 * date: 2015-07-10
 * update:
 */

$(function(){
	// 滑过显示阴影框
	$(document).on('mouseenter', '.post2 div', function(){
	    $(this).find('.user').addClass('on'); //用户名变颜色
	    $(this).find('.shade')
	        .stop()
	        .animate({ opacity : '1'}, 300)
	});
	$(document).on('mouseleave', '.post2 div', function(){
	    $(this).find('.user').removeClass('on');
	    $(this).find('.shade')
	        .stop()
	        .animate({ opacity : '0'}, 300)
	});

});