<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/bootstrap-3.3.7-dist/css/bootstrap.min.css" /> --%>
<link
	href="${pageContext.request.contextPath}/admin/flatlab/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/admin/flatlab/css/bootstrap-reset.css"
	rel="stylesheet">
<!--external css-->
<link
	href="${pageContext.request.contextPath}/admin/flatlab/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/admin/flatlab/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css"
	rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/flatlab/css/owl.carousel.css"
	type="text/css">
<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/admin/flatlab/css/style.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/admin/flatlab/css/style-responsive.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/admin/layer/theme/default/layer.css"
	rel="stylesheet" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>我的桌面</title>
</head>
<style>
#main-content {
	margin-left: 20px;
	margin-top: -50px;
}

.site-footer .text-center a {
	color: #53bee6;
}
</style>
<body>
	<section id="container">
		<section id="main-content">
			<section class="wrapper">
				<div class="row state-overview">
					<div class="col-lg-3 col-sm-6">
						<section class="panel">
							<div class="symbol terques">
								<i class="icon-user"></i>
							</div>
							<div class="value">
								<h1 class="count">...</h1>
								<p>用户总数</p>
							</div>
						</section>
					</div>
					<div class="col-lg-3 col-sm-6">
						<section class="panel">
							<div class="symbol red">
								<i class="icon-tags"></i>
							</div>
							<div class="value">
								<h1 class=" count2">...</h1>
								<p>商品总数</p>
							</div>
						</section>
					</div>
					<div class="col-lg-3 col-sm-6">
						<section class="panel">
							<div class="symbol yellow">
								<i class="icon-shopping-cart"></i>
							</div>
							<div class="value">
								<h1 class=" count3">...</h1>
								<p>订单总数</p>
							</div>
						</section>
					</div>
					<div class="col-lg-3 col-sm-6">
						<section class="panel">
							<div class="symbol blue">
								<i class="icon-time"></i>
							</div>
							<div class="value">
								<h3 class=" count4">...</h3>
							</div>
						</section>
					</div>
				</div>
			</section>
			<div class="col-lg-4">
				<!--weather statement start-->
				<section class="panel">
					<div class="weather-bg">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-6">
									<i id="weather" class="icon-cloud"></i> <span id="city">...</span>
								</div>
								<div class="col-xs-6">
									<div class="degree">
										<span id="temperature">...</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<footer class="weather-category">
						<ul>
							<li class="active">
								<h5>湿度</h5> <span id="humidity">...</span>
							</li>
							<li>
								<h5>空气质量</h5> <span id="airCondition">...</span>
							</li>
							<li>
								<h5>风力</h5> <span id="wind">...</span>
							</li>
						</ul>
					</footer>
				</section>
				<!--weather statement end-->
			</div>
		</section>
		<footer class="site-footer" style="margin-top: 70px;">
			<div class="text-center">
				<p>
					Copyright &copy;2019-Present llow.com All Rights Reserved.本后台系统由<a
						href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui</a>提供前端静态页面技术支持
				</p>
			</div>
		</footer>
	</section>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/HUI/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/count.js"></script>
	<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
	<script type="text/javascript">
		$(function() {
			setInterval(() => {
				$(".count4").text(new Date().toLocaleString());
			}, 1000)
		})
		
		//统计
		$(function () {
			$.ajax({
				type:'post',
				url:"${pageContext.request.contextPath}/manage/user/userCount",
				dataType:"json",
				success:function(data){
					console.log(data);
					countUp(data);
				},
				error:function(XMLHttpRequest){
					if(XMLHttpRequest.status != 200){
						layer.alert("数据处理失败");
					}
				}
			});
			$.ajax({
				type:'post',
				url:"${pageContext.request.contextPath}/manage/product/productCount",
				dataType:"json",
				success:function(data){
					console.log(data);
					countUp2(data);
				},
				error:function(XMLHttpRequest){
					if(XMLHttpRequest.status != 200){
						layer.alert("数据处理失败");
					}
				}
			});
			$.ajax({
				type:'post',
				url:"${pageContext.request.contextPath}/manage/order/orderCount",
				dataType:"json",
				success:function(data){
					console.log(data);
					countUp3(data);
				},
				error:function(XMLHttpRequest){
					if(XMLHttpRequest.status != 200){
						layer.alert("数据处理失败");
					}
				}
			});
		})
		//天气
		$(function() {
			let ip = returnCitySN["cip"];
			$.ajax({
				type: 'get',
				url: "${pageContext.request.contextPath}/manage/system/weather",
				data:{ip:ip},
				dataType:"json",
				success: function (data){
					console.log(data);
					if(data != null){
						var weather = data.weather;
						console.log(weather);
						if(weather.indexOf("晴") >= 0){
							$("#weather").removeAttr("class");
							$("#weather").attr("class","icon-sun");
						}else if(weather.indexOf("雨") >= 0){
							$("#weather").removeAttr("class");
							$("#weather").attr("class","icon-umbrella");
						}
						$("#city").html(data.city);
						$("#temperature").html(data.temperature);
						$("#humidity").html(data.humidity);
						$("#airCondition").html(data.airCondition);
						$("#wind").html(data.wind);
					}
				},
				error:function(XMLHttpRequest){
					if(XMLHttpRequest.status != 200){
						layer.alert("数据处理失败");
					}
				}
			})
		})
	</script>
	
	<!--此乃百度统计代码，请自行删除-->
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>
	<!--/此乃百度统计代码，请自行删除-->
</body>
</html>