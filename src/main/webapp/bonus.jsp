<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的红包</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/bostyle.css" rel="stylesheet" type="text/css">

		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/shopCatr.js"></script>
		<script type="text/javascript">
        $(function(){
	           shopCart("${pageContext.request.contextPath}/product/shopCartCount?time=" + new Date().getTime());
         })
         </script>
	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<c:if test="${user==null}">
								<a href="${pageContext.request.contextPath}/login.jsp" target="_top" class="h">亲，请登录</a>
								<a href="${pageContext.request.contextPath}/register.jsp" target="_top">免费注册</a>
							</c:if>
							<c:if test="${user!=null}">
								<a href="${pageContext.request.contextPath}/information.jsp" target="_top" class="h">${user.username}</a>
								<a href="${pageContext.request.contextPath}/user/exit" target="_top">退出</a>
							</c:if>
							
						</div>
					</div>
				</ul>
				<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/information.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
				</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logoBig">
						<li><img src="${pageContext.request.contextPath}/images/logobig.png" /></li>
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
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
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

					<div class="user-bonus">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">红包</strong> / <small>Bonus</small></div>
						</div>
						<hr/>

						<div class="am-tabs-d2 am-tabs  am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">可用红包</a></li>
								<li><a href="#tab2">已用/过期红包</a></li>

							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">

									<div class="cart-table-th">
										<div class="order-top">
											<div class="th th-from">
												来源
											</div>
											<div class="th th-remainderprice">
												剩余金额
											</div>
											<div class="th th-term">
												有效期
											</div>
											<div class="th th-usestatus">
												使用状态
											</div>
										</div>
										<div class="clear"></div>
										<div class="order-main">

											<ul class="item-list">
												<li class="td td-from">
													<div class="item-img">
														<img src="images/566fda5cN4b8a1675.gif">
													</div>

													<div class="item-info">

														<a href="#">
															<p>蓝胖子赠与</p>
															<p class="info-little "><span>红包初始面额：</span>¥50.00<span>元</span></p>
														</a>

													</div>
												</li>
												<li class="td td-remainderprice">
													<div class="item-remainderprice">
														<span>还剩</span>10.40<span>元</span>
													</div>
												</li>

												<li class="td td-term ">
													<div class="item-term">
														<span>有效期</span> 2015.12.26-2016.2.1
													</div>
												</li>

												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<p>可使用</p><span><img src="images/gift_stamp_1.png"></span>
													</div>
												</li>
											</ul>

										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="cart-table-th">
										<div class="order-top">
											<div class="th th-from">
												来源
											</div>
											<div class="th th-remainderprice">
												剩余金额
											</div>
											<div class="th th-term">
												有效期
											</div>
											<div class="th th-usestatus">
												使用状态
											</div>
										</div>
										<div class="clear"></div>
										<div class="order-main">

											<ul class="item-list">
												<li class="td td-from">
													<div class="item-img">
														<img src="images/566fda5cN4b8a1675.gif">
													</div>

													<div class="item-info">

														<a href="# ">
															<p>蓝胖子赠与</p>
															<p class="info-little "><span>红包初始面额：</span>¥50.00<span>元</span></p>
														</a>

													</div>
												</li>
												<li class="td td-remainderprice">
													<div class="item-remainderprice">
														<span>还剩</span>0.00<span>元</span>
													</div>
												</li>

												<li class="td td-term ">
													<div class="item-term">
														<span>有效期</span> 2015.12.26-2016.2.1
													</div>
												</li>

												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<p>已用完</p><span><img src="images/gift_stamp_2.png"></span>
													</div>
												</li>
											</ul>

<!--已过期-->
											<ul class="item-list">
												
												<li class="td td-from">
													<div class="item-img">
														<img src="images/566fda5cN4b8a1675.gif">
													</div>

													<div class="item-info">

														<a href="# ">
															<p>蓝胖子赠与</p>
															<p class="info-little "><span>红包初始面额：</span>¥50.00<span>元</span></p>
														</a>

													</div>
												</li>
												<li class="td td-remainderprice">
													<div class="item-remainderprice">
														<span>还剩</span>50.00<span>元</span>
													</div>
												</li>

												<li class="td td-term ">
													<div class="item-term">
														<span>有效期</span> 2015.12.26-2016.2.1
													</div>
												</li>

												<li class="td td-usestatus ">
													<div class="item-usestatus ">
														<p>已过期</p><span><img src="images/gift_stamp_3.png"></span>
													</div>
												</li>
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
							<a href="# ">恒望科技</a>
							<b>|</b>
							<a href="# ">商城首页</a>
							<b>|</b>
							<a href="# ">支付宝</a>
							<b>|</b>
							<a href="# ">物流</a>
						</p>
					</div>
					<div class="footer-bd ">
						<p>
							<a href="# ">关于恒望</a>
							<a href="# ">合作伙伴</a>
							<a href="# ">联系我们</a>
							<a href="# ">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有</em>
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
					<li><a href="${pageContext.request.contextPath}/change.jsp">退款售后</a></li>
				</ul></li>


			<li class="person"><a href="#">我的小窝</a>
				<ul>
					<li><a
						href="${pageContext.request.contextPath}/user/collection">收藏</a></li>
					<li><a href="${pageContext.request.contextPath}/foot.jsp">足迹</a></li>
					<li><a href="${pageContext.request.contextPath}/comment.jsp">评价</a></li>
					<li><a href="${pageContext.request.contextPath}/news.jsp">消息</a></li>
				</ul></li>

		</ul>

		</aside>
		</div>

	</body>

</html>