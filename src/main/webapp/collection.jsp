<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>我的收藏</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/colstyle.css"
	rel="stylesheet" type="text/css">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
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
.jq22 ul.list {
	overflow: hidden;
}

.jq22 ul.list p {
	text-align: center;
	padding: 10px;
}

.s-tp {
	text-align: center;
	position: absolute;
	z-index: 9;
	bottom: -30px;
	left: 0px;
	width: 280px;
	height: 60px;
	overflow: hidden;
	background: rgba(207, 208, 211, 0);
	cursor: pointer;
	transition: all 300ms;
	-webkit-transition: all 300ms;
	-moz-transition: all 300ms;
	-o-transition: all 300ms;
}

.text_gobuy_show {
	text-align: center;
	height: 60px;
	position: absolute;
	z-index: 9;
	bottom: 0px;
	width: 280px;
	overflow: hidden;
	padding: 20px 15px;
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.5);
}

.s-tp a {
	text-align: center;
	position: absolute;
	bottom: 10px;
	left: 110px;
	line-height: 33px;
	color: #fff
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

				<div class="user-collection">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">我的收藏</strong> / <small>My&nbsp;Collection</small>
						</div>
					</div>
					<hr />

					<div class="you-like">
						<div class="s-bar">我的收藏</div>





						<div class="jq22" style="overflow: hidden;">
							<div class="s-content">

								<div class="hidden" style="display: none;">

									<c:forEach var="cProduct" items="${productList}" varStatus="i"
										step="1">
										<c:forEach var="standard" items="${standardList}"
											varStatus="i" step="1">
											<c:if test="${cProduct.productId==standard.productId}">

												<li>

													<div class="s-item-wrap">
														<div class="s-item">

															<div class="s-pic">
																<!-- <a href="#" class="s-pic-link"> <img
														src="images/-0-saturn_solar.jpg_220x220.jpg"
														alt="4折抢购!十二生肖925银女戒指,时尚开口女戒"
														title="4折抢购!十二生肖925银女戒指,时尚开口女戒"
														class="s-pic-img s-guess-item-img"> 
														<span class="tip-title">已下架</span>
													</a> -->
																<a
																	href="${pageContext.request.contextPath}/product/productInfo?pid=${cProduct.productId}"
																	class="s-pic-link"> <img
																	src="${cProduct.mainPicture}"
																	alt="${cProduct.productName}"
																	title="${cProduct.productName}"
																	class="s-pic-img s-guess-item-img"
																	style="width: 186px; height: 186px;"> <c:if
																		test="${cProduct.status==1}">
																		<span class="tip-title">已下架</span>
																	</c:if>
																</a>
															</div>
															<div class="s-info">
																<div class="s-title">
																	<a href="#" title="${cProduct.productName}">${cProduct.productName}</a>
																</div>
																<c:if test="${cProduct.productId==standard.productId}">
																	<div class="s-price-box">
																		<span class="s-price"><em class="s-price-sign">¥</em><em
																			class="s-value">${standard.price}</em></span>

																	</div>
																</c:if>
															</div>

															<div class="s-tp ui-btn-loading-before">
																<!-- <span class="ui-btn-loading-before buy" style="width: 100%"><a
																								href="javascript:;" class="c-nodo J_delFav_btn">取消收藏</a></span> -->
																<a href="javascript:void(0);"
																	onClick="toMoveClick(this);"
																	productId="${cProduct.productId}"
																	style="font-size: 18px; font-weight: 700; font-family: Verdana;">取消收藏</a>
															</div>
														</div>
													</div>
												</li>

											</c:if>
										</c:forEach>
									</c:forEach>

								</div>

							</div>
							<ul class="list">数据加载中，请稍后...
							</ul>
							<div class="s-more-btn i-load-more-item more" data-screen="0"
								style="overflow: hidden;">
								<a href="javascript:;" onClick="jq22.loadMore();"><i
									class="am-icon-refresh am-icon-fw"></i>更多</a>
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
					<li><a href="${pageContext.request.contextPath}/order/myOrder">订单管理</a></li>
				</ul></li>


			<li class="person"><a href="#">我的小窝</a>
				<ul>
					<li class="active"><a
						href="${pageContext.request.contextPath}/user/collection">收藏</a></li>
				</ul></li>
		</ul>

		</aside>
	</div>

	<script>
		//触发(取消收藏)

		var _content = []; //临时存储li循环内容
		var jq22 = {
			_default : 5, //默认显示图片个数
			_loading : 5, //每次点击按钮后加载的个数
			init : function() {
				var lis = $(".jq22 .hidden li");
				$(".jq22 ul.list").html("");
				for (var n = 0; n < jq22._default; n++) {
					lis.eq(n).appendTo(".jq22 ul.list");
				}
				$(".jq22 ul.list img").each(function() {
					$(this).attr('src', $(this).attr('realSrc'));
				})
				for (var i = jq22._default; i < lis.length; i++) {
					_content.push(lis.eq(i));
				}
				$(".jq22 .hidden").html("");
			},
			loadMore : function() {

				var mLis = $(".jq22 ul.list li").length;
				for (var i = 0; i < jq22._loading; i++) {
					var target = _content.shift();
					if (!target) {
						$('.jq22 .more').html("<p>全部加载完毕...</p>");
						break;
					}
					$(".jq22 ul.list").append(target);
					$(".jq22 ul.list img").eq(mLis + i).each(
							function() {
								$(this).attr('src', $(this).attr('realSrc'));
								$('.s-item-wrap').hover(
										function() {
											var obj = $(this);
											$(obj).find('.s-tp').addClass(
													'text_gobuy_show');
											$(obj).find('.search_y').animate({
												left : '150',
												opacity : 1
											}, 300);
										},
										function() {
											var obj = $(this);
											$(obj).find('.s-tp').removeClass(
													'text_gobuy_show');
											$(obj).find('.search_y').animate({
												left : '100',
												opacity : 0
											}, 300);
										});
							});
				}
			}

		}
		jq22.init();

		$('.s-item-wrap').hover(function() {
			var obj = $(this);
			$(obj).find('.s-tp').addClass('text_gobuy_show');
			$(obj).find('.search_y').animate({
				left : '150',
				opacity : 1
			}, 300);
		}, function() {
			var obj = $(this);
			$(obj).find('.s-tp').removeClass('text_gobuy_show');
			$(obj).find('.search_y').animate({
				left : '100',
				opacity : 0
			}, 300);
		});

		function toMoveClick(obj) {
			var thisObj = $(obj);
			var productId = thisObj.attr("productId");
			console.log(productId);
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/user/toMoveCProduct",
				dataType : "json",
				data : {
					productId : $(obj).attr("productId")
				},
				dataType : "json",
				success : function(result) {
					console.log(result);
					if (result.msg == "" || result.msg == null) {
						layer.msg("取消收藏成功");
						location.reload();
					} else {
						layer.msg(result.msg);
					}
				}
			});
		}
	</script>
</body>

</html>