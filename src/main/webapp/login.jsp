<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css" />
		<link href="${pageContext.request.contextPath}/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		 <script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
		 <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
	</head>

	<body>

		<div class="login-boxtitle">
			<a href="home.html"><img alt="logo" src="images/logobig.png" /></a>
		</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>

				<div class="login-form">
					<form>
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> <input
								type="text" name="userName" id="userName" placeholder="邮箱/手机/用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="password" id="password"
								placeholder="请输入密码">
						</div>
						
						<div class="verification">
									<label for="code"><i class="am-icon-code-fork"></i></label> 
									<input type="tel" name="code" id="code" placeholder="请输入验证码"" style="width: 78%;margin-top: -30px">
									<img src="${pageContext.request.contextPath}/user/getImage"  onclick="changeImg()" style="border: 1px solid #ccc" height="40px" width="20%"
                                     id="img"/>
										
								</div>
					</form>
				</div>

				<div class="login-links">
					<!-- <label for="remember-me"><input id="remember-me1"
						type="checkbox">记住密码</label>  --><!-- <a href="#" class="am-fr">忘记密码</a> --> <a
						href="${pageContext.request.contextPath}/register.jsp" class="zcnext am-fr am-btn-default">注册</a> <br />
				</div>
				<div class="am-cf">
					<input name="login" type="button" value="登录" onclick="login()" id="login" class="am-btn am-btn-primary am-btn-sm">
				</div>
				<!-- <div class="partner">
					<h3>合作账号</h3>
					<div class="am-btn-group">
						<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span>
						</a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span>
						</a></li>
					</div>
				</div> -->

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
	
	function changeImg() {
	    var date = new Date().getTime();
	    $("#img").attr("src", "${pageContext.request.contextPath}/user/getImage?time=" + date);
	}
	
	
	
	
	   function login(){
		    var date = new Date().getTime();
		    var password = $("#password").val();
		    var userName = $("#userName").val();  
		    var code = $("#code").val(); 
		    var passwordReg = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
				if (userName==null||userName.trim()=="") {
					layer.msg("账号不能为空");
				}else if (!password.match(passwordReg)) {
					layer.msg("密码格式有限，谨慎输入。温馨提示：（格式：字符数字6-10位）");
				}else if(code==null||code.trim()=="") {
					layer.msg("验证码不能为空");
				}else {
					$.ajax({
						url : "${pageContext.request.contextPath}/user/userLogin?time=" + date,
						type : "post",
						dataType:"json",
						data : {
							password:password,
							username:userName,
							age:code
						},
						success : function(result) {
							if (result!= "") {
								changeImg();
								layer.msg(result);
							} else {
								window.location.href="${pageContext.request.contextPath}/index.jsp";
							}
						}
					})
				}       
	   }
	   
	   
	</script>				
					
	</body>

</html>