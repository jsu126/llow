/*$(function () {

    $('#switch_qlogin').click(function () {
        $('#switch_login').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#switch_qlogin').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#switch_bottom').animate({left: '0px', width: '70px'});
        $('#qlogin').css('display', 'none');
        $('#web_qr_login').css('display', 'block');

    });
    $('#switch_login').click(function () {

        $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
        $('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
        $('#switch_bottom').animate({left: '154px', width: '70px'});

        $('#qlogin').css('display', 'block');
        $('#web_qr_login').css('display', 'none');
    });
    if (getParam("a") == '0') {
        $('#switch_login').trigger('click');
    }

    $("#email").blur(function () {
        var username = $(this).val();
        $.ajax({
            url: "/llow/user/emailRegisterFont?time=" + new Date().getTime(),
            type: "post",
            data: {
                vuUserName: username
            },
            dataType:"text",
            success: function (result) {
                if (result.msg == "" || result.msg == null) {
                    $("#ereg").attr('disabled', false);
                } else {
                    layer.msg(result.msg);
                    $("#ereg").attr('disabled', true);

                }
            }
        })
    })
    
    
    
    
});

function logintab() {
    scrollTo(0);
    $('#switch_qlogin').removeClass("switch_btn_focus").addClass('switch_btn');
    $('#switch_login').removeClass("switch_btn").addClass('switch_btn_focus');
    $('#switch_bottom').animate({left: '154px', width: '96px'});
    $('#qlogin').css('display', 'none');
    $('#web_qr_login').css('display', 'block');

}


//根据参数名获得该参数 pname等于想要的参数名 
function getParam(pname) {
    var params = location.search.substr(1); // 获取参数 平且去掉？ 
    var ArrParam = params.split('&');
    if (ArrParam.length == 1) {
        //只有一个参数的情况 
        return params.split('=')[1];
    } else {
        //多个参数参数的情况
        for (var i = 0; i < ArrParam.length; i++) {
            if (ArrParam[i].split('=')[0] == pname) {
                return ArrParam[i].split('=')[1];
            }
        }
    }
}

function changeImg() {
    var date = new Date().getTime();
    $("#img").attr("src", "/vote/user/getImage?time=" + date);
}

function login() {
    var date = new Date().getTime();
    var username = $("#u").val();
    var password = $("#p").val();
    var code = $("#c").val();
    if (username.trim() === "") {
        layer.msg("用户名不能为空");
    } else if (password.trim() === "") {
        layer.msg("密码不能为空");
    } else if (code.trim() === "") {
        layer.msg("验证码不能为空");
    } else {
        $.ajax({
            url: "/vote/user/login?time=" + date,
            type: "post",
            dataType:"json",
            data: {
            	vuUserName: username,
                vuPassword: password,
                code: code
            },
            success: function (result) {
            	console.log(result);
            	if(result.date != null){
            		var msg = result.msg;
            		var patt = new RegExp("null");
            		if(patt.test(msg) == true){
            			window.location.href = "VoteIndex.jsp";
            		}else{
            			window.location.href = result.msg;
            		}
            	}else{
            		layer.msg(result.msg);
                    changeImg();
            	}
                
                
                if (result.msg === "" || result.msg === null) {
                    
                } else if (result.msg == '-1') {
                    window.location.href = "VoteIndex.jsp";
                } else {
                    layer.msg(result.msg);
                    changeImg();
                }
            }
        })
    }
}
*/

function register(i) {
	var num=i;
	console.log(num);
    var date = new Date().getTime();
    var password1 = $("#password1").val();
    var password2 = $("#password2").val();
    var password3 = $("#password3").val();
    var password4 = $("#password4").val();
    var email = $("#email").val();
    var phone = $("#phone").val();
    var protocol1=$("#reader-me1").prop("checked");
    var protocol2=$("#reader-me2").prop("checked");
	console.log(protocol1);
    
    var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
    var passwordReg = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
    
	if (num === 1) {
		console.log("num1");
		console.log(password1);
		if (!email.match(emailReg)) {
			layer.msg("邮箱格式错误。温馨提示：（例：xxxx@qq.com）");
		} else if (password1 !== password2) {
			layer.msg("两个密码不一致");
		} else if (!password1.match(passwordReg)|| !password2.match(passwordReg)) {
			layer.msg("密码格式有限，谨慎输入。温馨提示：（格式：字符数字6-10位）");
		}else if(protocol1!=true){
			layer.msg("请同意协议.");	
		}else {
			$.ajax({
				url : "/llow/user/emailRegister?time=" + date,
				type : "post",
				dataType:"json",
				data : {
					password:password1,
					email:email
				},
				success : function(result) {
					console.log(result);
					if (result== "" || result== null) {
						console.log(result);
						window.location.reload();
					} else {
						layer.msg(result+"error");
					}
				}
			})
		}
	}else {

		if (!phone.match(phoneReg)) {
			  layer.msg("手机格式错误。温馨提示：（格式：数字11位）");
		} else if (password3 !== password4) {
			layer.msg("两个密码不一致");
		} else if (!password3.match(passwordReg)
				|| !password4.match(passwordReg)) {
			layer.msg("密码格式有限，谨慎输入。温馨提示：（格式：字符数字6-10位）");
		}else if(protocol2!=true){
			layer.msg("请同意协议.");	
		} else {
			$.ajax({
				url : "/llww/user/phoneRegister?time=" + date,
				type : "post",
				data : {
					password : password3,
					phone : phone
				},
				dataType:"json",
				success : function(result) {
					console.log(result);
					if (result.msg == "" || result.msg == null) {
						window.location.reload();
					} else {
						layer.msg(result.msg);
					}
				}
			})
		}

	}
    
}


/*function register() {
    var date = new Date().getTime();
    var username = $("#user").val();
    var password = $("#passwd").val();
    var password2 = $("#passwd2").val();
    var phone = $("#phone").val();
    var email = $("#email").val();


    var emailReg = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    var phoneReg = /^1(3|4|5|6|7|8|9)\d{9}$/;
    var usernameReg = /^[\dA-Za-z_\-]{6,10}$/;
    var passwordReg = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{6,20}$/;
    if (!username.match(usernameReg)) {
        layer.msg("用户名格式有限，谨慎输入。温馨提示：（格式：字符数字6-10位）");
    } else if (!phone.match(phoneReg)) {
        layer.msg("手机格式错误。温馨提示：（格式：数字11位）");
    } else if (!email.match(emailReg)) {
        layer.msg("邮箱格式错误。温馨提示：（例：xxxx@qq.com）");
    } else if (password !== password2) {
        layer.msg("两个密码不一致");
    } else if (!password.match(passwordReg) || !password2.match(passwordReg)) {
        layer.msg("密码格式有限，谨慎输入。温馨提示：（格式：字符数字6-10位）");
    } else {
        $.ajax({
            url: "/vote/user/register?time=" + date,
            type: "post",
            data: {
            	vuUserName: username,
            	vuPassword: password,
            	vuPhone: phone,
            	vuEmail: email
            },
            success: function (result) {
            	console.log(result);
                if (result.msg == "" || result.msg == null) {
                    window.location.reload();
                } else {
                    layer.msg(result.msg);
                }
            }
        })
    }

}*/