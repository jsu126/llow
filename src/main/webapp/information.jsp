<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>个人资料</title>

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
<link
	href="${pageContext.request.contextPath}/css/jquery.datetimepicker.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.datetimepicker.full.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/information.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/city2.js"></script>
<link
	href="${pageContext.request.contextPath}/layer/theme/default/layer.css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/shopCatr.js"></script>
		<script type="text/javascript">
        $(function(){
	           shopCart("${pageContext.request.contextPath}/product/shopCartCount?time=" + new Date().getTime());
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
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd"><a href="${pageContext.request.contextPath}" target="_top" class="h">商城首页</a></div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/shopCart/listShopCarts" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
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
				<form action="${pageContext.request.contextPath}/product/productSearch?pageNum=1" method="post">
							<input id="searchInput" name="productSearchName" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
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
								<li class="index"><a href="${pageContext.request.contextPath}" target="_top" class="h">首页</a></li>
                                <li class="qc"><a href="${pageContext.request.contextPath}/product/productGenre?pageNum=1&genre=loverStatus">恋人</a></li>
                                <li class="qc"><a href="${pageContext.request.contextPath}/product/productGenre?pageNum=1&genre=friendStatus">朋友</a></li>
                                <li class="qc"><a href="${pageContext.request.contextPath}/product/productGenre?pageNum=1&genre=kinsfolkStatus">亲人</a></li>
                                <li class="qc last"><a href="${pageContext.request.contextPath}/product/productGenre?pageNum=1&genre=holidayStatus">节日</a></li>
							</ul>

		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-info">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
						</div>
					</div>
					<hr />

					<!--头像 -->
					<div class="user-infoPic">
						<div class="filePic">
							<input type="file" class="inputPic"
								allowexts="gif,jpeg,jpg,png,bmp" accept="image/*"
								style="display: none" id="upload" name="picture">
							<c:if test="${sessionScope.user.picture!=null}">
								<img class="am-circle am-img-thumbnail" src="${sessionScope.user.picture}"
									alt="" id="pic" />
							</c:if>
							<c:if test="${sessionScope.user.picture==null}">
								<img class="am-circle am-img-thumbnail"
									src="images/getAvatar.do.jpg" alt="" id="pic" />
							</c:if>
						</div>

						<p class="am-form-help">头像</p>
						<div class="info-m">
							<div>
								<b>用户名：<i>${sessionScope.user.username}</i></b>
							</div>
							<div class="u-safety">
								<a href="safety.html"> 账户安全 <span class="u-profile"><i
										class="bc_ee0000" style="width: 60px;" width="0">${sessionScope.user.score}分</i></span>
								</a>
							</div>
						</div>
					</div>
					<!--个人信息 -->
					<div class="info-main">
						<form class="am-form am-form-horizontal"
							action="${pageContext.request.contextPath}/user/updateInfo"
							id="updateInfo" method="post">
							<div class="am-form-group">
								<label for="user-name2" class="am-form-label">昵称</label>
								<div class="am-form-content">
									<input type="text" id="user-name2" placeholder="nickname"
										name="username" value="${user.username}" autocomplete="off"
										style="width: 40%">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-name" class="am-form-label">城市</label>
								<div class="am-form-content">
									<select name="city" id="city" style="width: 40%"></select>
									<%-- <input type="text" id="user-name2" placeholder="city"
										name="city" value="${user.city}" autocomplete="off" style="width: 40%"> --%>
								</div>
							</div>
							<div class="am-form-group">
								<label class="am-form-label">性别</label>
								<div class="am-form-content sex">
									<label class="am-radio-inline"> <input type="radio"
										name="sex" value="男" id="male" data-am-ucheck> 男
									</label> <label class="am-radio-inline"> <input type="radio"
										name="sex" value="女" id="female" data-am-ucheck> 女
									</label> <label class="am-radio-inline"> <input type="radio"
										name="sex" value="保密" id="confidentiality" data-am-ucheck>
										保密
									</label>
								</div>
							</div>

							<div class="am-form-group">
								<label for="user-birth" class="am-form-label">生日</label>
								<div class="am-form-content birth">
									<input id="datetimepicker" type="text" name="birthday"
										value="${user.birthday}" style="width: 40%" autocomplete="off">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-phone" class="am-form-label">电话</label>
								<div class="am-form-content">
									<input id="user-phone" placeholder="telephonenumber" type="tel"
										value="${user.phone}" name="phone" disabled="disabled"
										style="width: 40%">
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-email" class="am-form-label">电子邮件</label>
								<div class="am-form-content">
									<input id="user-email" placeholder="Email" type="email"
										name="email" value="${user.email}" disabled="disabled"
										style="width: 40%">
								</div>
							</div>
							<div class="am-form-group address">
								<label for="user-address" class="am-form-label">收货地址</label>
								<div class="am-form-content address">
									<a href="address.html">
										<p class="new-mu_l2cw">
											<span class="province">湖北</span>省 <span class="city">武汉</span>市
											<span class="dist">洪山</span>区 <span class="street">雄楚大道666号(中南财经政法大学)</span>
											<span class="am-icon-angle-right"></span>
										</p>
									</a>

								</div>
							</div>
							<div class="am-form-group safety">
								<label for="user-safety" class="am-form-label">账号安全</label>
								<div class="am-form-content safety">
									<a href="safety.html"> <span class="am-icon-angle-right"></span>
									</a>
								</div>
							</div>
							<div class="info-btn">
								<div class="am-btn am-btn-danger" onclick="updateInfo()">保存修改</div>
							</div>
						</form>
					</div>

				</div>

			</div>
			<!--底部-->
			<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">礼来我网</a>
								<b>|</b>
								<a href="${pageContext.request.contextPath}" target="_top" class="h">首页</a>
								<b>|</b>
								<a href="# ">支付宝</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于我们</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em>Copyright ©2019-Present llow.com 版权所有</em>
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
					<li><a href="${pageContext.request.contextPath}/order/myOrder">订单管理</a></li>
				</ul>
			</li>
			<li class="person"><a href="#">我的小窝</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/user/collection">收藏</a></li>
				</ul>
			</li>
		</ul>
		</aside>
	</div>
	<script type="text/javascript">
		$('#datetimepicker').datetimepicker();
		$('#datetimepicker').datetimepicker({
			lang : 'ch', //设置中文
			format : "Y-m-d" //格式化日期
		});
		$(function () {
			var city = '${user.city}';
	        initProvince(city);
	    })
	    function initProvince(city) {
	        var optionStr = "<option value=\"-1\">请选择省</option>";
	        for (var province in citys) {
	            optionStr += "<option value=\"" + citys[province].n + "\"";
	            if (city == citys[province].n) {
	                optionStr += "selected='selected'";
	            }
	            optionStr += ">" + citys[province].n + "</option>";
	        }
	        $("#city").append(optionStr);
	    }
		
		$(checkVoteType());

		function checkVoteType() {
			var type = '${user.sex}';
			if (type == '男') {
				$("#male").prop("checked", "checked");
			} else if (type == '女') {
				$("#female").prop("checked", "checked");
			} else {
				$("#confidentiality").prop("checked", "checked");
			}
		}

		function uploadImage() {
			var pic = $("#upload")[0].files[0];
			var file = new FormData();
			file.append("image", pic);
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/user/uploadPicture",
				data : file,
				cache : false,
				contentType : false,
				processData : false,
				success : function(result) {
					layer.msg("上传成功");
				}
			});
		}
		function updateInfo() {
			$("#updateInfo").submit();
		}
	</script>
</body>

</html>