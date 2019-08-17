<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>验证邮箱</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/stepstyle.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<link
	href="${pageContext.request.contextPath}/layer/theme/default/layer.css">
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
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="${pageContext.request.contextPath}/information.jsp"
							target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="#" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
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

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">绑定邮箱</strong> / <small>Email</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em></i>
							<p class="stage-name">验证邮箱</p>
						</span> <span class="step-2 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">2<em class="bg"></em></i>
							<p class="stage-name">完成</p>
						</span> <span class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<form class="am-form am-form-horizontal">
					<div class="am-form-group">
						<label for="user-email" class="am-form-label">验证邮箱</label>
						<div class="am-form-content">
							<input type="email" id="user-email" placeholder="请输入邮箱地址">
						</div>
					</div>
					<div class="am-form-group code">
						<label for="user-code" class="am-form-label">验证码</label>
						<div class="am-form-content">
							<input type="tel" id="user-code" placeholder="验证码">

						</div>
						<a class="btn"> <input type="button"
							class="am-btn am-btn-danger" id="send" onClick="sendEmailCode();"
							value="获取验证码" />
						</a>

					</div>
					<div class="info-btn">
						<div class="am-btn am-btn-danger" onClick="updateEmail();">保存修改</div>
					</div>

				</form>

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
					<li class="active"><a
						href="${pageContext.request.contextPath}/information.jsp">个人信息</a></li>
					<li><a href="${pageContext.request.contextPath}/safety.jsp">安全设置</a></li>
					<li><a href="${pageContext.request.contextPath}/user/address">收货地址</a></li>
				</ul></li>
			<li class="person"><a href="#">我的交易</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/order.jsp">订单管理</a></li>
					<li><a href="${pageContext.request.contextPath}/change.jsp">退款售后</a></li>
				</ul></li>


			<li class="person"><a href="#">我的小窝</a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/collection.jsp">收藏</a></li>
					<li><a href="${pageContext.request.contextPath}/foot.jsp">足迹</a></li>
					<li><a href="${pageContext.request.contextPath}/comment.jsp">评价</a></li>
					<li><a href="${pageContext.request.contextPath}/news.jsp">消息</a></li>
				</ul></li>

		</ul>

		</aside>
	</div>
	<script>
		$(function() {
			$("#user-email")
					.blur(
							function() {
								var code = $("#send");
								var email = $(this).val();
								console.log(email);
								var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;

								if (!email.match(emailReg)) {

									layer.msg("邮箱输入错误。温馨提示：（例：xxxx@qq.com）");

								}else{
									$.ajax({
										
										type : "post",
										url : "${pageContext.request.contextPath}/user/toBindOneEmail",
										data : {
											userId : '${sessionScope.user.userId}',
											oneEmail : $("#user-email").val()

										},
										dataType : "json",
										success : function(result) {
											if (result== "" || result== null) {
												code.attr("disabled", false);
											} else {
												code.attr("disabled", true);
												layer.msg("该邮箱已被其他用户绑定");
											}
										}
										
									});
								}
							})

		});

		function sendEmailCode() {
			//var phone = $("#phone").val();
			var email = $("#user-email").val();
			var code = $("#send");
			console.log(code);
			var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;

			if (!email.match(emailReg)) {

				layer.msg("邮箱输入错误。温馨提示：（例：xxxx@qq.com）");

			} else {
				code.attr("disabled", "disabled");
				setTimeout(function() {
					code.css("opacity", "0.8");
				}, 1000)
				var time = 60;
				var set = setInterval(
						function() {
							code.val("" + --time + "秒后重新获取");
							if (time == 55) {
								$(function() {
									console.log("发送验证码");
									$
											.ajax({
												url : "${pageContext.request.contextPath}/user/emailCode?time="
														+ new Date().getTime(),
												type : "post",
												data : {
													userId : '${sessionScope.user.userId}',
													email : $("#user-email").val()

												},

											})

								})

							}
						}, 1000);
				setTimeout(function() {
					code.attr("disabled", false).val("重新获取验证码");
					clearInterval(set);
				}, 60000);
			}
		}

		function updateEmail() {

			if ($("#user-code").val() == "" || $("#user-code").val() == null
					|| $("#user-email").val() == ""
					|| $("#user-email").val() == null) {
				layer.msg("存在输入为空，请按格式输入");
			} else {
				$
						.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/user/updateNewEmail",
							dataType : "json",
							data : {
								userId : '${sessionScope.user.userId}',
								usercode : $("#user-code").val(),
								email : $("#user-email").val()

							},
							dataType : "json",
							success : function(result) {
								if (result == null) {
									layer.msg("result为空");
								}
								console.log("绑定成功" + result.code);
								console.log("绑定成功" + result);
								if (result.msg == "" || result.msg == null) {
									// $("input").val("");
									layer.msg("绑定新邮箱成功");
									window.location.href = "${pageContext.request.contextPath}/user/safety";
								} else {
									layer.msg(result.msg);
								}
							}
						});
			}
		}
	</script>
</body>

</html>