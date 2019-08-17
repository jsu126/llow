<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>搜索页面</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/seastyle.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/script.js"></script>
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
	.menu-hd a:hover {
		color:red;
}
.nav-cont ul > li a:hover{
	color:red;
}
</style>
</head>

<body>

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
					<a href="${pageContext.request.contextPath}" target="_top"
						class="h">商城首页</a>
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
					placeholder="搜索" autocomplete="off" value="${backName}"> <input
					id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
					type="submit">
			</form>
		</div>


	</div>

	<div class="clear"></div>
	<b class="line"></b>
	<div class="search">
		<div class="search-list">
			<div class="nav-table">
				<div class="long-title">
					<span class="all-goods">全部分类</span>
				</div>
				<div class="nav-cont">
					<ul>
						<li class="index"><a
							href="${pageContext.request.contextPath}" target="_top" class="h">首页</a></li>
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
			</div>


			<div class="am-g am-g-fixed">
				<div class="am-u-sm-12 am-u-md-12">
					<div class="search-content">
						<div class="sort">
							<li class="first"><a title="综合">综合排序</a></li>
							<!-- <li><a title="销量">销量排序</a></li>
							<li><a title="价格">价格优先</a></li>
							<li class="big"><a title="评价" href="#">评价为主</a></li> -->
						</div>
						<div class="clear"></div>

						<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
							<c:forEach items="${pageInfoVo.list}" var="product">

								<li><a
									href="${pageContext.request.contextPath}/product/productInfo?pid=${product.productId}">
										<div class="i-pic limit">
											<img src="${product.mainPicture}" style="width: 100%;height: 218px" />
											<p class="title fl">${product.productName}</p>
											<p class="price fl">

												<c:if
													test="${product.productMaxPrice==product.productMinPrice}">
													<b>¥</b>
													<strong>${product.productMaxPrice}</strong>
												</c:if>
												<c:if
													test="${product.productMaxPrice!=product.productMinPrice}">
													<b>¥</b>
													<strong>${product.productMinPrice}</strong>
													<b>-</b>
													<b>¥</b>
													<strong>${product.productMaxPrice}</strong>
												</c:if>
											</p>
											<p class="number fl">
												销量<span>${product.productSaleCount}</span>
											</p>
										</div>
								</a></li>

							</c:forEach>
						</ul>
					</div>
					<div class="search-side" id="bestSeller">
						<div class="side-title">热销推荐</div>
						<%-- <li>
							<div class="i-pic check">
								<img src="${pageContext.request.contextPath}/images/cp.jpg" />
								<p class="check-title">萨拉米 1+1小鸡腿</p>
								<p class="price fl">
									<b>¥</b> <strong>29.90</strong>
								</p>
								<p class="number fl">
									销量<span>1110</span>
								</p>
							</div>
						</li> --%>
					</div>
					<div class="clear"></div>
					<!--分页 -->
					<input type="hidden" id="genre" value="${genre}" /> <input
						type="hidden" id="cid" value="${cid}" />
					<ul class="am-pagination am-pagination-right">
						<c:if test="${pageInfoVo.hasPrePage==false}">
							<li class="am-disabled"><a href="#"
								style="background-color: #C0C0C0">&laquo;</a></li>
						</c:if>

						<c:if test="${pageInfoVo.hasPrePage==true}">
							<%-- <li><a href="${pageContext.request.contextPath}/product/productSearch?pageNum=${pageInfoVo.PrePage}">&laquo;</a></li> --%>
							<li><a href="#" onclick="paging('${pageInfoVo.prePage}')">&laquo;</a></li>
						</c:if>

						<c:if test="${pageInfoVo.hasNextPage==false}">
							<li class="am-disabled"><a href="#"
								style="background-color: #C0C0C0">&raquo;</a></li>
						</c:if>

						<c:if test="${pageInfoVo.hasNextPage==true}">
							<%-- <li><a href="${pageContext.request.contextPath}/product/productSearch?pageNum=${pageInfoVo.nextpage}">&raquo;</a></li> --%>
							<li><a href="#" onclick="paging('${pageInfoVo.nextpage}')">&raquo;</a></li>
						</c:if>

						<!-- <li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li> -->

					</ul>

				</div>
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
	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/basic/js/quick_links.js"></script>

	<div class="theme-popover-mask"></div>

</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"${pageContext.request.contextPath}/product/bestSeller?time=" + new Date(),
			dataType:"json",
			success:function(result){
				console.log(result);
				$.each(result,function(index,item){
					var li = $("<li></li>");
					var a = $("<a></a>").attr("href","${pageContext.request.contextPath}/product/productInfo?pid="+ item.productId + "")
					var check = $("<div></div>").addClass("i-pic check");
					var image = $("<img>").attr("src",item.mainPicture);
					var title = $("<p>"+item.productName+"</p>").addClass("title fl");
					var price = $("<p><b>¥</b><strong>"+item.productMinPrice+"</strong></p>").addClass("price fl");
					var number = $("<p>销量<span>"+item.productSaleCount+"</span></p>").addClass("number fl");
					check.append(image);
					check.append(title);
					check.append(price);
					check.append(number);
					a.append(check);
					li.append(a);
					$("#bestSeller").append(li);
				})
			}
		})
	})
	
	function paging(pageNum) {
		var productSearchName = $("#searchInput").val().trim();
		var genre = $("#genre").val().trim();
		var cid = $("#cid").val().trim();
		console.log(productSearchName);
		console.log(pageNum);
		console.log(genre);
		console.log(cid);
		if (genre != "") {
			window.location.href = "${pageContext.request.contextPath}/product/productGenre?pageNum="
					+ pageNum + "&genre=" + genre;

		} else if (cid != "" && cid != null) {
			window.location.href = "${pageContext.request.contextPath}/product/productSort?cid="
					+ cid + "&pageNum=" + pageNum;
		}

		else
			window.location.href = "${pageContext.request.contextPath}/product/productSearch?pageNum="
					+ pageNum + "&productSearchName=" + productSearchName;

	}
</script>
</html>