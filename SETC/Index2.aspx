<%@ Page Title="" Language="C#" MasterPageFile="~/frontend.master" AutoEventWireup="true" CodeFile="Index2.aspx.cs" Inherits="Index2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

<section id="content">
    <section class="section full-width-bg full-width-slider-section">

        <div class="row">

            <div class="col-lg-12 col-md-12 col-sm-12">

                <!-- Revolution Slider -->
                <div class="tp-banner-container main-revolution">

                    <span class="Apple-tab-span"></span>

                    <div class="tp-banner full-width-revolution">

                        <ul>
                            <asp:Repeater ID="Repeater1" runat="server"> 
                                <ItemTemplate>
                                    <li data-transition="papercut" data-slotamount="7">
                                   
                                        <img src='<%# Eval("PhotoSrc") %>' alt='<%# Eval("PhotoTitle") %>' />

                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>

                    </div>

                </div>
                <!-- /Revolution Slider -->

            </div>                  

        </div>

    </section>

    <!-- Section -->
    <section class="section full-width-bg gray-bg">
        <div class="my-bg">
        <div class="row">

            <div class="col-lg-8 col-md-8 col-sm-8">

                <h3 class="my-title animate-onscroll no-margin-top">最新要闻</h3>
                <asp:Repeater ID="Repeater5" runat="server"> 
                <ItemTemplate>
                <!-- Blog Post -->
                <div class="blog-post big animate-onscroll">

                    <div class="post-image">
                        <img src="/img/3223.png" alt="">
                    </div>

                    <h4 class="post-title"><a href="blog-single-sidebar.html">教育技术与传播学院党委组织党员观看《建党伟业》 </a></h4>

                    <div class="post-meta">
                        <span>作者：<a href="#">admin</a></span>
                        <span>日期：2016-06-27</span>
                    </div>

                    <p>为纪念中国共产党建立95周年，了解中国共产党的建党历史，了解......</p>

                    <a href="blog-single-sidebar.html" class="button read-more-button big button-arrow">详细</a>

                </div>
                <!-- /Blog Post -->                
                <div style="margin-bottom:10px;"></div>
                </ItemTemplate>
                </asp:Repeater>
            </div>



            <!-- Sidebar -->
            <div class="col-lg-4 col-md-4 col-sm-12 animate-onscroll">
                
                <!-- Tabs -->
                <div class="tabs">

                    <div class="tab-header">
                        <ul>
                            <li><a href="#tab11">
                                <h6>学生通知</h6>
                            </a></li>&nbsp;&nbsp;
                            <li><a href="#tab22">
                                <h6>教师通知</h6>
                            </a></li>
                        </ul>
                    </div>

                    <div class="tab-content">

                        <div id="tab11" class="tab"><div class="box">
                            <ul class="upcoming-events">
                                <asp:Repeater ID="Repeater3" runat="server"> 
                                <ItemTemplate>
                                <!-- Event -->
                                <li>
                                    <div class="date">
                                        <span>
                                            <span class="day"><%# Container.ItemIndex + 1%> </span>
                                        </span>
                                    </div>

                                    <div class="event-content">
                                        <h6><a href="event-post-v2.html"><%# Eval("Title") %></a></h6>
                                        <ul class="event-meta">
                                            <li><i class="icons icon-clock"></i> <%# String.Format("{0:yyyy-MM-dd}",Eval("CDT") ) %></li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- /Event -->
                                </ItemTemplate>
                                </asp:Repeater>
                                

                            </ul>
                            <div style="float:right;"><p><a href="Article_List2.aspx?ID=7">更多 >></a></p></div>
                        </div></div>

                        <div id="tab22" class="tab">
                            <div class="box">
                            <ul class="upcoming-events">
                                <asp:Repeater ID="Repeater4" runat="server"> 
                                <ItemTemplate>
                                <!-- Event -->
                                <li>
                                    <div class="date">
                                        <span>
                                            <span class="day"><%# Container.ItemIndex + 1%> </span>
                                        </span>
                                    </div>

                                    <div class="event-content">
                                        <h6><a href="event-post-v2.html"><%# Eval("Title") %></a></h6>
                                        <ul class="event-meta">
                                            <li><i class="icons icon-clock"></i> <%# String.Format("{0:yyyy-MM-dd}",Eval("CDT") ) %></li>
                                        </ul>
                                    </div>
                                </li>
                                <!-- /Event -->
                                </ItemTemplate>
                                </asp:Repeater>
                                

                            </ul>
                            <div style="float:right;"><p><a href="Article_List2.aspx?ID=6">更多 >></a></p></div>
                            </div>
                        </div>

                    </div>

                </div>
                <!-- /Tabs -->
            </div>
            <!-- /Sidebar -->


            <div class="col-lg-12 col-md-12 col-sm-12">
						
						<!-- Media Filters -->
						<div class="media-filters animate-onscroll">
							
								<h3 class="my-title">学院新闻</h3>
														
						</div>
						<!-- /Media Filters -->

						<div class="media-items row">
							
							<div class="col-lg-6 col-md-6 col-sm-12 mix category-photos" data-nameorder="1" data-dateorder="3">
							
																						<!-- Media Item -->
							<div class="media-item animate-onscroll ">							
																								
								<div class="media-info">
								
									<div class="media-header">
										
										<div class="media-format">
											<div>
											<i class="icons icon-picture"></i>
											</div>
										</div>
										
										<div class="media-caption">
											<h2><a href="portfolio-single-sidebar.html">学院动态</a></h2>
										</div>
										
									</div>
									
									<div class="media-description"><div class="box">
										<asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" ShowHeader="false" Width="100%">
                                        <columns>
                                            <asp:templatefield headertext="序" headerstyle-horizontalalign="Center">
                                                <itemtemplate>
                                                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                </itemtemplate>
                                                <itemstyle width="20px" horizontalalign="left" />
                                            </asp:templatefield>
                                            <asp:hyperlinkfield datanavigateurlfields="ID,Title"
                                                                datanavigateurlformatstring="Article_View.aspx?ID={0}&T={1}" datatextfield="Title"
                                                                headertext="标题" itemstyle-horizontalalign="Left">
                                            </asp:hyperlinkfield>
                                            <asp:boundfield datafield="CDT" headertext="创建日期" dataformatstring="{0:MM-dd}" itemstyle-width="25%" itemstyle-horizontalalign="Left" />
                                        </columns>
                                    </asp:GridView>
									</div></div>
									
									<div class="media-button"  style="float:right;">
										<a href="#">更多 >></a>
									</div>
								
								</div>
								
																
							</div>
							<!-- /Media Item -->							
							</div>
							
							<div class="col-lg-6 col-md-6 col-sm-12 mix category-videos category-meetings" data-nameorder="2" data-dateorder="1">
							
																						<!-- Media Item -->
							<div class="media-item animate-onscroll ">															
																
								<div class="media-info">
								
									<div class="media-header">
										
										<div class="media-format">
											<div>
											<i class="icons icon-video"></i>
											</div>
										</div>
										
										<div class="media-caption">
											<h2><a href="portfolio-single-sidebar.html">活动剪影</a></h2>
										</div>
										
									</div>
									
									<div class="media-description"><div class="box">
										<asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" ShowHeader="false" Width="100%">
                                        <columns>
                                            <asp:templatefield headertext="序" headerstyle-horizontalalign="Center">
                                                <itemtemplate>
                                                    <asp:Label ID="lblNo" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                                                </itemtemplate>
                                                <itemstyle width="20px" horizontalalign="left" />
                                            </asp:templatefield>
                                            <asp:hyperlinkfield datanavigateurlfields="ID,Title"
                                                                datanavigateurlformatstring="Article_View.aspx?ID={0}&T={1}" datatextfield="Title"
                                                                headertext="标题" itemstyle-horizontalalign="Left">
                                            </asp:hyperlinkfield>
                                            <asp:boundfield datafield="CDT" headertext="创建日期" dataformatstring="{0:MM-dd}" itemstyle-width="25%" itemstyle-horizontalalign="Left" />
                                        </columns>
                                    </asp:GridView>
									</div></div>
									
									<div class="media-button"  style="float:right;">
										<a href="#">更多 >></a>
								    </div>
								
								</div>
								
																
							</div>
							<!-- /Media Item -->							
							</div>

							
						</div>
						
						
					</div>

                </div>
                </div>




        <div class="row no-margin-bottom">


            <div class="col-lg-12 col-md-12 col-sm-12">


                <!-- Owl Carousel -->
                <div class="owl-carousel-container">

                    <div class="owl-header">

                        <h3 class="my-title animate-onscroll">作品展示</h3>
                        
                        <div class="carousel-arrows animate-onscroll">
                            <span class="left-arrow"><i class="icons icon-left-dir"></i></span>
                            <span class="right-arrow"><i class="icons icon-right-dir"></i></span>
                            <a href="Article_List2.aspx?ID=6" >更多>></a>
                        </div>

                    </div>

                    <div class="owl-carousel" data-max-items="4">

                        <!-- Owl Item -->
                        <div>

                            <!-- Blog Post -->
                            <div class="blog-post animate-onscroll">

                                <div class="post-image">
                                    <img src="img/0391.jpg"" alt="">
                                </div>

                                <h4 class="post-title"><a href="blog-single-sidebar.html">《Web编程》课程期末作品（11师范） </a></h4>

                                <div class="post-meta">
                                    <span>作者： <a href="#">admin</a></span>
                                    <span>日期：2014-04-01</span>
                                </div>

                                <p>《Web编程》课程以网站设计作为期末考核作品，本次展示的优秀作品有《T-SZone教学空间》、《乐游旅游网》、《Doris珠宝网站》等</p>

                                <a href="blog-single-sidebar.html" class="button read-more-button big button-arrow">详细</a>

                            </div>
                            <!-- /Blog Post -->

                        </div>
                        <!-- /Owl Item -->
                        <!-- Owl Item -->
                        <div>

                            <!-- Blog Post -->
                            <div class="blog-post animate-onscroll">

                                <div class="post-image">
                                    <img src="img/0391.jpg" alt="">
                                </div>

                                <h4 class="post-title"><a href="blog-single-sidebar.html">《Web编程》课程期末作品（11师范）</a></h4>

                                <div class="post-meta">
                                    <span>作者： <a href="#">admin</a></span>
                                    <span>日期：2014-04-01</span>
                                </div>

                                <p>《Web编程》课程以网站设计作为期末考核作品，本次展示的优秀作品有《T-SZone教学空间》、《乐游旅游网》、《Doris珠宝网站》等</p>

                                <a href="blog-single-sidebar.html" class="button read-more-button big button-arrow">详细</a>

                            </div>
                            <!-- /Blog Post -->

                        </div>
                        <!-- /Owl Item -->
                        <!-- Owl Item -->
                        <div>

                            <!-- Blog Post -->
                            <div class="blog-post animate-onscroll">

                                <div class="post-image">
                                    <img src="img/0391.jpg"" alt="">
                                </div>

                                <h4 class="post-title"><a href="blog-single-sidebar.html">《Web编程》课程期末作品（11师范）</a></h4>

                                <div class="post-meta">
                                    <span>作者： <a href="#">admin</a></span>
                                    <span>日期：2014-04-01</span>
                                </div>

                                <p>《Web编程》课程以网站设计作为期末考核作品，本次展示的优秀作品有《T-SZone教学空间》、《乐游旅游网》、《Doris珠宝网站》等</p>

                                <a href="blog-single-sidebar.html" class="button read-more-button big button-arrow">详细</a>

                            </div>
                            <!-- /Blog Post -->

                        </div>
                        <!-- /Owl Item -->
                        <!-- Owl Item -->
                        <div>

                            <!-- Blog Post -->
                            <div class="blog-post animate-onscroll">

                                <div class="post-image">
                                    <img src="img/0391.jpg"" alt="">
                                </div>

                                <h4 class="post-title"><a href="blog-single-sidebar.html">《Web编程》课程期末作品（11师范）</a></h4>

                                <div class="post-meta">
                                    <span>作者：  <a href="#">admin</a></span>
                                    <span>日期：2014-04-01</span>
                                </div>

                                <p>《Web编程》课程以网站设计作为期末考核作品，本次展示的优秀作品有《T-SZone教学空间》、《乐游旅游网》、《Doris珠宝网站》等</p>

                                <a href="blog-single-sidebar.html" class="button read-more-button big button-arrow">详细</a>

                            </div>
                            <!-- /Blog Post -->

                        </div>
                        <!-- /Owl Item -->
                        <!-- Owl Item -->
                        <div class="post2 post2-works">
                
                        <div>
                            <!--  -->
                            <div class="shade"></div>
                            <!--  -->
                            <!-- Blog Post -->
                            <div class="blog-post animate-onscroll">

                                <div class="post-image cover pos"><a>
                                    <img src="img/0391.jpg"" alt=""></a>
                                </div>
                                <div class="info">
                                <h4 class="post-title"><a href="blog-single-sidebar.html">《Web编程》课程期末作品（11师范）</a></h4>

                                <div class="post-meta">
                                    <span>作者： <a href="#">admin</a></span>
                                    <span>日期：2014-04-01</span>
                                </div>

                                <p>《Web编程》课程以网站设计作为期末考核作品，本次展示的优秀作品有《T-SZone教学空间》、《乐游旅游网》、《Doris珠宝网站》等</p>

                                <a href="blog-single-sidebar.html" class="button read-more-button big button-arrow">详细</a>
</div>
                            </div>
                            <!-- /Blog Post -->
                                                    </div>
                        </div>
                        <!-- /Owl Item -->

                        <%--<asp:Repeater ID="Repeater2" runat="server"> 
                        <ItemTemplate>
                        <!-- Owl Item -->
                        <div>

                            <!-- Blog Post -->
                            <div class="blog-post animate-onscroll">

                                <div class="post-image">
                                    <img src='<%# Eval("CoverPhotoURL") %>' alt="" height="155" >
                                </div>

                                <h4 class="post-title"><a href='Show_View.aspx?ID=<%# Eval("ID") %>&c=<%# Eval("Catalog") %>&T=<%# Eval("Title") %>'><%# Eval("Title") %></a></h4>

                                <div class="post-meta">
                                    <span>作者： <a href="#"><%# Eval("Author") %></a></span>
                                    <span>日期： <%# String.Format("{0:yyyy-MM-dd}",Eval("CDT") ) %></span>
                                </div>

                                <%--<p><%# Eval("Abs") %></p>--%>

                                <%--<a href="blog-single-sidebar.html" class="button read-more-button big button-arrow">详细</a>

                            </div>
                            <!-- /Blog Post -->

                        </div>
                        </ItemTemplate>
                        </asp:Repeater>--%>
                        <!-- /Owl Item -->
                        

                    </div>

                </div>
                <!-- /Owl Carousel -->
            </div>



        </div>

        <%--<div class="wpn" id="project">--%>
        <!--  -->
        <!--  -->
            <%--<div class="post2 post2-works">
                
                        <div>
                            <!--  -->
                            <div class="shade"></div>
                            <!--  -->
                            <div class="cover pos">
                                <a href="/detail/129983.html" target="_blank" title="公司官网插图设计">
                                    <img width="280" height="210" src="http://img.ui.cn/data/file/5/7/7/772775.jpg" data-original="http://img.ui.cn/data/file/5/7/7/772775.jpg" class="imgloadinglater" alt="公司官网插图设计" rel="nofollow">
                                </a>
                            </div>
                            <div class="info">
                                <%--<h4 class="title ellipsis download">
                                                                        公司官网插图设计                                </h4>
                                                                <div class="msg mtn cl">
                                    <span class="classify">原创</span>
                                    <span><i class="icon-eye" title="浏览数"></i><em>337</em></span>
                                    <span><i class="icon-comment" title="评论数"></i><em>3</em></span>
                                    <span><i class="icon-leaf" title="点赞数"></i><em>27</em></span>
                                </div>
                                <p class="user cl">
                                    <a href="http://i.ui.cn/ucenter/77975.html" target="_blank"><img src="http://imgavater.ui.cn/avatar/5/7/9/7/77975.jpeg?imageMogr2/auto-orient/crop/!600x600a100a50/thumbnail/60x60" title="馬十八"> <strong class="name">
                                        <em>馬十八</em> 
                                    <i class="cert icon-certified2" title="UI中国认证设计师"></i>                                    </strong></a>
                                </p>--%>
                            <%--</div>--%>
                            <!--  分隔线  -->
                            <%--<div class="line"></div>--%>
                        <%--</div>
                </div>--%>
            <%--<div class="h_page mtn mbw">
                <ul class='cl'><li><a class='on' href='javascript:;'>1</a></li><li><a href='?p=2#project'>2</a></li><li><a href='?p=3#project'>3</a></li><li><a href='/list.html?r=main&p=2' target='_blank'>...</a></li></ul>            </div>--%>
            <!--  -->
<%--</div>--%>
    </section>
    <!-- /Section -->
</section>

</asp:Content>

