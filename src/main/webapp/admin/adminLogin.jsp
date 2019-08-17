<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">
<link
	href="${pageContext.request.contextPath}/admin/HUI/h-ui/css/H-ui.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/H-ui.login.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/HUI/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>
<title>礼来我网 后台登录</title>

</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
	<div class="header"></div>
	<div class="loginWraper">
		<div style="position: absolute; z-index: -1; top: 0px; left: 0px; bottom: 0px; right: 0px; overflow: hidden; background-size: cover; background-repeat: no-repeat; background-position: 50% 50%; background-image: none;">
			<video autoplay loop muted style="margin: auto; position: absolute; z-index: -1; top: 50%; left: 50%; transform: translate(-50%, -50%); visibility: visible; width: auto; height: 796px;">
				<source src="${pageContext.request.contextPath}/admin/video/Ipad3.mp4" type="video/mp4">
			</video>
		</div>
		<div id="loginform" class="loginBox">
			<h3 style="text-align: center;color: #fff">礼来我网&nbsp;&nbsp;后台管理系统</h3>
			<form class="form form-horizontal" action="index.html" method="post">
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
					<div class="formControls col-xs-8">
						<input id="userName" name="userName" type="text" placeholder="账户"
							class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
					<div class="formControls col-xs-8">
						<input id="password" name="password" type="password"
							placeholder="密码" class="input-text size-L">
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input id="code" class="input-text size-L" type="text"
							placeholder="验证码" style="width: 150px;"> <img id="img"
							src="${pageContext.request.contextPath}/manage/user/charCheck"
							onclick="changeChar()">
					</div>
				</div>
				<div class="row cl">
					<div class="formControls col-xs-8 col-xs-offset-3">
						<input type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录" onclick="adminLogin()"
							class="btn btn-success radius size-L" style="width: 200px;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Copyright &copy;2019-Present llow.com All Rights Reserved.本后台系统由</div>
	<script>
		function changeChar() {
			var date = new Date().getTime();
			$("#img").attr(
					"src",
					"${pageContext.request.contextPath}/manage/user/charCheck?time="
							+ date);
		}

		function adminLogin() {
			var date = new Date().getTime();
			var password = $("#password").val();
			var userName = $("#userName").val();
			var code = $("#code").val().toLowerCase();
			console.log(code);
			console.log(userName);
			console.log(password);
			var passwordReg = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
			if (userName == null || userName.trim() == "") {
				layer.msg("账号不能为空");
			} else if (!password.match(passwordReg)) {
				layer.msg("密码格式有限，谨慎输入。温馨提示：（格式：字符数字6-10位）");
			} else if (code == null || code.trim() == "") {
				layer.msg("验证码不能为空");
			} else {
				$
						.ajax({
							url : "${pageContext.request.contextPath}/manage/user/adminLogin?time="
									+ date,
							type : "post",
							dataType : "json",
							data : {
								password : password,
								adminName : userName,
								charCode : code
							},
							success : function(result) {
								console.log(result);
								if (result == "" || result == null) {
									window.location.href = "${pageContext.request.contextPath}/admin/index.jsp";
								} else {
									layer.msg(result);
								}
							}
						})
			}
		}
		
	</script>
</body>
</html>