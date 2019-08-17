<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<style type="text/css">
.btn {
	border: 0;
	width: 40px;
	height: 40px;
	line-height: 40px;
	float: left;
	color: white;
	background-color: #08c;
	border-radius: 20px;
	text-align: center;
	text-decoration: none;
}
</style>



<link rel="stylesheet"
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="${pageContext.request.contextPath}/css/dlstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<%-- 	<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
</head>

<body>

	<div class="login-boxtitle">
		<a href="home/demo.html"><img alt="" src="${pageContext.request.contextPath}/images/logobig.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img src="images/big.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">邮箱注册</a></li>
						<li><a href="">手机号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">
							<form method="post">
								<div class="user-email">
									<label for="email"><i class="am-icon-envelope-o"></i></label> <input
										type="email" name="email" id="email" placeholder="请输入邮箱账号">
								</div>

								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="password1" id="password1"
										placeholder="设置密码">
								</div>

								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" name="password2" id="password2"
										placeholder="确认密码">
								</div>

							</form>

							<div class="login-links">
								<label for="reader-me"> <input id="reader-me1"
									type="checkbox"> 点击表示您同意商城《服务协议》
								</label>
							</div>

							<div class="am-cf">
								<input type="button" id="ereg" name="" value="注册"
									onclick="register(1)"
									class="am-btn am-btn-primary am-btn-sm am-fl">
							</div>
						</div>





						<div class="am-tab-panel">
							<form method="post">
								<div class="user-phone">
									<label for="phone"><i
										class="am-icon-mobile-phone am-icon-md"></i></label> <input type="tel"
										name="phone" id="phone" placeholder="请输入手机号">
								</div>
								<div class="verification">
									<label for="code"><i class="am-icon-code-fork"></i></label> <input
										type="tel" name="code" id="code" placeholder="请输入验证码"
										" style="width: 50%"> <input type="button" id="send"
										value="获取验证码" onclick="sendCode()"
										style="width: 48.5%; text-align: left; padding-left: 20px">

								</div>
								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="password3" id="password3"
										placeholder="设置密码">
								</div>
								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" name="password4" id="password4"
										placeholder="确认密码">
								</div>
							</form>

							<div class="login-links">
								<label for="reader-me"> <input id="reader-me2"
									type="checkbox"> 点击表示您同意商城《服务协议》
								</label>
							</div>

							<div class="am-cf">
								<input type="button" id="preg" name="phone" value="注册"
									onclick="register(2)"
									class="am-btn am-btn-primary am-btn-sm am-fl">
							</div>



							<hr>
						</div>

						<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  })
								</script>

					</div>
				</div>

			</div>
		</div>

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

		<script type="text/javascript">
	

		function sendCode() {
			
			var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
			var phone = $("#phone").val();
			if (phone == null || phone.trim() == "") {
				layer.msg("请输入手机号码")

			}else if(!phone.match(phoneReg)){
				layer.msg("请输入正确的手机号码");
			}else {
				var code = $("#send");
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

													if (result != ""
															|| result != null) {

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

		$(function() {
			var code = $("#send");
			$("#email")
					.blur(
							function() {
								var email = $("#email").val();
								$
										.ajax({
											url : "${pageContext.request.contextPath}/user/emailRegisterFont?time="+ new Date().getTime(),
											type : "post",
											data : {
												email : email
											},
											dataType : "json",
											success : function(result) {
												if (result!=1) {
													console.log("没有人绑定");
												} else {
													layer.msg("邮箱已经存在");

												}
											}
										})
							})

			$("#phone")
					.blur(
							function() {
								var phone = $("#phone").val();
								$.ajax({
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

		function register(i) {
			var num = i;
			console.log(num);
			var date = new Date().getTime();
			var password1 = $("#password1").val();
			var password2 = $("#password2").val();
			var password3 = $("#password3").val();
			var password4 = $("#password4").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var code = $("#code").val();
			var protocol1 = $("#reader-me1").prop("checked");
			var protocol2 = $("#reader-me2").prop("checked");
			var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
			var passwordReg = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
			var codeReg = /^\d{6}$/;
			if (num === 1) {

				if (!email.match(emailReg)) {
					layer.msg("邮箱格式错误。温馨提示：（例：xxxx@qq.com）");
				}else if (!password1.match(passwordReg)
						|| !password2.match(passwordReg)) {
					layer.msg("密码格式有限，谨慎输入。温馨提示：（格式：字符数字6-10位）");
				}else if (password1 !== password2) {
					layer.msg("两个密码不一致");
				}else if (protocol1 != true) {
					layer.msg("请同意协议.");
				} else {
					$
							.ajax({
								url : "${pageContext.request.contextPath}/user/emailRegister?time="
										+ date,
								type : "post",
								dataType : "json",
								data : {
									password : password1,
									email : email
								},
								success : function(result) {
									if (result == "" || result == null) {
										window.location.href = "${pageContext.request.contextPath}/login.jsp";
									} else {
										layer.msg(result);
									}
								}
							})
				}
			} else {

				if (!phone.match(phoneReg)) {
					layer.msg("手机格式错误。温馨提示：（格式：数字11位）");
				} else if (!code.match(codeReg)) {
					layer.msg("请输入6位数字验证码");
				} else if (!password3.match(passwordReg)
						|| !password4.match(passwordReg)) {
					layer.msg("密码格式有限，谨慎输入。温馨提示：（格式：字符数字6-10位）");
				} else if (password3 !== password4) {
					layer.msg("两个密码不一致");
				}else if (protocol2 != true) {
					layer.msg("请同意协议.");
				} else {
					$
							.ajax({
								url : "${pageContext.request.contextPath}/user/phoneRegister?time="
										+ date, 
								type : "post",
								data : {
									age : code,
									password : password3,
									phone : phone
								},
								dataType : "json",
								success : function(result) {
									if (result.msg == "" || result.msg == null) {
										window.location.href = "${pageContext.request.contextPath}/login.jsp";
									} else {
										layer.msg(result);
									}
								}
							})
				}

			}

		}
	</script>
</body>

</html>