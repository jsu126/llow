<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>实名认证</title>

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
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<link
	href="${pageContext.request.contextPath}/layer/theme/default/layer.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/shopCatr.js"></script>
<script type="text/javascript">
	$(
			function() {
				shopCart("${pageContext.request.contextPath}/product/shopCartCount?time="
						+ new Date().getTime());
			})
</script>
<style>
.menu,.menu-hd a:hover {
		color:red;
	}
.nav-cont ul > li a:hover{
	color:red;
}
.info_list {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #F2F2F2;
}

.list_left2 {
	width: 97%;
	margin-left: 3%;
	height: 50px;
	font-family: "微软雅黑";
	font-size: 16px;
	color: #636363;
	line-height: 50px;
	float: left;
}

.list_left2 span {
	color: #A04E52;
	font-size: 12px;
	margin-left: 5px;
}

.id_img_wp {
	width: 94%;
	margin: 0 auto;
	min-height: 30px;
}

.img_wp {
	width: 40%;
	margin: 0 5% 0 5%;
	float: left;
	cursor: pointer;
}

.img_wp img {
	width: 100%;
	height: 100%;
}

.img_intro {
	color: #383838;
	text-align: center;
	font-family: "微软雅黑";
	padding: 10px 0 10px 0;
}

.cf {
	clear: both;
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
						<c:if test="${sessionScope.user!=null}">
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
					<div class="topMessage home">
						<div class="menu-hd">
							<a href="${pageContext.request.contextPath}" target="_top"
								class="h">商城首页</a>
						</div>
					</div>
				</div>
				<div class="topMessage my-shangcheng">
					<div class="menu-hd MyShangcheng">
						<a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
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
				<li><img src="images/logobig.png" /></li>
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
						<strong class="am-text-danger am-text-lg">实名认证</strong> / <small>Real&nbsp;authentication</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em></i>
							<p class="stage-name">上传图片</p>
						</span> <span class="step-2 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">2<em class="bg" id="changepng"></em></i>
							<p class="stage-name">实名认证</p>
						</span> <span class="step-2 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">3<em class="bg" id="three"></em></i>
							<p class="stage-name">完成</p>
						</span> <span class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-3">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<!-- 身份证图片上传 -->
				<div class="identity-carousel">
					<div class="info_list" style="border-bottom: none;">
						<div class="list_left2">
							身份证上传<span>(请上传身份证正反面，图片保持清晰)</span>
						</div>
					</div>
					<div class="id_img_wp">
						<input type="file" accept="image/*" onchange="getzImg(this)"
							style="display: none" value="" id="img_z" /> <input type="file"
							accept="image/*" onchange="getfImg(this)" value="" id="img_f"
							style="display: none" />
						<div class="img_wp" onclick="zhengmian()">
							<img src="${pageContext.request.contextPath}/images/imagez.png"
								id="zmz" />
							<p class="img_intro">身份证正面照</p>
						</div>

						<div class="img_wp" onclick="fanmian()">
							<img src="${pageContext.request.contextPath}/images/imagef.png"
								id="fmz" />
							<p class="img_intro">身份证反面照</p>
						</div>
						<div class="cf"></div>


						<div class="info-btn next">
							<div class="am-btn am-btn-danger" onclick="next()">下一步</div>
						</div>

					</div>

				</div>
				<!-- 这个是上传身份证 -->
				<script>
					$(function() {
						$('.img_wp img').height($('.img_wp img').width() * 0.6);
						$(window).resize(
								function() {
									$('.img_wp img').height(
											$('.img_wp img').width() * 0.6);
								})
					})
					//正面
					function zhengmian() {
						$('#img_z').click();
					}
					function getzImg(imgFile) {
						var file = imgFile.files[0];
						var reader = new FileReader();
						reader.readAsDataURL(file);//将文件读取为Data URL小文件   这里的小文件通常是指图像与 html 等格式的文件
						reader.onload = function(e) {
							$("#zmz").attr("src", e.target.result);
						}
					}

					//反面
					function fanmian() {
						$('#img_f').click();
					}
					function getfImg(imgFile) {
						var file = imgFile.files[0];
						var reader = new FileReader();
						reader.readAsDataURL(file);
						reader.onload = function(e) {
							$("#fmz").attr("src", e.target.result);
						}
					}
				</script>
				<div class="real-name" style="display: none;">
					<form class="am-form am-form-horizontal">
						<div class="am-form-group bind">
							<label for="user-info" class="am-form-label">账户名</label>
							<div class="am-form-content">
								<span id="user-info">${user.username}</span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-name" class="am-form-label">真实姓名</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="请输入您的真实姓名">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-IDcard" class="am-form-label">身份证号</label>
							<div class="am-form-content">
								<input type="tel" id="user-IDcard" placeholder="请输入您的身份证信息">
							</div>
						</div>
						<div class="info-btn">
							<div class="am-btn am-btn-danger" onclick="save()">保存修改</div>
						</div>
					</form>
				</div>
				<div class="finish" style="display: none;" align="center">
					<img alt="" src="${pageContext.request.contextPath}/images/dsh.png"
						width="30%">
				</div>
				<script>
					function next() {
						var img_z = $("#img_z")[0].files[0];
						var img_f = $("#img_f")[0].files[0];
						var file = new FormData();
						file.append("idCardImagez", img_z);
						file.append("idCardImagef", img_f);
						$
								.ajax({
									type : "post",
									url : "${pageContext.request.contextPath}/user/uploadIdCard",
									data : file,
									cache : false,
									contentType : false,
									processData : false,
									success : function(result) {
										if (result != null) {
											$('.real-name').css("display",
													"block");
											$('.identity-carousel').css(
													"display", "none");
											$('#changepng').css("opacity", "1");
											$("#user-name")
													.val(result.realName);
											$("#user-IDcard")
													.val(result.idCard);
										} else {
											layer.msg("上传失败");
										}
									}
								});
					}
					function save() {
						var realName = $("#user-name").val();
						var idCard = $("#user-IDcard").val();
						$
								.ajax({
									type : "post",
									url : "${pageContext.request.contextPath}/user/updateIdCardInfo",
									data : {
										realName : realName,
										idCard : idCard
									},
									success : function(result) {
										if (result != null) {
											$('.finish')
													.css("display", "block");
											$('.real-name').css("display",
													"none");
											$('#three').css("opacity", "1");

										} else {
											layer.msg("保存失败");
										}
									}
								});
					}
				</script>
			</div>
			<!--底部-->
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

</body>

</html>