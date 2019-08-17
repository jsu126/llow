<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>首页</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/hmstyle.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/skin.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/shopCatr.js"></script>
<script type="text/javascript">
	$(
			function() {
				shopCart("${pageContext.request.contextPath}/product/shopCartCount?time="
						+ new Date().getTime());
			})
</script>
<style type="text/css">
	a:hover {
		color:red;
}
.nav-cont ul > li a:hover{
	color:red;
}
</style>
</head>

<body>
	<div class="hmtop">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:if test="${sessionScope.user==null}">
							<a href="${pageContext.request.contextPath}/login.jsp"
								target="_top" class="h">亲，请登录</a>
							<a href="${pageContext.request.contextPath}/register.jsp"
								target="_top">免费注册</a>
						</c:if>
						<c:if test="${sessionScope.user!=null}">
							<a href="${pageContext.request.contextPath}/information.jsp"
								target="_top" class="h">${sessionScope.user.username}</a>
							<a href="${pageContext.request.contextPath}/user/exit"
								target="_top">退出</a>
						</c:if>

					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="#" target="_top" class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="${pageContext.request.contextPath}/information.jsp"
							target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd"
							href="${pageContext.request.contextPath}/shopCart/listShopCarts"
							target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
				<div class="topMessage favorite">
					<div class="menu-hd">
						<a href="${pageContext.request.contextPath}/user/collection"
							target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
					</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
			<div class="logo">
				<img src="${pageContext.request.contextPath}/images/logo.png" />
			</div>
			<div class="logoBig">
				<li><img
					src="${pageContext.request.contextPath}/images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form
					action="${pageContext.request.contextPath}/product/productSearch?pageNum=1"
					method="post">
					<input id="searchInput" name="productSearchName" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	<div class="banner">
		<!--轮播 -->
		<div class="am-slider am-slider-default scoll" data-am-flexslider
			id="demo-slider-0">
			<ul class="am-slides">
				<li class="banner1" style="background: #6b7074"><a
					href="${pageContext.request.contextPath}/product/productInfo?pid=P1565839644563"><img
						src="${pageContext.request.contextPath}/images/61.jpg"
						style="height: 430px" /></a></li>
				<li class="banner2" style="background: #333;"><a href="${pageContext.request.contextPath}/product/productInfo?pid=P1565849192045">
				<img
						src="${pageContext.request.contextPath}/images/81.jpg"
						style="height: 430px" /></a></li>
				<li class="banner3" style="background: #f1eeda;"><a><img
						src="${pageContext.request.contextPath}/images/picture5.png"
						style="height: 430px" /></a></li>
				<li class="banner4" style="background: #ffede2;"><a><img
						src="${pageContext.request.contextPath}/images/picture4.png"
						style="height: 430px" /></a></li>

			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="shopNav">
		<div class="slideall">

			<div class="long-title">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="${pageContext.request.contextPath}"
						target="_top" class="h">首页</a></li>
					<li class="qc"><a
						href="${pageContext.request.contextPath}/product/productGenre?pageNum=1&genre=loverStatus">恋人</a></li>
					<li class="qc"><a
						href="${pageContext.request.contextPath}/product/productGenre?pageNum=1&genre=friendStatus">朋友</a></li>
					<li class="qc"><a
						href="${pageContext.request.contextPath}/product/productGenre?pageNum=1&genre=kinsfolkStatus">亲人</a></li>
					<li class="qc last"><a
						href="${pageContext.request.contextPath}/product/productGenre?pageNum=1&genre=holidayStatus">节日</a></li>
				</ul>

			</div>

			<!--侧边导航 -->
			<div id="nav" class="navfull">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">
						<div class="category">
							<ul id="myTable" class="category-list" id="js_climit_li">

							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--轮播-->

			<script type="text/javascript">
				(function() {
					$('.am-slider').flexslider();
				});
				$(document)
						.ready(
								function() {
									$("li")
											.hover(
													function() {
														$(
																".category-content .category-list li.first .menu-in")
																.css("display",
																		"none");
														$(
																".category-content .category-list li.first")
																.removeClass(
																		"hover");
														$(this).addClass(
																"hover");
														$(this)
																.children(
																		"div.menu-in")
																.css("display",
																		"block")
													},
													function() {
														$(this).removeClass(
																"hover")
														$(this).children(
																"div.menu-in")
																.css("display",
																		"none")
													});
								})
			</script>



			<!--小导航 -->
			<div class="am-g am-g-fixed smallnav">
				<div class="am-u-sm-3">
					<a href="sort.html"><img src="images/navsmall.jpg" />
						<div class="title">商品分类</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="images/huismall.jpg" />
						<div class="title">大聚惠</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="images/mansmall.jpg" />
						<div class="title">个人中心</div> </a>
				</div>
				<div class="am-u-sm-3">
					<a href="#"><img src="images/moneysmall.jpg" />
						<div class="title">投资理财</div> </a>
				</div>
			</div>

			<!--走马灯 -->

			<div class="marqueen" style="top:90px;">
				<span class="marqueen-title">商城头条</span>
				<div class="demo">
					<ul>
						<li class="title-first">
							<span style="color:#000" >当前位置：<em id="city" style="color:red"></em></span>
						</li>
						<div class="mod-vip">
							<c:if test="${user!=null}">
								<div class="m-baseinfo">
									<c:if test="${user.picture!=null}">
										<a href="${pageContext.request.contextPath}/information.jsp">
											<img src="${user.picture}" />
										</a>

									</c:if>
									<c:if test="${user.picture==null}">
										<a href="${pageContext.request.contextPath}/information.jsp">
											<img src="images/getAvatar.do.jpg" />
										</a>
									</c:if>

									<em> Hi,<span class="s-name">${user.username}</span>
									</em>
								</div>
								<div class="member-logout" style="text-align: center;">
									<a class="am-btn-warning btn"
										href="${pageContext.request.contextPath}/user/exit">退出</a>

								</div>
							</c:if>

							<c:if test="${user==null}">
								<div class="m-baseinfo">

									<a href="${pageContext.request.contextPath}/login.jsp"> <img
										src="images/getAvatar.do.jpg" />
									</a> <em> Hi,<span class="s-name">请登录</span>
									</em>
								</div>
								
								<div class="member-logout">
									<a class="am-btn-warning btn"
										href="${pageContext.request.contextPath}/login.jsp">登录</a> <a
										class="am-btn-warning btn"
										href="${pageContext.request.contextPath}/register.jsp">注册</a>
								</div>
							</c:if>
							
							<!-- <div class="clear"></div> -->
						</div>
						<li class="title-first"><a target="_blank" href="#">
							<span>[广告]</span>送礼，就上礼来我网
						</a></li>
						<li class="title-first"><a target="_blank" href="#">
							<span>[广告]</span>礼来我网，经济实惠
						</a></li>
					</ul>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					})
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				})
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">
			<!--热门活动 -->

			<div class="am-container activity">
				<div class="shopTitle ">
					<h4>本月推荐</h4>
				</div>
				<div class="am-g am-g-fixed " id="recommendList"></div>
			</div>
			<div class="clear "></div>
			<div id="f1">
				<!--甜点-->
				<div class="am-g am-g-fixed floodFour" id="newProduct">
					<div class="shopTitle ">
						<h4>新品推荐</h4>
					</div>
					<!-- <div class="am-u-sm-7 am-u-md-4 text-two">
						<div class="outer-con ">
							<div class="title ">雪之恋和风大福</div>
							<div class="sub-title ">¥13.8</div>
							<i class="am-icon-shopping-basket am-icon-md  seprate"></i>
						</div>
						<a href="# "><img src="images/1.jpg" /></a>
					</div> -->
				</div>
				<div class="clear "></div>
			</div>
			<div class="footer ">
				<div class="footer-hd ">
					<p>
						<a href="# ">礼来我网</a> <b>|</b> <a
							href="${pageContext.request.contextPath}" target="_top" class="h">首页</a>
						<b>|</b> <a href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
					</p>
				</div>
				<div class="footer-bd ">
					<p>
						<a href="# ">关于我们</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a>
						<a href="# ">网站地图</a> <em>Copyright ©2019-Present llow.com
							版权所有</em>
					</p>
				</div>
			</div>

		</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li class="active"><a href="home.jsp"><i
				class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.jsp"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.jsp"><i class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="person/index.jsp"><i class="am-icon-user"></i>我的</a></li>
	</div>
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>

	<script type="text/javascript">
		$(function() {

			console.log("获取类目列表");
			$
					.ajax({

						url : "${pageContext.request.contextPath}/product/listCategories",
						type : "post",
						data : {
							categoryId : 1
						},
						dataType : 'json',
						success : function(data) {
							if (data == null) {
								cosole.log("失败");
							} else {

								console.log(data);
								var str = ""
								$
										.each(
												data,
												function(index, item) {
													var li = $("<li></li>")
															.addClass(
																	"appliance js_toggle relative first");
													var div = $("<div></div>")
															.addClass(
																	"category-info");
													var h3 = $("<h3 style='color:#fff'>"+item.categoryName+"</h3>")
															.addClass(
																	"category-name b-category-name");
													var a = $(
															"<a></a>")
															.addClass("ml-22")
															.attr(
																	"href",
																	"${pageContext.request.contextPath}/product/productSort?cid="
																			+ item.categoryId
																			+ "&pageNum="
																			+ 1);
													var em = $("<em>&gt;</em>");
													div.append(h3).append(em);
													a.append(div);
													li.append(a);
													$("#myTable").append(li);
												});
								console.log("成功");

							}
						}
					})
			productRecommend();
			newProductRecommend();
			city();
		});
		function city() {
			let ip = returnCitySN["cip"];
			$.ajax({
				type: 'get',
				url: "${pageContext.request.contextPath}/manage/system/weather",
				data:{ip:ip},
				dataType:"json",
				success: function (data){
					console.log(data);
					if(data != null){
						$("#city").html(data.city);
					}
				},
				error:function(XMLHttpRequest){
					if(XMLHttpRequest.status != 200){
						layer.alert("数据处理失败");
					}
				}
			})
		}
		function productRecommend() {
			$
					.ajax({
						url : "${pageContext.request.contextPath}/product/productRecommend?time="
								+ new Date(),
						dataType : "json",
						success : function(result) {
							console.log(result);
							$.each(result, function(index, item) {
								var sm3 = $("<div></div>")
										.addClass("am-u-sm-3");
								var a = $("<a></a>").attr(
										"href",
										"${pageContext.request.contextPath}/product/productInfo?pid="
												+ item.productId + "");
								var activityMain = $("<div></div>").addClass(
										"activityMain");
								var image = $("<img></img>").attr("src",
										item.mainPicture);
								activityMain.append(image);
								a.append(activityMain);
								sm3.append(a);
								$("#recommendList").append(sm3);
							})
						}
					})
		}
		function newProductRecommend(){
			$.ajax({
				url:"${pageContext.request.contextPath}/product/newProductRecommend?time=" + new Date(),
				dataType:"json",
				success:function(result){
					console.log(result);
					$.each(result,function(index,item){
						var sm7 = $("<div></div").addClass("am-u-sm-7 am-u-md-4 text-two");
						var a = $("<a></a>").attr("href","${pageContext.request.contextPath}/product/productInfo?pid="+ item.productId + "");
						var image = $("<img style='height:180px;'></img>").attr("src",item.mainPicture);
						a.append(image);
						sm7.append(a);
						$("#newProduct").append(sm7);
					})
				}
			})
		}
	</script>
	<script type="text/javascript " src="basic/js/quick_links.js "></script>
</body>

</html>