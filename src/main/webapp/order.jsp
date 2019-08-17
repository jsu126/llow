<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/orstyle.css"
	rel="stylesheet" type="text/css">

<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
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

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有订单</a></li>
							<li><a href="#tab2">待付款</a></li>
							<li><a href="#tab3">待发货</a></li>
							<li><a href="#tab4">待收货</a></li>
							<li><a href="#tab5">待评价</a></li>
						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">

										<!--交易成功-->
										<ul>
											<c:forEach var="orderInfo" items="${orderInfoVoList}"
												varStatus="i" step="1">

												<li>

													<div class="order-status4">
														<div class="order-title">
															<div class="dd-num">
																订单编号：<a href="javascript:;">${orderInfo.orderNumber}</a>
															</div>
															<span>成交时间：${orderInfo.orderTimeStr}</span>
															<!--  <em>店铺：小桔灯</em> -->
														</div>
														<div class="order-content">
															<div class="order-left">
																<ul>
																	<c:forEach var="orderDetail"
																		items="${orderInfo.orderDetailList}" varStatus="i"
																		step="1">
																		<ul class="item-list">
																			<li class="td td-item">
																				<div class="item-pic">
																					<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}" class="J_MakePoint"> <img
																						src="${orderDetail.productPicture}"
																						class="itempic J_ItemImg">
																					</a>
																				</div>
																				<div class="item-info">
																					<div class="item-basic-info">
																						<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}">
																							<p>${orderDetail.productName}</p>
																							<p class="info-little">规格：${orderDetail.standardName}
																							</p> <!-- <br/>包装：裸装-->
																						</a>
																					</div>
																				</div>
																			</li>
																			<li class="td td-price">
																				<div class="item-price">
																					${orderDetail.productPrice}</div>
																			</li>
																			<li class="td td-number">
																				<div class="item-number">
																					<span>×</span>${orderDetail.productCount}
																				</div>
																			</li>
																		</ul>
																	</c:forEach>
																</ul>
															</div>
															<div class="order-right">
																<span class="td td-amount">
																	<div class="item-amount">
																		<span>合计：${orderInfo.totalPrice} 
																	</div>
																</span>
																<div class="move-right">

																	<c:if test="${orderInfo.status==0}">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">等待买家付款</p>
																			</div>
																		</span>

																	</c:if>
																	<c:if test="${orderInfo.status==1}">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">买家已付款</p>
																			</div>

																		</span>
																	</c:if>
																	<c:if test="${orderInfo.status==2}">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">卖家已发货</p>
																			</div>
																		</span>

																	</c:if>
																	<c:if test="${orderInfo.status==3}">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">交易成功</p>
																			</div>
																		</span>

																	</c:if>
																	<c:if test="${orderInfo.status==4}">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">订单完成</p>
																			</div>
																		</span>

																	</c:if>
																	<c:if test="${orderInfo.status==0}">

																		<span class="td td-change">
																			<form
																				action="${pageContext.request.contextPath}/order/orderConfirm" method="post">
																				<input value="${orderInfo.orderNumber}"
																					type="hidden" name="orderNumber" /> <input
																					value="${orderInfo.addressId}" type="hidden"
																					name="addressId" /> <input
																					value="${orderInfo.totalPrice}" type="hidden"
																					name="totalPrice" />
																				<button class="am-btn am-btn-danger anniu"
																					type="submit">一键支付</button>
																			</form>
																		</span>
																	</c:if>
																	<c:if test="${orderInfo.status==1}">

																		<span class="td td-change">
																			<form
																				action="${pageContext.request.contextPath}/order/remind"
																				method="post">
																				<input value="${orderInfo.orderId}" type="hidden"
																					name="orderId" />
																				<!-- <a href="javascript:void(0);" onclick="" >
																			<div class="am-btn am-btn-danger anniu">提醒发货</div>
																			
																		</a> -->
																				<button class="am-btn am-btn-danger anniu"
																					type="submit">提醒发货</button>
																			</form>
																		</span>
																	</c:if>
																	<c:if test="${orderInfo.status==2}">

																		<span class="td td-change">
																			<form
																				action="${pageContext.request.contextPath}/order/receipt"
																				method="post">
																				<input value="${orderInfo.orderId}" type="hidden"
																					name="orderId" />
																				<button class="am-btn am-btn-danger anniu"
																					type="submit">确认收货</button>
																			</form>
																		</span>
																	</c:if>
																	<c:if test="${orderInfo.status==3}">

																		<span class="td td-change">
																			<form
																				action="${pageContext.request.contextPath}/order/commentList"
																				method="post">
																				<input value="${orderInfo.orderId}" type="hidden"
																					name="orderId" />
																				<button class="am-btn am-btn-danger anniu"
																					type="submit">评价商品</button>
																			</form>
																		</span>
																	</c:if>
																</div>
															</div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>

								</div>

							</div>
							<div class="am-tab-panel am-fade" id="tab2">

								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<ul>
											<c:forEach var="orderInfo" items="${orderInfoVoList}"
												varStatus="i" step="1">
												<c:if test="${orderInfo.status==0}">
													<li>

														<div class="order-status4">
															<div class="order-title">
																<div class="dd-num">
																	订单编号：<a href="javascript:;">${orderInfo.orderNumber}</a>
																</div>
																<span>成交时间：${orderInfo.orderTimeStr}</span>
																<!--  <em>店铺：小桔灯</em> -->
															</div>
															<div class="order-content">
																<div class="order-left">
																	<ul>
																		<c:forEach var="orderDetail"
																			items="${orderInfo.orderDetailList}" varStatus="i"
																			step="1">
																			<ul class="item-list">
																				<li class="td td-item">
																					<div class="item-pic">
																						<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}" class="J_MakePoint"> <img
																							src="${orderDetail.productPicture}"
																							class="itempic J_ItemImg">
																						</a>
																					</div>
																					<div class="item-info">
																						<div class="item-basic-info">
																							<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}">
																								<p>${orderDetail.productName}</p>
																								<p class="info-little">规格：${orderDetail.standardName}
																								</p> <!-- <br/>包装：裸装-->
																							</a>
																						</div>
																					</div>
																				</li>
																				<li class="td td-price">
																					<div class="item-price">
																						${orderDetail.productPrice}</div>
																				</li>
																				<li class="td td-number">
																					<div class="item-number">
																						<span>×</span>${orderDetail.productCount}
																					</div>
																				</li>
																				<li class="td td-operation">
																					<div class="item-operation">
																						<a href="refund.html">退款/退货</a>
																					</div>
																				</li>
																			</ul>


																		</c:forEach>
																	</ul>
																</div>
																<div class="order-right">
																	<span class="td td-amount">
																		<div class="item-amount">
																			合计：${orderInfo.totalPrice}
																			<!-- <p>含运费：<span>10.00</span></p> -->
																		</div>
																	</span>
																	<div class="move-right">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">等待买家付款</p>
																			</div>
																		</span> <span class="td td-change">
																			<form action="${pageContext.request.contextPath}/order/orderConfirm" method="post">
																				<input value="${orderInfo.orderNumber}"
																					type="hidden" name="orderNumber" /> <input
																					value="${orderInfo.addressId}" type="hidden"
																					name="addressId" /> <input
																					value="${orderInfo.totalPrice}" type="hidden"
																					name="totalPrice" />
																				<input class="am-btn am-btn-danger anniu"
																					type="submit" value="一键支付">
																			</form>
																		</span>
																	</div>
																</div>
															</div>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>

								</div>
							</div>
							<div class="am-tab-panel am-fade" id="tab3">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<ul>
											<c:forEach var="orderInfo" items="${orderInfoVoList}"
												varStatus="i" step="1">
												<c:if test="${orderInfo.status==1}">
													<li>

														<div class="order-status4">
															<div class="order-title">
																<div class="dd-num">
																	订单编号：<a href="javascript:;">${orderInfo.orderNumber}</a>
																</div>
																<span>成交时间：${orderInfo.orderTimeStr}</span>
																<!--  <em>店铺：小桔灯</em> -->
															</div>
															<div class="order-content">
																<div class="order-left">
																	<ul>
																		<c:forEach var="orderDetail"
																			items="${orderInfo.orderDetailList}" varStatus="i"
																			step="1">
																			<ul class="item-list">
																				<li class="td td-item">
																					<div class="item-pic">
																						<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}" class="J_MakePoint"> <img
																							src="${orderDetail.productPicture}"
																							class="itempic J_ItemImg">
																						</a>
																					</div>
																					<div class="item-info">
																						<div class="item-basic-info">
																							<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}">
																								<p>${orderDetail.productName}</p>
																								<p class="info-little">规格：${orderDetail.standardName}
																								</p> <!-- <br/>包装：裸装-->
																							</a>
																						</div>
																					</div>
																				</li>
																				<li class="td td-price">
																					<div class="item-price">
																						${orderDetail.productPrice}</div>
																				</li>
																				<li class="td td-number">
																					<div class="item-number">
																						<span>×</span>${orderDetail.productCount}
																					</div>
																				</li>
																			</ul>


																		</c:forEach>
																	</ul>
																</div>
																<div class="order-right">
																	<span class="td td-amount">
																		<div class="item-amount">
																			合计：${orderInfo.totalPrice}
																			<!-- <p>含运费：<span>10.00</span></p> -->
																		</div>
																	</span>
																	<div class="move-right">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">买家已付款</p>
																			</div>
																		</span> <span class="td td-change">
																			<form
																				action="${pageContext.request.contextPath}/order/remind"
																				method="post">
																				<input value="${orderInfo.orderId}" type="hidden"
																					name="orderId" />
																				<button class="am-btn am-btn-danger anniu"
																					type="submit">提醒发货</button>
																			</form>
																		</span>
																	</div>
																</div>
															</div>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<div class="am-tab-panel am-fade" id="tab4">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<ul>
											<c:forEach var="orderInfo" items="${orderInfoVoList}"
												varStatus="i" step="1">
												<c:if test="${orderInfo.status==2}">
													<li>

														<div class="order-status4">
															<div class="order-title">
																<div class="dd-num">
																	订单编号：<a href="javascript:;">${orderInfo.orderNumber}</a>
																</div>
																<span>成交时间：${orderInfo.orderTimeStr}</span>
																<!--  <em>店铺：小桔灯</em> -->
															</div>
															<div class="order-content">
																<div class="order-left">
																	<ul>
																		<c:forEach var="orderDetail"
																			items="${orderInfo.orderDetailList}" varStatus="i"
																			step="1">
																			<ul class="item-list">
																				<li class="td td-item">
																					<div class="item-pic">
																						<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}" class="J_MakePoint"> <img
																							src="${orderDetail.productPicture}"
																							class="itempic J_ItemImg">
																						</a>
																					</div>
																					<div class="item-info">
																						<div class="item-basic-info">
																							<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}">
																								<p>${orderDetail.productName}</p>
																								<p class="info-little">规格：${orderDetail.standardName}
																								</p> <!-- <br/>包装：裸装-->
																							</a>
																						</div>
																					</div>
																				</li>
																				<li class="td td-price">
																					<div class="item-price">
																						${orderDetail.productPrice}</div>
																				</li>
																				<li class="td td-number">
																					<div class="item-number">
																						<span>×</span>${orderDetail.productCount}
																					</div>
																				</li>
																			</ul>


																		</c:forEach>
																	</ul>
																</div>
																<div class="order-right">
																	<span class="td td-amount">
																		<div class="item-amount">
																			合计：${orderInfo.totalPrice}
																			<!-- <p>含运费：<span>10.00</span></p> -->
																		</div>
																	</span>
																	<div class="move-right">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">卖家已发货</p>
																			</div>
																		</span> <span class="td td-change">
																			<form
																				action="${pageContext.request.contextPath}/order/receipt"
																				method="post">
																				<input value="${orderInfo.orderId}" type="hidden"
																					name="orderId" />
																				<button class="am-btn am-btn-danger anniu"
																					type="submit">确认收货</button>
																			</form>
																		</span>
																	</div>
																</div>
															</div>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>

							<div class="am-tab-panel am-fade" id="tab5">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">商品操作</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<!--不同状态的订单	-->
										<ul>
											<c:forEach var="orderInfo" items="${orderInfoVoList}"
												varStatus="i" step="1">
												<c:if test="${orderInfo.status==3}">
													<li>

														<div class="order-status4">
															<div class="order-title">
																<div class="dd-num">
																	订单编号：<a href="javascript:;">${orderInfo.orderNumber}</a>
																</div>
																<span>成交时间：${orderInfo.finishTimeStr}</span>
																<!--  <em>店铺：小桔灯</em> -->
															</div>
															<div class="order-content">
																<div class="order-left">
																	<ul>
																		<c:forEach var="orderDetail"
																			items="${orderInfo.orderDetailList}" varStatus="i"
																			step="1">
																			<ul class="item-list">
																				<li class="td td-item">
																					<div class="item-pic">
																						<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}" class="J_MakePoint"> <img
																							src="${orderDetail.productPicture}"
																							class="itempic J_ItemImg">
																						</a>
																					</div>
																					<div class="item-info">
																						<div class="item-basic-info">
																							<a href="${pageContext.request.contextPath}/product/productInfo?pid=${orderDetail.productId}">
																								<p>${orderDetail.productName}</p>
																								<p class="info-little">规格：${orderDetail.standardName}
																								</p> <!-- <br/>包装：裸装-->
																							</a>
																						</div>
																					</div>
																				</li>
																				<li class="td td-price">
																					<div class="item-price">
																						${orderDetail.productPrice}</div>
																				</li>
																				<li class="td td-number">
																					<div class="item-number">
																						<span>×</span>${orderDetail.productCount}
																					</div>
																				</li>
																			</ul>
																		</c:forEach>
																	</ul>
																</div>
																<div class="order-right">
																	<span class="td td-amount">
																		<div class="item-amount">
																			合计：${orderInfo.totalPrice}
																			<!-- <p>含运费：<span>10.00</span></p> -->
																		</div>
																	</span>
																	<div class="move-right">
																		<span class="td td-status">
																			<div class="item-status">
																				<p class="Mystatus">交易成功</p>
																			</div>
																		</span> <span class="td td-change">
																			<form
																				action="${pageContext.request.contextPath}/order/commentList"
																				method="post">
																				<input value="${orderInfo.orderId}" type="hidden"
																					name="orderId" />
																				<button class="am-btn am-btn-danger anniu"
																					type="submit">评价商品</button>
																			</form>
																		</span>
																	</div>
																</div>
															</div>
														</div>
													</li>
												</c:if>
											</c:forEach>
										</ul>

									</div>

								</div>

							</div>
						</div>

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
					<li><a href="${pageContext.request.contextPath}/safety.jsp">安全设置</a></li>
					<li><a href="${pageContext.request.contextPath}/user/address">收货地址</a></li>
				</ul></li>
			<li class="person"><a href="#">我的交易</a>
				<ul>
					<li class="active"><a
						href="${pageContext.request.contextPath}/order/myOrder">订单管理</a></li>
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