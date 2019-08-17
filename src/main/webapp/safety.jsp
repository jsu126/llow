<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>安全设置</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/infstyle.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
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
	.menu,.menu-hd a:hover {
		color:red;
	}
	.nav-cont ul > li a:hover{
	color:red;
}
</style>
</head>

<body>
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:if test="${user==null}">
							<a href="${pageContext.request.contextPath}/login.jsp"
								target="_top" class="h">亲，请登录</a>
							<a href="${pageContext.request.contextPath}/register.jsp"
								target="_top">免费注册</a>
						</c:if>
						<c:if test="${user!=null}">
							<a href="${pageContext.request.contextPath}/information.jsp"
								target="_top" class="h">${user.username}</a>
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
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd"
							href="${pageContext.request.contextPath}/shopCart/listShopCarts"
							target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
				</div>
			</ul>
		</div>

		<!--悬浮搜索框-->

		<div class="nav white">
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
	</div>
	</article> </header>
	<div class="nav-table">
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
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<!--标题 -->
				<div class="user-safety">
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small>
						</div>
					</div>
					<hr />

					<!--头像 -->
					<div class="user-infoPic" style="margin-bottom: 0">
						<div class="filePic">
							<input type="file" class="inputPic"
								allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
								style="display: none" id="upload" name="picture">
							<c:if test="${user.picture!=null}">
								<img class="am-circle am-img-thumbnail" src="${user.picture}"
									alt="" id="pic" />
							</c:if>
							<c:if test="${user.picture==null}">
								<img class="am-circle am-img-thumbnail"
									src="images/getAvatar.do.jpg" alt="" id="pic" />
							</c:if>
						</div>

						<p class="am-form-help">头像</p>

						<div class="info-m">
							<div>
								<b>用户名：<i>${user.username}</i></b>
							</div>

							<div class="u-safety">
								<a href="safety.jsp"> 账户安全 <span class="u-profile"><i
										class="bc_ee0000" style="width: 60px;" width="0">${user.score}分</i></span>
								</a>
							</div>
						</div>
					</div>

					<div class="check">
						<ul>
							<li><i class="i-safety-lock"></i>
								<div class="m-left">
									<div class="fore1">登录密码</div>
									<div class="fore2">
										<small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="password.jsp">
										<div class="am-btn am-btn-secondary">修改</div>
									</a>
								</div></li>
							<li><i class="i-safety-iphone"></i>
								<div class="m-left">
									<div class="fore1">手机验证</div>
									<div class="fore2">
										<small id="user-phone" value="${user.phone}"></small>
									</div>
								</div>
								<div class="fore3 havePhone">
									<a href="${pageContext.request.contextPath}/user/bindPhone">
										<div class="am-btn am-btn-secondary">换绑</div>
									</a>
								</div>
								<div class="fore3 noPhone">
									<a href="${pageContext.request.contextPath}/user/bindPhone">
										<div class="am-btn am-btn-secondary">绑定手机</div>
									</a>
								</div></li>
							<li><i class="i-safety-mail"></i>
								<div class="m-left">
									<div class="fore1">邮箱验证</div>
									<%-- 										<div class="fore2"><small id="user-email">您验证的邮箱：${user.email} 可用于快速找回登录密码</small></div> --%>
									<div class="fore2">
										<small id="user-email"></small>
									</div>
								</div> <!-- <div class="fore3 haveEmail" >
		
										<div class="am-btn am-btn-secondary" style="color:#000000">不可换绑</div>
									
								</div> -->
								<div class="fore3 noEmail" id="email">
									<a href="${pageContext.request.contextPath}/user/email">
										<div class="am-btn am-btn-secondary">绑定邮箱</div>
									</a>
								</div></li>
							<li><i class="i-safety-idcard"></i>
								<div class="m-left">
									<div class="fore1">实名认证</div>
									<div class="fore2">
										<small>用于提升账号的安全性和信任级别，认证后不能修改认证信息。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="${pageContext.request.contextPath}/idcard.jsp">
										<div class="am-btn am-btn-secondary">认证</div>
									</a>
								</div></li>
							<!-- <li><i class="i-safety-security"></i>
								<div class="m-left">
									<div class="fore1">安全问题</div>
									<div class="fore2">
										<small>保护账户安全，验证您身份的工具之一。</small>
									</div>
								</div>
								<div class="fore3">
									<a href="question.html">
										<div class="am-btn am-btn-secondary">认证</div>
									</a>
								</div></li> -->
						</ul>
					</div>

				</div>
			</div>
			<!--底部-->
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

		<aside class="menu">
		<ul>
			<li class="person"><a
				href="${pageContext.request.contextPath}/information.jsp">个人中心</a></li>
			<li class="person"><a href="#">个人资料</a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/information.jsp">个人信息</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/safety.jsp">安全设置</a></li>
					<li><a href="${pageContext.request.contextPath}/user/address">收货地址</a></li>
				</ul></li>
			<li class="person"><a href="#">我的交易</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/order/myOrder">订单管理</a></li>
				</ul></li>


			<li class="person"><a href="#">我的小窝</a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/user/collection">收藏</a></li>
				</ul></li>
		</ul>

		</aside>
	</div>
	<script>
		$(function() {
			var phone = '${user.phone}';
			if (phone == "" || phone == null) {
				$('#user-phone').text("你尚未绑定手机")
				$('.noPhone').css("display", "block");
				$('.havePhone').css("display", "none");
			} else {
				var mphone = "您验证的手机：" + phone.substr(0, 3) + 'XXXXXXXX'
						+ "若已丢失或停用，请立即更换";
				$('#user-phone').text(mphone)
				$('.havePhone').css("display", "block");
				$('.noPhone').css("display", "none");

			}

			var email = '${user.email}';
			if (email == "" || email == null) {
				$('#user-email').text("你尚未绑定邮箱");
				/* $('.noEmail').css("display", "block");
				$('.haveEmail').css("display", "none"); */
			} else {
				var memail = "您验证的邮箱：" + email.substr(0, 4) + 'XXXXX'
						+ email.substr(10) + "可用于快速找回登录密码";
				$('#user-email').text(memail);
				$("#email a").attr("href", "javascript:return false;");
				$("#email div").text("已绑定");
				//$('.haveEmail').css("display", "block");
				//$('.noEmail').css("display", "none");
			}

		});
	</script>

</body>

</html>