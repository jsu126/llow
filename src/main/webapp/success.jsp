<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/sustyle.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/basic/js/jquery-1.7.min.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/shopCatr.js"></script>
<script type="text/javascript">
	$(function() {
		shopCart("${pageContext.request.contextPath}/product/shopCartCount?time="
				+ new Date().getTime());
	})
</script>
<style type="text/css">
	.menu-hd a:hover {
		color:red;
	}
</style>
</head>

<body>


	<!--顶部导航条 -->
	<div class="am-container header">
		<%-- <ul class="message-l">
    <div class="topMessage">
     <div class="menu-hd">
							<c:if test="${sessionScope.user==null}">
								<a href="${pageContext.request.contextPath}/login.jsp" target="_top" class="h">亲，请登录</a>
								<a href="${pageContext.request.contextPath}/register.jsp" target="_top">免费注册</a>
							</c:if>
							<c:if test="${sessionScope.user!=null}">
								<a href="${pageContext.request.contextPath}/information.jsp" target="_top" class="h">${sessionScope.user.username}</a>
								<a href="${pageContext.request.contextPath}/user/exit" target="_top">退出</a>
							</c:if>
							
						</div></div>
  </ul> --%>
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
					<a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
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



	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>${totalPrice}</em></li>
					<div class="user-info">
						<p>收货人：${address.consingee}</p>
						<p>联系电话：${address.phone}</p>
						<p>收货地址：${address.provide}${address.city}${address.region}${address.detailAddress}</p>
					</div>
					请认真核对您的收货信息，如有错误请联系客服(QQ:204273796)
				</ul>
				<!-- <div class="option">
					<span class="info">您可以</span> <a href="person/order.html"
						class="J_MakePoint">查看<span>已买到的宝贝</span></a> <a
						href="person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
				</div> -->
			</div>
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
				<a href="# ">关于我们</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
					href="# ">网站地图</a> <em>Copyright ©2019-Present llow.com 版权所有</em>
			</p>
		</div>
	</div>


</body>
</html>
