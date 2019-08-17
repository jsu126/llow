<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cartstyle.css"
	rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath}/css/jsstyle.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/address.js"></script>
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
	.menu-hd a:hover {
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
	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<!-- <div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
						</div> -->
				<div class="clear"></div>
				<ul>
					<c:forEach items="${orderVo.addressList}" var="address">
						<div class="per-border"></div>
						<li class="user-addresslist" onclick="optionAddress(this)">
							<div class="address-left">
								<div class="user DefaultAddr">
									<span class="buy-address-detail"> <span class="buy-user">${address.consingee}</span>
										<span class="buy-phone">${address.phone}</span>
									</span>
								</div>
								<div class="default-address DefaultAddr">
									<span class="buy-line-title buy-line-title-type">收货地址：</span> <span
										class="buy--address-detail"> <input type="hidden"
										class="address_id" value="${address.addressId}"> <span
										class="province">${address.provide}</span> <span class="city">${address.city}</span>
										<span class="dist">${address.region}</span> <span
										class="street">${address.detailAddress}</span>
									</span>
								</div>
								<!-- <ins class="deftip">默认地址</ins> -->
							</div>
							<div class="address-right">
								<a href="person/address.html"> <span
									class="am-icon-angle-right am-icon-lg"></span></a>
							</div>
							<div class="clear"></div> <!-- <div class="new-addr-btn">
								<a href="#" class="hidden">设为默认</a> <span
									class="new-addr-bar hidden">|</span> <a href="#">编辑</a> <span
									class="new-addr-bar">|</span> <a href="javascript:void(0);"
									onclick="delClick(this);">删除</a>
							</div> -->
						</li>
					</c:forEach>
				</ul>
				<div class="clear"></div>
			</div>
			<!--物流 -->
			<!-- <div class="logistics">
				<h3>选择物流方式</h3>
				<ul class="op_express_delivery_hot">
					<li data-value="yuantong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -468px"></i>圆通<span></span></li>
					<li data-value="shentong" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -1008px"></i>申通<span></span></li>
					<li data-value="yunda" class="OP_LOG_BTN  "><i
						class="c-gap-right" style="background-position: 0px -576px"></i>韵达<span></span></li>
					<li data-value="zhongtong"
						class="OP_LOG_BTN op_express_delivery_hot_last "><i
						class="c-gap-right" style="background-position: 0px -324px"></i>中通<span></span></li>
					<li data-value="shunfeng"
						class="OP_LOG_BTN  op_express_delivery_hot_bottom"><i
						class="c-gap-right" style="background-position: 0px -180px"></i>顺丰<span></span></li>
				</ul>
			</div>
			<div class="clear"></div>

			<!--支付方式-->
			<!-- <div class="logistics">
				<h3>选择支付方式</h3>
				<ul class="pay-list">
					<li class="pay card"><img src="images/wangyin.jpg" />银联<span></span></li>
					<li class="pay qq"><img src="images/weizhifu.jpg" />微信<span></span></li>
					<li class="pay taobao"><img src="images/zhifubao.jpg" />支付宝<span></span></li>
				</ul>
			</div>
			<div class="clear"></div> -->

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<c:forEach items="${orderVo.orderDetailList}" var="orderDetail">
						<div class="bundle  bundle-last">
							<div class="bundle-main">
								<ul class="item-content clearfix">
									<div class="pay-phone">
										<li class="td td-item">
											<div class="item-pic">
												<a href="#" class="J_MakePoint"> <img
													src="${orderDetail.productPicture}"
													class="itempic J_ItemImg" width="100%"></a>
											</div>
											<div class="item-info">
												<div class="item-basic-info">
													<a href="#" class="item-title J_MakePoint"
														data-point="tbcart.8.11">${orderDetail.productName}</a>
												</div>
											</div>
										</li>
										<li class="td td-info">
											<div class="item-props">
												<span class="sku-line">${orderDetail.standardName}</span>
											</div>
										</li>
										<li class="td td-price">
											<div class="item-price price-promo-promo">
												<div class="price-content">
													<em class="J_Price price-now">${orderDetail.productPrice}</em>
												</div>
											</div>
										</li>
									</div>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<span class="phone-title">购买数量</span>
												<div class="sl">
													<span class="sku-line">${orderDetail.productCount}</span>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${orderDetail.productPrice*orderDetail.productCount}</em>
										</div>
									</li>
								</ul>
								<div class="clear"></div>
							</div>
						</div>
					</c:forEach>
					<div class="clear"></div>
				</div>
			</div>
			<div class="clear"></div>
			<!--含运费小计 -->
			<div class="buy-point-discharge ">
				<p class="price g_price ">
					合计（含运费） <span>¥</span><em class="pay-sum">${orderVo.totalPrice}</em>
				</p>
			</div>
			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
								<em class="style-large-bold-red " id="J_ActualFee">${orderVo.totalPrice}</em>
							</span>
						</div>
						<div id="holyshit268" class="pay-address">
							<p class="buy-footer-address">
								<span class="buy-line-title buy-line-title-type">寄送至：</span> <span
									class="buy--address-detail"> <span id="province"></span>
									<span id="city"></span> <span id="dist"></span> <span
									id="street"></span>
								</span>
							</p>
							<p class="buy-footer-address">
								<span class="buy-line-title">收货人：</span> <span
									class="buy-address-detail"> <span id="buy-user"></span>
									<span id="buy-phone"></span>
								</span>
							</p>
						</div>
					</div>
					<form
						action="${pageContext.request.contextPath}/order/orderConfirm"
						method="post" id="confirm">
						<input type="hidden" name="orderNumber"
							value="${orderVo.orderNumber}"> <input type="hidden"
							name="addressId" value="" id="address_id"> <input
							type="hidden" name="totalPrice" value="${orderVo.totalPrice}">
						<div id="holyshit269" class="submitOrder">
							<div class="go-btn-wrap">

								<input type="button" id="J_Go" onclick="orderConfirm()"
									class="btn-go" tabindex="0" title="点击此按钮，提交订单" value="提交订单">

							</div>
						</div>
					</form>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
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
	<div class="theme-popover-mask"></div>
	<div class="clear"></div>
	<script type="text/javascript">
		function orderConfirm() {
			if ($("#address_id").val() === "") {
				layer.msg("地址不能为空！");
			} else {
				$("#confirm").submit();
			}
		}
	</script>
</body>

</html>