<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>绑定手机</title>

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

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<link
	href="${pageContext.request.contextPath}/layer/theme/default/layer.css">
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/shopCatr.js"></script>
		<script type="text/javascript">
        $(function(){
	           shopCart("${pageContext.request.contextPath}/product/shopCartCount?time=" + new Date().getTime());
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
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
							
							<c:if test="${user!=null}">
								<a href="${pageContext.request.contextPath}/information.jsp" target="_top" class="h">${user.username}</a>
								<a href="${pageContext.request.contextPath}/user/exit" target="_top">退出</a>
							</c:if>
							
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

				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">绑定手机</strong> / <small>Bind&nbsp;Phone</small>
					</div>
				</div>
				<hr />
				<!--进度条-->
				<div class="m-progress">
					<div class="m-progress-list">
						<span class="step-1 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">1<em class="bg"></em></i>
							<p class="stage-name">绑定手机</p>
						</span> <span class="step-2 step"> <em class="u-progress-stage-bg"></em>
							<i class="u-stage-icon-inner">2<em class="bg"></em></i>
							<p class="stage-name">完成</p>
						</span> <span class="u-progress-placeholder"></span>
					</div>
					<div class="u-progress-bar total-steps-2">
						<div class="u-progress-bar-inner"></div>
					</div>
				</div>
				<form class="am-form am-form-horizontal">
				<div class="existPhone">
					<div class="am-form-group bind">
						<label for="user-phone" class="am-form-label">验证手机</label>
						<div class="am-form-content">
							<span id="user-phone" value="${user.phone}"></span>
						</div>
					</div>
					<div class="am-form-group code">
						<label for="user-code" class="am-form-label">验证码</label>
						<div class="am-form-content">
							<input type="tel" id="user-code" placeholder="短信验证码">
						</div>
						<!-- <a class="btn" href="javascript:void(0);"
							onClick="sendFirstCode();" id="sendMobileCode">
							<div class="am-btn am-btn-danger">验证码</div>
						</a> -->
						<a class="btn nopass" > <input type="button"
											class="am-btn am-btn-danger" id="send1" onClick="sendFirstCode();"
											value="获取验证码" />
										</a>
										
										<a class="btn pass" style="display:none"> <input type="button"
											class="am-btn am-btn-danger" 
											value="验证通过" />
										</a>

					</div>
					<div class="am-form-group">
						<label for="user-new-phone" class="am-form-label">验证手机</label>
						<div class="am-form-content">
							<input type="tel" id="user-new-phone" placeholder="绑定新手机号">
						</div>
					</div>
					<div class="am-form-group code">
						<label for="user-new-code" class="am-form-label">验证码</label>
						<div class="am-form-content">
							<input type="tel" id="user-new-code" placeholder="短信验证码">
						</div>
						<!-- <a class="btn" href="javascript:void(0);"
							onClick="sendSecondCode();" id="sendMobileCode">
							<div class="am-btn am-btn-danger">验证码</div>
						</a> -->
						<a class="btn"> <input type="button"
							class="am-btn am-btn-danger" id="send2"
							onClick="sendSecondCode();" value="获取验证码" />
						</a>

					</div>
					<div class="info-btn">
						<div class="am-btn am-btn-danger" onClick="saveUpdate();">保存修改</div>
					</div>
</div>


<div class="noExistPhone">
					
					<div class="am-form-group">
						<label for="userphone" class="am-form-label">验证手机</label>
						<div class="am-form-content">
							<input type="tel" id="userphone" placeholder="绑定手机号">
						</div>
					</div>
					<div class="am-form-group code">
						<label for="usercode" class="am-form-label">验证码</label>
						<div class="am-form-content">
							<input type="tel" id="usercode" placeholder="短信验证码">
						</div>
						
						<a class="btn"> <input  id="sendCode" type="button"
							class="am-btn am-btn-danger" id="send"
							onclick="sendPhoneCode()" value="获取验证码" />
						</a>

					</div>
					<div class="info-btn">
						<div class="am-btn am-btn-danger" onclick="savePhone()">保存</div>
					</div>
</div>



				</form>

			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						<a href="#">恒望科技</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
							href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
					</p>
				</div>
				<div class="footer-bd">
					<p>
						<a href="#">关于恒望</a> <a href="#">合作伙伴</a> <a href="#">联系我们</a> <a
							href="#">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
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
	<script type="text/javascript">
	
		$(function() {
			var phone = '${user.phone}';
			var name = '${user.username}';
			if(phone==""||phone=="null"){
				$('noExistPhone').css("display", "block");
				$('.existPhone').css("display", "none");
			}else{
				$('existPhone').css("display", "block");
				$('.noExistPhone').css("display", "none");
				var mphone = phone.substr(0, 3) + '****' + phone.substr(7);

				$('#user-phone').text(mphone)
			}
			
			/* 	$("#user-new-phone").blur(function() {
			var newPhone = $(this).val().trim();
			console.log(newPhone);
			var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
            if(newPhone==null||newPhone=""){
            	layer.msg("手机号不能为空");
            }
			if (!newPhone.match(phoneReg)) {

				layer.msg("手机格式错误。温馨提示：（格式：数字11位）");

			}
		}) */
			

	

		});



		function sendFirstCode() {
			//var phone = $("#phone").val();
			var code = $("#send1");
			console.log(code);

			code.attr("disabled", true);
			setTimeout(function() {
				code.css("opacity", "0.8");
			}, 1000)
			var time = 60;
			var set = setInterval(function() {
				code.val("" + --time + "秒后重新获取");
				if (time == 55) {
					$(function() {
						console.log("发送验证码");
						$.ajax({
							type : "post",
						 	url : "${pageContext.request.contextPath}/user/phoneCode", 
							data : {
								
								phone : '${user.phone}'

							},
							dataType : "json",
							success : function(result) {
								if (result.msg == "" || result.msg == null) {
									console.log("ok");
									// $("input").val("");

								} else {
									console.log("no");
									
									layer.msg(result.msg);
								}
							}
						});

					})

				}
			}, 1000);
			setTimeout(function() {
				code.attr("disabled", false).val("重新获取验证码");
				clearInterval(set);
			}, 60000);
		}

		
		function sendSecondCode() {
			var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
			var code = $("#send2");
			console.log(code);
			if ($("#user-code").val() == "" || $("#user-code").val() == null) {
				layer.msg("第一个验证码为空，请输入验证码");
			}
			else {
				
				
				if ($("#user-new-phone").val() == ""|| $("#user-new-phone").val() == null) {
					layer.msg("新手机号码为空，请输入号码");
				}else if(!$("#user-new-phone").val().match(phoneReg)){
					layer.msg("新手机号码请输入正确的格式");
				}else {
					code.attr("disabled",true);
					setTimeout(function() {
						code.css("opacity", "0.8");
					}, 1000)
					var time = 60;
					var set = setInterval(function() {
						code.val("" + --time + "秒后重新获取");
						if (time == 55) {
							$(function() {
								console.log("发送验证码");
								  $.ajax({
									type : "post",
								   url : "${pageContext.request.contextPath}/user/newPhoneCode", 
									data : {
										usercode : $("#user-code").val(),
										phone : $("#user-new-phone").val()

									},
									dataType : "json",
									success : function(result) {
										if (result.msg == ""|| result.msg == null) {
											$('.pass').css("display", "block");
											$('.nopass').css("display", "none");

										} else {
											layer.msg(result.msg);
										}
									}
								});

							})

						}
					}, 1000);
					setTimeout(function() {
						code.attr("disabled", false).val("重新获取验证码");
						clearInterval(set);
					}, 60000);
				}
			}
		}
		function saveUpdate() {
			var newphone = $("#user-new-phone").val();
			var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
			if ($("#user-code").val() == "" || $("#user-code").val() == null) {
				layer.msg("第一个验证码为空，请输入验证码");
			}else if(newphone==null||newphone==""){
				layer.msg("手机号为空");
			}else if(!newphone.match(phoneReg)){
				layer.msg("请输入正确的手机格式");
			}else if ($("#user-new-code").val() == ""|| $("#user-new-code").val() == null) {
				layer.msg("第二个验证码为空，请输入验证码");
			}else {
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/user/updateNewPhone", 
					data : {
						userId : '${sessionScope.user.userId}',
						newcode : $("#user-new-code").val(),
						phone : $("#user-new-phone").val()

					},
					dataType : "json",
					success : function(result) {
						if (result.msg == "" || result.msg == null) {
							// $("input").val("");
							layer.msg("绑定新手机成功");

							 window.location.href = "${pageContext.request.contextPath}/safety.jsp"; 

							window.location.href = "${pageContext.request.contextPath}/user/safety";

						} else {
							layer.msg(result.msg);
						}
					}
				});
			}
		}
		
		
		
		
		
		$(function() {
			var code = $("#sendCode");
			$("#userphone")
					.blur(
							function() {
								var phone = $("#userphone").val();
								$
										.ajax({
											url : "${pageContext.request.contextPath}/user/phoneRegisterFont?time="
													+ new Date().getTime(),
											type : "post",
											data : {
												phone : phone
											},
											dataType : "json",
											success : function(result) {
												console.log(result);
												if (result == ""|| result == null) {
													
													code.attr("disabled", false).val("获取验证码");
													
												} else {
													code.attr("disabled", true).val("电话已经存在");
												

												}
											}
										})
							})

		});

		
		
		
		function sendPhoneCode() {
			var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
			var phone = $("#userphone").val();
			if (phone == null || phone.trim() == "") {
				layer.msg("请输入手机号码")

			}else if(!phone.match(phoneReg)){
				layer.msg("请输入正确的手机号码");
			}else {
				var code = $("#sendCode");
				code.attr("disabled",true);
				setTimeout(function() {
					code.css("opacity", "0.8");
				}, 1000)
				var time = 60;
				var set = setInterval(
						function() {
							code.val("" + --time + "秒后重新获取");
							if (time == 55) {
								$(function() {
								
									$
											.ajax({
												  url : "${pageContext.request.contextPath}/user/sendCode?time="
														+ new Date().getTime(),   
												type : "post",
												data : {
													age : 1,
													phone : phone
												},
												dataType : "json",
												success : function(result) {

													if (result != ""|| result != null) {

														layer.msg("发送验证码成功");

													}
												}
											})

								})

							}
						}, 1000);
				setTimeout(function() {
					code.attr("disabled", false).val("重新获取验证码");
					clearInterval(set);
				}, 60000);

			}

		}
		
		
		  function  savePhone(){
			  var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
			  var phone = $("#userphone").val();
			  var code = $("#usercode").val();
			  console.log("userPhoen"+phone);
			  console.log("code"+code);
			   if(phone==null||phone==""){
				   layer.msg("手机号不能为空");
			   }else if(!phone.match(phoneReg)){
				   layer.msg("请输入正确的手机号");
			   }else if(code==null||code==""){
				   layer.msg("验证码不能为空");
			   }else{
				   
				   $.ajax({
						url : "${pageContext.request.contextPath}/user/saveBindPhone", 
						type : "post",
						data : {
							bindPhoneCode : code,
							bindPhone : phone
						},
						dataType : "json",
						success : function(result) {
							if (result == "" || result == null) {
								window.location.href = "${pageContext.request.contextPath}/information.jsp";
								/* location.reload(); */
							} else {
								layer.msg(result);
							}
						}
					});
				   
				   
			   }
			  
			  
			  
			  
		  }

		
		
		
		
		
		
		
		
	
	</script>
</body>

</html>