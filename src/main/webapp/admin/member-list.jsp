<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
<script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layer/layer.js"></script>
<link href="${pageContext.request.contextPath}/admin/layer/theme/default/layer.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/city2.js"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">

		城市选择：<select name="city" id="city" style="width:120px;height:29px;" ></select>
		<button type="submit" class="btn btn-success radius" id="" name="" onclick="userSearch()"><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<button type='button' class='btn btn-mini btn-info' onclick="exportData()">导出</button>
    <button type='button' class='btn btn-mini btn-success' onclick="exportData()">全部导出</button>
    <span class="r">共有数据：<strong>${fn:length(userLists)}</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" id="allS"></th>
				<th width="120">ID</th>
				<th width="100">用户名</th>
				<th width="40">性别</th>
				<th width="90">手机</th>
				<th width="150">邮箱</th>
				<th width="50">所在城市</th>
				<th width="130">加入时间</th>
				<th width="70">状态</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody id="user_list">
			<c:forEach items="${userLists}" var="user" varStatus="i" step="1">
				<tr class="text-c">
				    <td><input type="checkbox" value="${user.userId}" name="options"></td>
					<td>${user.userId}</td>
					<td><u style="cursor:pointer" class="text-primary" onclick="member_show('${user.username}','${pageContext.request.contextPath}/manage/user/userInfo?uid=${user.userId}','${user.userId}','360','400')">${user.username}</u></td>
					<td>${user.sex}</td>
					<td>${user.phone}</td>
					<td>${user.email}</td>
					<td>${user.city}</td>
					<td>${user.registerTime}</td>
					<td class="td-status" id="state">
						<c:if test="${user.status == 0}">
							<span class="label label-success radius">未激活</span>
						</c:if>
						<c:if test="${user.status == 1}">
							<span class="label label-success radius">已激活</span>
						</c:if>
						<c:if test="${user.status == 2}">
							<span class="label label-success radius">已删除</span>
						</c:if>
					</td>
					<td class="td-manage">
						<c:if test="${user.status != 2}">
							<a style="text-decoration:none" class="ml-5" onClick="change_password('初始密码','${user.email}','${user.userId}','600','270')" href="javascript:;" title="初始密码">
								<i class="Hui-iconfont" style="color:#519af2;font-size: 16px">&#xe63f;</i>
							</a>
							<a style="text-decoration:none" class="ml-5" onClick="member_del(this,'${user.userId}')" href="javascript:;" title="删除">
								<i class="Hui-iconfont" style="color:#ea2222;font-size: 16px">&#xe6e2;</i>
							</a>
						</c:if>
						<c:if test='${user.status == 2}'>
								<a style="text-decoration:none" class="ml-5" onClick="member_res(this,'${user.userId}')" href="javascript:;" title="还原">
								<i class="Hui-iconfont" style="color:#5eb95e;font-size: 16px">&#xe68f;</i>
							</a>
							</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/HUI/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/datatables/1.10.15/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$("#allS").click(function() {
	if(this.checked){
		$("#user_list :checkbox").prop("checked",true);
	}else{
		$("#user_list :checkbox").prop("checked",false);
	}
})
function exportData() {
	var options = $("input[name='options']:checked");
	var param = [];
	$.each(options, function (index, item) {
         console.log($(item).val());
         var key = $(item).val();
         param.push(key);
     });
	if(options.length == 0){
		window.location.href = "${pageContext.request.contextPath}/manage/user/exportData";
	}else{
		console.log(param);
		window.location.href = "${pageContext.request.contextPath}/manage/user/exportData?option=" + param;
	}
}
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,4,5]}// 制定列不参与排序
		]
	});
});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
     $.ajax({
         url: "${pageContext.request.contextPath}/manage/user/initialPassword?time=" + new Date().getTime(),
         type: "post",
         data: {
             uid: id,
             email:url
         },
         success: function (result) {
         	console.log(result);
             if (result.msg == "" || result.msg == null) {
                 layer.msg("无法修改");
             } else {
                 layer.msg("密码初始化成功，初始密码已经发送到该用户邮箱");
             }
         }
     })
	/* layer_show(title,url,w,h);	 */
}

/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: "${pageContext.request.contextPath}/manage/user/deleteUser?time=" + new Date().getTime(),
			data:{uid:id},
			dataType: 'json',
			success: function(data){
				if(data.ok){
					layer.msg(data.msg,{icon:1,time:1000});
					window.location.href="${pageContext.request.contextPath}/manage/user/userList";
				}else{
					layer.msg(data.msg,{icon:1,time:1000});
				}
			},
			error:function(data) {
				console.log(data.msg);
			}
		});		
	});
}

/*用户-还原*/
function member_res(obj,id){
	layer.confirm('确认要还原吗？',function(index){
		$.ajax({
			type: 'POST',
			url: "${pageContext.request.contextPath}/manage/user/deleteUser?time=" + new Date().getTime(),
			data:{uid:id},
			dataType: 'json',
			success: function(data){
				if(data.ok){
					layer.msg(data.msg,{icon:1,time:1000});
					window.location.href="${pageContext.request.contextPath}/manage/user/userList";
				}else{
					layer.msg(data.msg,{icon:1,time:1000});
				}
			},
			error:function(data) {
				console.log(data.msg);
			}
		});		
	});
}
$(function () {
	var city = '';
    initProvince(city);
})
function initProvince(city) {
    var optionStr = "<option value=\"-1\">请选择省</option>";
    for (var province in citys) {
        optionStr += "<option value=\"" + citys[province].n + "\"";
        if (city == citys[province].n) {
            optionStr += "selected='selected'";
        }
        optionStr += ">" + citys[province].n + "</option>";
    }
    $("#city").append(optionStr);
}
function userSearch(){
	var searchStartTime =$("#datemin").val().trim();
	var searchEndTime = $("#datemax").val().trim();
	var searchCity = $("#city").val().trim();
	console.log(searchStartTime+"开始"+searchEndTime+"结束"+searchCity+"城市");
	if(searchCity==-1&&searchStartTime==""&&searchEndTime==""){
		console.log("没有");
		window.location.href = "${pageContext.request.contextPath}/manage/user/userList";
	}
	else {
		console.log("有");
	    window.location.href = "${pageContext.request.contextPath}/manage/user/userSearch?searchStartTime="+searchStartTime+"&searchEndTime="+searchEndTime+"&searchCity="+searchCity;
	}
	
}
</script> 
</body>
</html>