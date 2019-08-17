<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/addstyle.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index.css" type="text/css">
<script src="${pageContext.request.contextPath}/js/city.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/index.js"
	type="text/javascript"></script>
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
	a:hover {
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
			<%-- <ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<c:if test="${sessionScope.user!=null}">
							<a href="${pageContext.request.contextPath}/information.jsp"
								target="_top" class="h">${sessionScope.user.username}</a>
							<a href="${pageContext.request.contextPath}/user/exit"
								target="_top">退出</a>
						</c:if>
					</div>
			</ul> --%>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a href="${pageContext.request.contextPath}" target="_top"
							class="h">商城首页</a>
					</div>
				</div>
				<div class="topMessage mini-cart">
					<div class="menu-hd">
						<a id="mc-menu-hd" href="#" target="_top"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
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

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">


						<li class="user-addresslist defaultAddr"><span
							class="new-option-r" onClick="updateClick(this);"
							addressId="${address.addressId}"><i
								class="am-icon-check-circle"></i>${address.status}</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">${address.consingee}</span> <span
									class="new-txt-rd2">${address.phone}</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">${address.provide}</span>
									<span class="city">${address.city}</span> <span class="dist">${address.region}</span><span
										class="street">${address.detailAddress}</span>
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="javascript:void(0);" onClick="toEditClick(this);"
									addressId="${address.addressId}"><i class="am-icon-edit"></i>编辑</a>
								<span class="new-addr-bar">|</span> <a
									href="javascript:void(0);" onClick="delClick(this);"
									addressId="${address.addressId}"><i class="am-icon-trash"></i>删除</a>
							</div></li>

						<c:forEach var="address" items="${addressList}" varStatus="i"
							step="1">



							<li class="user-addresslist"><span class="new-option-r"
								onClick="updateClick(this);" addressId="${address.addressId}"><i
									class="am-icon-check-circle"></i>${address.status}</span>
								<p class="new-tit new-p-re">
									<span class="new-txt">${address.consingee}</span> <span
										class="new-txt-rd2">${address.phone}</span>
								</p>
								<div class="new-mu_l2a new-p-re">
									<p class="new-mu_l2cw">
										<span class="title">地址：</span> <span class="province">${address.provide}</span>
										<span class="city">${address.city}</span> <span class="dist">${address.region}</span>
										<span class="street">${address.detailAddress}</span>
									</p>
								</div>
								<div class="new-addr-btn">
									<a href="javascript:void(0);" onClick="toEditClick(this);"
										addressId="${address.addressId}"><i class="am-icon-edit"></i>编辑</a>
									<span class="new-addr-bar">|</span> <a
										href="javascript:void(0);" onClick="delClick(this);"
										addressId="${address.addressId}"><i class="am-icon-trash"></i>删除</a>
								</div></li>
						</c:forEach>
					</ul>
					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal  addressSelect">

									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" placeholder="收货人"
												value="${editAddress.consingee}" autocomplete="off">
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" placeholder="手机号必填" type="email"
												value="${editAddress.phone}">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">
											<div id="super_citys">
												<div class="provinces">

													<input class="input2" type="hidden" value="0" name="">
													<div class="noExistIdd">请选择省份</div>
													<div class="existIdd">${editAddress.provide}</div>
													<ul class="shadow_ul">
														<li><input type="hidden" value="0"><span>请选择省份</span></li>
													</ul>
												</div>
												<div class="city">

													<input class="input2" type="hidden" value="0" name="">
													<div class="noExistIdd">请选择城市</div>
													<div class="existIdd">${editAddress.city}</div>
													<ul>
														<li><input type="hidden" value="0"><span>请选择城市</span></li>
													</ul>
												</div>
												<div class="area">

													<input class="input2" type="hidden" value="0" name="">
													<div class="noExistIdd">请选择地区</div>
													<div class="existIdd">${editAddress.region}</div>
													<ul>
														<li><input type="hidden" value="0"><span>请选择地区</span></li>
													</ul>
												</div>

											</div>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro"
												placeholder="输入详细地址""> ${editAddress.detailAddress}</textarea>
											<div class="error-msg" style="display: none">详细地址长度需要在5-100个汉字或字符之间</div>
										</div>
									</div>


									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<a class="am-btn am-btn-danger existIdd" class="btn"
												onclick="editAddress(this);"
												addressId="${editAddress.addressId}">保存编辑</a> <a
												class="am-btn am-btn-danger noExistIdd" class="btn"
												onclick="saveAddress();">保存</a>
											<!-- <input type="button" class="btn" value="提交"> -->
											<a href="${pageContext.request.contextPath}/user/mediumClear"
												class="am-close am-btn am-btn-danger existIdd"
												data-am-modal-close>取消</a> <a
												href="${pageContext.request.contextPath}/information.jsp"
												class="am-close am-btn am-btn-danger noExistIdd"
												data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
					$(document).ready(
							function() {
								$(".new-option-r").click(
										function() {

											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");

										});

								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

							})
				</script>

				<div class="clear"></div>

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
					<li><a href="${pageContext.request.contextPath}/safety.jsp">安全设置</a></li>
					<li class="active"><a
						href="${pageContext.request.contextPath}/user/address">收货地址</a></li>
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
			var editAddressConsingee = '${editAddress.consingee}';
			if (editAddressConsingee == null || editAddressConsingee == "") {

				$('.noExistIdd').css("display", "inline-block");
				$('.existIdd').css("display", "none");

			} else {

				$('.existIdd').css("display", "inline-block");
				$('.noExistIdd').css("display", "none");

			}

			var status = '${address.status}';
			if (status == "1") {
				$('.new-option-r').text("默认地址")

			} else {

				$('.new-option-r').text("设为默认")

			}

			var qu = $(".area>.input2").val();
			var detailAddr = $("#user-intro").val().length;
			if ((qu != "" || qu != "null") && (detailAddr<5||detailAddr>100)) {
				$('error-msg').css("display", "block");

			}

			$("#user-phone").blur(function() {
				var newPhone = $(this).val();
				console.log(newPhone);
				var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;

				if (!newPhone.match(phoneReg)) {

					layer.msg("手机格式错误。温馨提示：（格式：数字11位）");

				}
			})

			$(".addressSelect").mouseover(function() {
				var qu = $(".area>.input2").val();
				var detailAddr = $("#user-intro").val().length;
				if ((qu != "0") && (detailAddr<5||detailAddr>100)) {
					$('.error-msg').css("display", "block");

				}
			})
			$("#user-intro").mouseout(function() {
				var detailAddr = $("#user-intro").val().length;
				if (detailAddr > 4 && detailAddr < 101) {
					$('.error-msg').css("display", "none");

				}
			})

		});
		function saveAddress() {
			var sheng = $(".provinces>.input2").val();
			var shi = $(".city>.input2").val();
			var qu = $(".area>.input2").val();
			var name = $("#user-name").val();
			var phone = $("#user-phone").val();
			var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
			var detailAddr = $("#user-intro").val().length;
			console.log("长度" + detailAddr);
			if (name == "null" || name == "") {
				layer.msg("收货人姓名不能为空！");
			} else if (phone == null || phone == "") {
				layer.msg("收货人手机号不能为空！");
			} else if (!phone.match(phoneReg)) {
				layer.msg("手机格式错误。温馨提示：（格式：数字11位）");
			} else if (sheng == "0") {
				layer.msg("省份不能为空！");
			} else if (shi == "0") {
				layer.msg("城市不能为空！");
			} else if (qu == "0") {
				layer.msg("地区不能为空！");
			} else if (detailAddr<5||detailAddr>100) {
				layer.msg("详细地址有误");
			} else {

				$
						.ajax({

							type : "post",
							url : "${pageContext.request.contextPath}/user/saveAddress",
							dataType : "json",
							data : {
								userId : '${sessionScope.user.userId}',
								consingee : $("#user-name").val(),
								phone : $("#user-phone").val(),
								provide : $(".provinces>.input2").val(),
								city : $(".city>.input2").val(),
								region : $(".area>.input2").val(),
								detailAddress : $("#user-intro").val()

							},
							dataType : "json",
							success : function(result) {

								if (result.msg == "" || result.msg == null) {
									layer.msg("添加成功！！");
									window.location.href = "${pageContext.request.contextPath}/user/address";
								} else {
									layer.msg(result.msg);
								}
							}
						});
			}

		}

		function delClick(obj) {
			var thisObj = $(obj);
			var addressId = thisObj.attr("addressId");
			$
					.ajax({

						type : "post",
						url : "${pageContext.request.contextPath}/user/deleteAddress",
						dataType : "json",
						data : {
							addrId : $(obj).attr("addressId")

						//address : '${address}'

						},
						dataType : "json",
						success : function(result) {

							if (result.msg == "" || result.msg == null) {
								layer.msg("删除成功！！");
								window.location.href = "${pageContext.request.contextPath}/user/address";
							} else {
								layer.msg(result.msg);
							}
						}
					});
		}
		function toEditClick(obj) {
			var thisObj = $(obj);
			var addressId = thisObj.attr("addressId");
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/user/toEditAddress",
				dataType : "json",
				data : {
					addrId : $(obj).attr("addressId")
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					if (result.msg == "" || result.msg == null) {
						layer.msg("去编辑");
						location.reload();
					} else {
						layer.msg(result.msg);
					}
				}
			});
		}

		function updateClick(obj) {
			var thisObj = $(obj);
			var addressId = thisObj.attr("addressId");
			$
					.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/user/updateAddressStatus",
						dataType : "json",
						data : {
							addrId : $(obj).attr("addressId"),
							firstAddressId : '${address.addressId}'

						//address : '${address}'

						},
						dataType : "json",
						success : function(result) {

							if (result.msg == "" || result.msg == null) {
								layer.msg("修改默认地址成功！！");
								window.location.href = "${pageContext.request.contextPath}/user/address";
							} else {
								layer.msg(result.msg);
							}
						}
					});
		}

		function editAddress(obj) {
			var thisObj = $(obj);

			var addressId = thisObj.attr("addressId");
			var sheng = $(".provinces>.input2").val();
			var shi = $(".city>.input2").val();
			var qu = $(".area>.input2").val();
			var name = $("#user-name").val();
			var phone = $("#user-phone").val();
			var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
			var detailAddr = $("#user-intro").val().length;

			var eprovide = '${editAddress.provide}';
			var ecity = '${editAddress.city}';
			var eregion = '${editAddress.region}';

			console.log("长度" + detailAddr);
			if (sheng == "0" && shi == "0" && qu == "0") {
				sheng = eprovide;
				shi = ecity;
				qu = eregion;

			}
			if (sheng != "0" && shi == "0") {
				layer.msg("城市不能为空！");
			} else if (sheng != "0" && shi != "0" && qu == "0") {
				layer.msg("地区不能为空！");
			}

			else if (name == "null" || name == "") {
				layer.msg("收货人姓名不能为空！");
			} else if (phone == null || phone == "") {
				layer.msg("收货人手机号不能为空！");
			} else if (!phone.match(phoneReg)) {
				layer.msg("手机格式错误。温馨提示：（格式：数字11位）");
			} else if (detailAddr<5||detailAddr>100) {

				layer.msg("详细地址有误");
				$('error-msg').css("display", "block");
			} else {

				$
						.ajax({

							type : "post",
							url : "${pageContext.request.contextPath}/user/editAddress",
							dataType : "json",
							data : {
								addrId : $(obj).attr("addressId"),
								consingee : $("#user-name").val(),
								phone : $("#user-phone").val(),
								provide : sheng,
								city : shi,
								region : qu,
								detailAddress : $("#user-intro").val()

							},
							dataType : "json",
							success : function(result) {

								if (result.msg == "" || result.msg == null) {
									layer.msg("编辑成功！！");
									window.location.href = "${pageContext.request.contextPath}/user/mediumClear";
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