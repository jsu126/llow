<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>商品页面</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/optstyle.css"
	rel="stylesheet" />
<link type="text/css"
	href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/basic/js/quick_links.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/list.js"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/layer/layer.js"></script>
<link
	href="${pageContext.request.contextPath}/admin/layer/theme/default/layer.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/shopCatr.js"></script>
<style type="text/css">
	.menu-hd a:hover {
		color:red;
	}
	.nav-cont ul > li a:hover{
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
	<b class="line"></b>
	<div class="listMain">

		<!--分类-->
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
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li><a href="#">首页</a></li>
			<li><a href="#">分类</a></li>
			<li class="am-active">${productDetailVo.categoryName}</li>
		</ol>
		<script type="text/javascript">
			$(function() {
			});
			$(window).load(function() {
				$('.flexslider').flexslider({
					animation : "slide",
					start : function(slider) {
						$('body').removeClass('loading');
					}
				});
			});
		</script>
		<div class="scoll">
			<section class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li><img
						src="${pageContext.request.contextPath}/images/01.jpg" title="pic" />
					</li>
					<li><img
						src="${pageContext.request.contextPath}/images/02.jpg" /></li>
					<li><img
						src="${pageContext.request.contextPath}/images/03.jpg" /></li>
				</ul>
			</div>
			</section>
		</div>

		<!--放大镜-->

		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">

				<div class="box">
					<script type="text/javascript">
						$(document).ready(
								function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(
											function() {
												$(this).parents("li").addClass(
														"tb-selected")
														.siblings()
														.removeClass(
																"tb-selected");
												$(".jqzoom").attr(
														'src',
														$(this).find("img")
																.attr("mid"));
												$(".jqzoom").attr(
														'rel',
														$(this).find("img")
																.attr("big"));
											});
								});
					</script>

					<div class="tb-booth tb-pic tb-s310">
						<%-- <a href="images/01.jpg"><img src="${pageContext.request.contextPath}/images/01_mid.jpg" alt="细节展示放大镜特效" rel="images/01.jpg" class="jqzoom" /></a> --%>
						<a href="${productDetailVo.mainPicture}"><img
							src="${productDetailVo.mainPicture}" alt="细节展示放大镜特效"
							rel="${productDetailVo.mainPicture}" class="jqzoom" /></a>
					</div>
					<ul class="tb-thumb" id="thumblist">
						<c:forEach items="${productDetailVo.smallPictureList}" var="small">
							<c:if test="${small!=''}">
								<li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${small}" mid="${small}"
											big="${small}"></a>

									</div>
								</li>
							</c:if>
						</c:forEach>
						<%-- <li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${productDetailVo.mainPicture}" mid="${productDetailVo.mainPicture}" big="${productDetailVo.mainPicture}"></a>
										<a href="#"><img src="${pageContext.request.contextPath}/images/01_small.jpg" mid="images/01_mid.jpg" big="images/01.jpg"></a>
									</div>
								</li>
								<li>
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${pageContext.request.contextPath}/images/02_small.jpg" mid="images/02_mid.jpg" big="images/02.jpg"></a>
										<a href="#"><img src="${productDetailVo.mainPicture}" mid="${productDetailVo.mainPicture}" big="${productDetailVo.mainPicture}"></a>
									</div>
								</li>
								<li>
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${pageContext.request.contextPath}/images/03_small.jpg" mid="images/03_mid.jpg" big="images/03.jpg"></a>
									</div>
								</li> --%>
					</ul>
				</div>

				<div class="clear"></div>
			</div>

			<div class="clearfixRight">

				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1>${productDetailVo.productName}</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>促销价</dt> <c:if
								test="${productDetailVo.productMaxPrice!=productDetailVo.productMinPrice}">
								<dd id="jg1">
									<em>¥</em><b class="sys_item_price">${productDetailVo.productMinPrice}</b>
								</dd>
								<b id="jg2">-</b>
								<dd id="jg3">
									<em> ¥</em><b class="sys_item_price">${productDetailVo.productMaxPrice}</b>
								</dd>
							</c:if> <c:if
								test="${productDetailVo.productMaxPrice==productDetailVo.productMinPrice}">
								<dd id="jg1">
									<em>¥</em><b class="sys_item_price">${productDetailVo.productMinPrice}</b>
								</dd>
							</c:if>
							<dd id="sa">
								<em>¥</em><b class="sys_item_price" id="hhi">${productDetailVo.productMinPrice}</b>
							</dd>
						</li>
						<!-- <li class="price iteminfo_mktprice">
									<dt>原价</dt>
									<dd><em>¥</em><b class="sys_item_mktprice">98.00</b></dd>									
								</li> -->
						<div class="clear"></div>
					</div>

					<!--地址-->
					<!-- <dl class="iteminfo_parameter freight">
								<dt>配送至</dt>
								<div class="iteminfo_freprice">
									<div class="am-form-content address">
										<select data-am-selected>
											<option value="a">浙江省</option>
											<option value="b">湖北省</option>
										</select>
										<select data-am-selected>
											<option value="a">温州市</option>
											<option value="b">武汉市</option>
										</select>
										<select data-am-selected>
											<option value="a">瑞安区</option>
											<option value="b">洪山区</option>
										</select>
									</div>
									<div class="pay-logis">
										快递<b class="sys_item_freprice">10</b>元
									</div>
								</div>
							</dl> -->
					<div class="clear"></div>

					<!--销量-->
					<ul class="tm-ind-panel">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">月销量</span><span class="tm-count">${productDetailVo.productMonthCount}</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-sumCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">累计销量</span><span class="tm-count">${productDetailVo.productSaleCount}</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
							<div class="tm-indcon">
								<span class="tm-label">累计评价</span><span class="tm-count">${productDetailVo.commentCount}</span>
							</div>
						</li>
					</ul>
					<div class="clear"></div>

					<!--各种规格-->
					<dl class="iteminfo_parameter sys_item_specpara">
						<dt class="theme-login">
							<div class="cart-title">
								可选规格<span class="am-icon-angle-right"></span>
							</div>
						</dt>
						<dd>
							<!--操作页面-->

							<div class="theme-popover-mask"></div>

							<div class="theme-popover">
								<div class="theme-span"></div>
								<div class="theme-poptit">
									<a href="javascript:;" title="关闭" class="close">×</a>
								</div>
								<div class="theme-popbod dform">
									<form class="theme-signin" name="loginform" action=""
										method="post">

										<div class="theme-signin-left">

											<div class="theme-options">
												<div class="cart-title">规格</div>
												<ul>
													<c:forEach items="${productDetailVo.standardList}"
														var="standard">
														<!-- <li class="sku-line selected">原味<i></i></li>
															<li class="sku-line">奶油<i></i></li>
															<li class="sku-line">炭烧<i></i></li>
															<li class="sku-line">咸香<i></i></li> -->
														<li class="sku-line" onclick="option(this)">${standard.standardName}<i></i>
															<input id="price" value="${standard.price}" type="hidden"
															name="price" /> <input id="stock"
															value="${standard.stock}" type="hidden" name="stock" />
														</li>


													</c:forEach>
												</ul>
											</div>

											<div class="theme-options">
												<div class="cart-title number">数量</div>
												<dd>
													<c:if test="${productDetailVo.stockCount==1}">
														<input id="min" class="am-btn am-btn-default" name=""
															type="button" value="-" />
														<input id="text_box" name="" type="text" value="1"
															style="width: 30px;" />
														<input id="add" class="am-btn am-btn-default" name=""
															type="button" value="+" disabled="disabled" />
													</c:if>
													<c:if test="${productDetailVo.stockCount==0}">
														<input id="min" class="am-btn am-btn-default" name=""
															type="button" value="-" />
														<input id="text_box" name="" type="text" value="0"
															style="width: 30px;" />
														<input id="add" class="am-btn am-btn-default" name=""
															type="button" value="+" disabled="disabled" />
													</c:if>
													<c:if test="${productDetailVo.stockCount>1}">
														<input id="min" class="am-btn am-btn-default" name=""
															type="button" value="-" />
														<input id="text_box" name="" type="text" value="1"
															style="width: 30px;" />
														<input id="add" class="am-btn am-btn-default" name=""
															type="button" value="+" />
													</c:if>
													<span id="Stock" class="tb-hidden">库存<span
														class="stock" id="lk">${productDetailVo.stockCount}</span>件
													</span> <input id="sth" type="hidden"
														value="${productDetailVo.stockCount}">
												</dd>

											</div>
											<div class="clear"></div>

											<div class="btn-op">
												<div class="btn am-btn am-btn-warning">确认</div>
												<div class="btn close am-btn am-btn-warning">取消</div>
											</div>
										</div>
										<div class="theme-signin-right">
											<div class="img-info">
												<img
													src="${pageContext.request.contextPath}/images/songzi.jpg" />
											</div>
											<div class="text-info">
												<span class="J_Price price-now">¥39.00</span> <span
													id="Stock" class="tb-hidden">库存<span class="stock">${productDetailVo.stockCount}</span>件
												</span>
											</div>
										</div>

									</form>
								</div>
							</div>

						</dd>
					</dl>
					<div class="clear"></div>
					<!--活动	-->
					<div class="shopPromotion gold">
						<div class="hot">
							<dt class="tb-metatit">店铺优惠</dt>
							<div class="gold-list">
								<p>
									随机免单</span>
								</p>
							</div>
						</div>
						<div class="clear"></div>
						<!-- <div class="coupon">
							<dt class="tb-metatit">优惠券</dt>
							<div class="gold-list">
								<ul>
									<li>125减5</li>
									<li>198减10</li>
									<li>298减20</li>
								</ul>
							</div>
						</div> -->
					</div>
				</div>

				<div class="pay">
					<div class="pay-opt">
						<a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
						<a><span class="am-icon-heart am-icon-fw">收藏</span></a>

					</div>
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<c:if test="${productDetailVo.collectionStatus==0}">
								<a id="LikBuy" title="加入收藏夹" href="#"
									onclick="addComment('${productDetailVo.productId}','${sessionScope.user}')">加入收藏夹</a>
							</c:if>
							<c:if test="${productDetailVo.collectionStatus==1}">
								<a id="LikBuy" title="取消收藏" href="#"
									onclick="delectComment('${productDetailVo.productId}')">取消收藏</a>
							</c:if>

						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<input type="hidden" id="shop" name="shop" value="" /> <a
								id="LikBasket" title="加入购物车" href="#"
								onclick="shopcart('${productDetailVo.productId}','${sessionScope.user}')"><i></i>加入购物车</a>
						</div>
					</li>
				</div>

			</div>

			<div class="clear"></div>

		</div>

		<!--优惠套装-->
		<%-- <div class="match">
					<div class="match-title">优惠套装</div>
					<div class="match-comment">
						<ul class="like_list">
							<li>
								<div class="s_picBox">
									<a class="s_pic" href="#"><img src="${pageContext.request.contextPath}/images/cp.jpg"></a>
								</div> <a class="txt" target="_blank" href="#">萨拉米 1+1小鸡腿</a>
								<div class="info-box"> <span class="info-box-price">¥ 29.90</span> <span class="info-original-price">￥ 199.00</span> </div>
							</li>
							<li class="plus_icon"><i>+</i></li>
							<li>
								<div class="s_picBox">
									<a class="s_pic" href="#"><img src="${pageContext.request.contextPath}/images/cp2.jpg"></a>
								</div> <a class="txt" target="_blank" href="#">ZEK 原味海苔</a>
								<div class="info-box"> <span class="info-box-price">¥ 8.90</span> <span class="info-original-price">￥ 299.00</span> </div>
							</li>
							<li class="plus_icon"><i>=</i></li>
							<li class="total_price">
								<p class="combo_price"><span class="c-title">套餐价:</span><span>￥35.00</span> </p>
								<p class="save_all">共省:<span>￥463.00</span></p> <a href="#" class="buy_now">立即购买</a> </li>
							<li class="plus_icon"><i class="am-icon-angle-right"></i></li>
						</ul>
					</div>
				</div> --%>
		<div class="clear"></div>


		<!-- introduce-->

		<div class="introduce">
			<div class="browse">
				<div class="mc">
					<ul>
						<div class="mt">
							<h2>看了又看</h2>
						</div>


						<c:forEach items="${productDetailVo.productList}" var="pro">
							<li class="first">
								<div class="p-img">
									<a href="#"> <img class="" src="${pro.mainPicture}">
									</a>
								</div>
								<div class="p-name">
									<a
										href="${pageContext.request.contextPath}/product/productInfo?pid=${pro.productId}">
										 ${pro.productName}</a>
								</div>

								<div class="p-price">
									<c:if test="${pro.productMaxPrice==pro.productMinPrice}">
										<b>¥</b>
										<strong>${pro.productMaxPrice}</strong>
									</c:if>
									<c:if test="${pro.productMaxPrice!=pro.productMinPrice}">
										<b>¥</b>
										<strong>${pro.productMinPrice}</strong>
										<b>-</b>
										<b>¥</b>
										<strong>${pro.productMaxPrice}</strong>
									</c:if>
								</div>
							</li>

						</c:forEach>

						<%-- <li class="first">
							      	<div class="p-img">                    

							      		<a  href="${pageContext.request.contextPath}/product/productInfo?pid=${pro.productId}"> <img class="" src="${pro.mainPicture}"> </a>               
							      	</div>
							      	<div class="p-name"><a href="${pageContext.request.contextPath}/product/productInfo?pid=${pro.productId}">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	
							      	<div class="p-price">
							      	<c:if test="${pro.productMaxPrice==pro.productMinPrice}">
												<b>¥</b>
												<strong>${pro.productMaxPrice}</strong>
												</c:if>
												<c:if test="${pro.productMaxPrice!=pro.productMinPrice}">
												<b>¥</b>
												<strong>${pro.productMinPrice}</strong>	
												<b>-</b>	
												<b>¥</b>
												<strong>${pro.productMaxPrice}</strong>
												</c:if>
									</div>
							      </li>
							      
							      </c:forEach>
							      
							      <%-- <li class="first">
							      	<div class="p-img">                    

							      		<a  href="#"> <img class="" src="${pageContext.request.contextPath}/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="${pageContext.request.contextPath}/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="${pageContext.request.contextPath}/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>							      
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="${pageContext.request.contextPath}/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>							      
							      <li>
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="${pageContext.request.contextPath}/images/browse1.jpg"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		【三只松鼠_开口松子218g】零食坚果特产炒货东北红松子原味
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>￥35.90</strong></div>
							      </li>				 --%>

					</ul>
				</div>
			</div>
			<div class="introduceMain">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active"><a href="#"> <span
								class="index-needs-dt-txt">宝贝详情</span></a></li>

						<li><a href="#"> <span class="index-needs-dt-txt">全部评价</span></a>

						</li>

						<!-- <li>
									<a href="#">

										<span class="index-needs-dt-txt">猜你喜欢</span></a>
								</li> -->
					</ul>

					<div class="am-tabs-bd">

						<div class="am-tab-panel am-fade am-in am-active">
							<!-- <div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>产品参数：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
											<li title="">产品类型:&nbsp;烘炒类</li>
											<li title="">原料产地:&nbsp;巴基斯坦</li>
											<li title="">产地:&nbsp;湖北省武汉市</li>
											<li title="">配料表:&nbsp;进口松子、食用盐</li>
											<li title="">产品规格:&nbsp;210g</li>
											<li title="">保质期:&nbsp;180天</li>
											<li title="">产品标准号:&nbsp;GB/T 22165</li>
											<li title="">生产许可证编号：&nbsp;QS4201 1801 0226</li>
											<li title="">储存方法：&nbsp;请放置于常温、阴凉、通风、干燥处保存 </li>
											<li title="">食用方法：&nbsp;开袋去壳即食</li>
										</ul>
										<div class="clear"></div>
									</div> -->

							<div class="details">
								<div class="attr-list-hd after-market-hd">
									<h4>商品细节</h4>
								</div>
								<div class="twlistNews">
									<%-- <img src="${pageContext.request.contextPath}/images/tw1.jpg" />
											<img src="${pageContext.request.contextPath}/images/tw2.jpg" />
											<img src="${pageContext.request.contextPath}/images/tw3.jpg" />
											<img src="${pageContext.request.contextPath}/images/tw4.jpg" />
											<img src="${pageContext.request.contextPath}/images/tw5.jpg" />
											<img src="${pageContext.request.contextPath}/images/tw6.jpg" />
											<img src="${pageContext.request.contextPath}/images/tw7.jpg" /> --%>
									<c:forEach items="${productDetailVo.detailsList}" var="details">
										<img src="${details}" />
									</c:forEach>
								</div>
							</div>
							<div class="clear"></div>

						</div>

						<div class="am-tab-panel am-fade">

							<div class="actor-new">
								<div class="rate">
									<strong>${productDetailVo.degree}<span>%</span></strong><br>
									<span>好评度</span>
								</div>

							</div>
							<div class="clear"></div>
							<div class="tb-r-filter-bar">
								<ul class=" tb-taglist am-avg-sm-4">
									<li class="tb-taglist-li tb-taglist-li-current">
										<div class="comment-info">
											<span>全部评价</span> <span class="tb-tbcr-num">(${productDetailVo.commentCount})</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-1">
										<div class="comment-info">
											<span>好评</span> <span class="tb-tbcr-num">(${productDetailVo.goodCount})</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-0">
										<div class="comment-info">
											<span>中评</span> <span class="tb-tbcr-num">(${productDetailVo.midCount})</span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li--1">
										<div class="comment-info">
											<span>差评</span> <span class="tb-tbcr-num">(${productDetailVo.badCount})</span>
										</div>
									</li>
								</ul>
							</div>
							<div class="clear"></div>

							<ul class="am-comments-list am-comments-list-flip">
								<c:forEach items="${productDetailVo.commentAndUserList}"
									var="Usercomment">

									<li class="am-comment">
										<!-- 评论容器 --> <a href=""> <c:if
												test="${Usercomment.picture==nul}">

												<img class="am-comment-avatar"
													src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
											</c:if> <c:if test="${Usercomment.picture!=nul}">

												<img class="am-comment-avatar" src="${Usercomment.picture}" />
											</c:if> <!-- 评论者头像 -->
									</a>

										<div class="am-comment-main">
											<!-- 评论内容容器 -->
											<header class="am-comment-hd"> <!--<h3 class="am-comment-title">评论标题</h3>-->
											<div class="am-comment-meta">
												<!-- 评论元数据 -->
												<a href="#link-to-user" class="am-comment-author">${Usercomment.username}</a>
												<!-- 评论者 -->
												评论于
												<time datetime="">${Usercomment.commentTime}</time>
											</div>
											</header>

											<div class="am-comment-bd">
												<div class="tb-rev-item " data-id="255776406962">
													<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
														${Usercomment.commentConte}</div>
													<!-- <div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div> -->
													<div class="tb-r-act-bar">
														分类：${Usercomment.standardName}</div>
												</div>

											</div>
											<!-- 评论内容 -->
										</div>
									</li>
								</c:forEach>
								<%-- <li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年10月28日 11:33</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															没有色差，很暖和……美美的
														</div>
														<div class="tb-r-act-bar">
															颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月25日 12:48</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															式样不错，初冬穿
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>

										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年10月28日 11:33</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															没有色差，很暖和……美美的
														</div>
														<div class="tb-r-act-bar">
															颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月25日 12:48</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															式样不错，初冬穿
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">l***4 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年10月28日 11:33</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255095758792">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															没有色差，很暖和……美美的
														</div>
														<div class="tb-r-act-bar">
															颜色分类：蓝调灰&nbsp;&nbsp;尺码：2XL
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月02日 17:46</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															摸起来丝滑柔软，不厚，没色差，颜色好看！买这个衣服还接到诈骗电话，我很好奇他们是怎么知道我买了这件衣服，并且还知道我的电话的！
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">h***n (匿名)</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">2015年11月25日 12:48</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="258040417670">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															式样不错，初冬穿
														</div>
														<div class="tb-r-act-bar">
															颜色分类：柠檬黄&nbsp;&nbsp;尺码：L
														</div>
													</div>
												</div>
												<!-- 评论内容 -->
											</div>
										</li>
 --%>
							</ul>

							<div class="clear"></div>

							<!--分页 -->
							<!-- <ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul> -->
							<div class="clear"></div>

							<div class="tb-reviewsft">
								<div class="tb-rate-alert type-attention">
									购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。
								</div>
							</div>

						</div>

						<%-- <div class="am-tab-panel am-fade">
									<div class="like">
										<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<!--分页 -->
									<!-- <ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul> -->
									<div class="clear"></div>

								</div> --%>

					</div>

				</div>

				<div class="clear"></div>

				<div class="footer ">
					<div class="footer-hd ">
						<p>
							<a href="# ">礼来我网</a> <b>|</b> <a
								href="${pageContext.request.contextPath}" target="_top"
								class="h">首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b> <a
								href="# ">物流</a>
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

		</div>
	</div>
	<!--菜单 -->
	<%-- <div class=tip>
				<div id="sidebar">
					<div id="wrap">
						<div id="prof" class="item">
							<a href="#">
								<span class="setting"></span>
							</a>
							<div class="ibar_login_box status_login">
								<div class="avatar_box">
									<p class="avatar_imgbox"><img src="${pageContext.request.contextPath}/images/no-img_mid_.jpg" /></p>
									<ul class="user_info">
										<li>用户名：sl1903</li>
										<li>级&nbsp;别：普通会员</li>
									</ul>
								</div>
								<div class="login_btnbox">
									<a href="#" class="login_order">我的订单</a>
									<a href="#" class="login_favorite">我的收藏</a>
								</div>
								<i class="icon_arrow_white"></i>
							</div>

						</div>
						<div id="shopCart" class="item">
							<a href="#">
								<span class="message"></span>
							</a>
							<p>
								购物车
							</p>
							<p class="cart_num">0</p>
						</div>
						<div id="asset" class="item">
							<a href="#">
								<span class="view"></span>
							</a>
							<div class="mp_tooltip">
								我的资产
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="foot" class="item">
							<a href="#">
								<span class="zuji"></span>
							</a>
							<div class="mp_tooltip">
								我的足迹
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="brand" class="item">
							<a href="#">
								<span class="wdsc"><img src="${pageContext.request.contextPath}/images/wdsc.png" /></span>
							</a>
							<div class="mp_tooltip">
								我的收藏
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="broadcast" class="item">
							<a href="#">
								<span class="chongzhi"><img src="${pageContext.request.contextPath}/images/chongzhi.png" /></span>
							</a>
							<div class="mp_tooltip">
								我要充值
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div class="quick_toggle">
							<li class="qtitem">
								<a href="#"><span class="kfzx"></span></a>
								<div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
							</li>
							<!--二维码 -->
							<li class="qtitem">
								<a href="#none"><span class="mpbtn_qrcode"></span></a>
								<div class="mp_qrcode" style="display:none;"><img src="${pageContext.request.contextPath}/images/weixin_code_145.png" /><i class="icon_arrow_white"></i></div>
							</li>
							<li class="qtitem">
								<a href="#top" class="return_top"><span class="top"></span></a>
							</li>
						</div>

						<!--回到顶部 -->
						<div id="quick_links_pop" class="quick_links_pop hide"></div>

					</div>

				</div>
				<div id="prof-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						我
					</div>
				</div>
				<div id="shopCart-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						购物车
					</div>
				</div>
				<div id="asset-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						资产
					</div>

					<div class="ia-head-list">
						<a href="#" target="_blank" class="pl">
							<div class="num">0</div>
							<div class="text">优惠券</div>
						</a>
						<a href="#" target="_blank" class="pl">
							<div class="num">0</div>
							<div class="text">红包</div>
						</a>
						<a href="#" target="_blank" class="pl money">
							<div class="num">￥0</div>
							<div class="text">余额</div>
						</a>
					</div>

				</div>
				<div id="foot-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						足迹
					</div>
				</div>
				<div id="brand-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						收藏
					</div>
				</div>
				<div id="broadcast-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						充值
					</div>
				</div>
			</div> --%>

</body>
<script type="text/javascript">
	$(function() {
		shopCart("${pageContext.request.contextPath}/product/shopCartCount?time="
				+ new Date().getTime());
	})
	function delectComment(id, uid) {
		$
				.ajax({
					type : 'post',
					url : "${pageContext.request.contextPath}/shopCart/toMoveCProduct?time="
							+ new Date().getTime(),
					data : {
						pid : id,
					},
					dataType : 'json',
					success : function(data) {
						if (data.ok) {
							layer.msg("取消成功");

							window.location.href = "${pageContext.request.contextPath}/product/productInfo?pid="
									+ id;
						} else
							layer.msg("取消失败");
					},
				});
	}
	function addComment(id, uid) {

		if (uid == '') {
			window.location.href = "${pageContext.request.contextPath}/login.jsp";
		} else {
			$
					.ajax({
						type : 'post',
						url : "${pageContext.request.contextPath}/shopCart/moveProductToCollection?time="
								+ new Date().getTime(),
						data : {
							pid : id,
						},
						dataType : 'json',
						success : function(data) {
							if (data.ok) {
								layer.msg("收藏成功");

								window.location.href = "${pageContext.request.contextPath}/product/productInfo?pid="
										+ id;
							} else
								layer.msg("收藏失败");
						},
					});
		}
	}
	function shopcart(id, uid) {
		var standName = $("#shop").val().trim();
		var shopCount = $("#text_box").val().trim();
		console.log(standName);
		console.log(id);
		console.log(shopCount);
		console.log(uid);
		if (uid == '') {
			window.location.href = "${pageContext.request.contextPath}/login.jsp";
		}
		if (shopCount == 0)
			layer.msg("请选择数量");
		else {
			$
					.ajax({
						type : 'post',
						url : "${pageContext.request.contextPath}/product/addShopCart?time="
								+ new Date().getTime(),
						data : {
							pid : id,
							sname : standName,
							shopCount : shopCount
						},
						dataType : 'json',
						success : function(data) {
							if (data.ok) {
								layer.msg("添加成功");
								shopCart("${pageContext.request.contextPath}/product/shopCartCount?time="
										+ new Date().getTime());
								//window.location.href="${pageContext.request.contextPath}/product/productInfo?pid="+id;
							} else
								layer.msg("请选择物品");
						},
					});
		}
	}
</script>
</html>