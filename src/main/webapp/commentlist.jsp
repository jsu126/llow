<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>发表评论</title>

		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
		<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
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
	</style>
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
							<c:if test="${sessionScope.user==null}">
								<a href="${pageContext.request.contextPath}/login.jsp" target="_top" class="h">亲，请登录</a>
								<a href="${pageContext.request.contextPath}/register.jsp" target="_top">免费注册</a>
							</c:if>
							<c:if test="${sessionScope.user!=null}">
								<a href="${pageContext.request.contextPath}/information.jsp" target="_top" class="h">${sessionScope.user.username}</a>
								<a href="${pageContext.request.contextPath}/user/exit" target="_top">退出</a>
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
						<div class="menu-hd"><a id="mc-menu-hd" href="${pageContext.request.contextPath}/shopCart/listShopCarts" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="${pageContext.request.contextPath}/user/collection" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
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

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
						
					<form action="${pageContext.request.contextPath}/order/commentCommit" method="post" id="comment">	
					<input type="hidden" name="orderId" value="${unValuedList[0].orderId}">	
					<c:forEach var="orderDetail" items="${unValuedList}" >	
						
						<div class="comment-list">
								<input type="hidden" name="productIds" value="${orderDetail.productId}">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="${orderDetail.productPicture}" class="itempic">
									</a>
								</div>

								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">${orderDetail.productName}</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
											<input type="hidden" name="standardNames" value="${orderDetail.standardName}">
											<span>规格：${orderDetail.standardName}</span>
										</div>
										<div class="item-price">
											价格：<strong>${orderDetail.productPrice}</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<div class="item-comment">
									<textarea placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！" name="commentContents"></textarea>
								</div>
							
								<div class="item-opinion">
									<input type="hidden" name="commentNums" value="3"/>
									<li onclick="option(this,3)"><i class="op1" value="3"></i>好评</li>
									<li onclick="option(this,2)"><i class="op2" value="2"></i>中评</li>
									<li onclick="option(this,1)"><i class="op3" value="1"></i>差评</li>
								</div>
							</div>
								
						</c:forEach> 
                                 	<div class="info-btn">
									<div class="am-btn am-btn-danger" onClick="comment();">发表评论</div>
								</div>
						</form>		
													
					<script type="text/javascript">
					$(document).ready(function() {
						$(".comment-list .item-opinion li").click(function() {	
							$(this).prevAll().children('i').removeClass("active");
							$(this).nextAll().children('i').removeClass("active");
							$(this).children('i').addClass("active");
							
						});
			     })
			     
			     function option(obj,count) {
					console.log($(obj).parent().find("input[name=commentNums]").val(count));
				}
			     function comment(){
			    	 $("#comment").submit();
				}
					</script>					
					
												
							
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
					<li><a
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
					<li class="active"><a
						href="#">评价</a></li>
				</ul></li>

		</ul>
		</aside>
		</div>

	</body>

</html>