<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>类目管理</title>
<script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layer/layer.js"></script>
<link href="${pageContext.request.contextPath}/admin/layer/theme/default/layer.css">
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 分类管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
	<a href="javascript:;" onclick="category_add('添加类目','${pageContext.request.contextPath}/admin/category-add.jsp','300','300')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加类目</a></span>
    </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="120">ID</th>
				<th width="100">类目名</th>
				<th width="200">状态</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		 <c:forEach items="${list}" var="l" varStatus="i" step="1">
					<tr class="text-c va-m">
						<td>${i.index+1}</td>
						<td><span class="name">${l.categoryName}</span></td>
						<c:choose>
						<c:when test="${l.categoryStatus==1}">
						<td class="td-status"><span class="label label-success radius">使用中</span></td>
					    </c:when>
					    <c:otherwise>
					    <td class="td-status"><span class="label label-default radius">已删除</span></td>
					    </c:otherwise>
						</c:choose>
						<td class="td-manage"><a style="text-decoration:none" class="ml-5" onclick="category_modify('修改类目','${pageContext.request.contextPath}/manage/category/categoryModify?categoryId=${l.categoryId}&categoryName=中文','300','300')"  href="javascript:;" title="编辑"><i class="Hui-iconfont" style="color:#519af2;font-size: 16px">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="category_del(${l.categoryId})" href="javascript:;" title="删除"><i class="Hui-iconfont" style="color:#ea2222;font-size: 16px">&#xe6e2;</i></a></td>
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
		  {"orderable":false,"aTargets":[2,3]}// 制定列不参与排序
		]
	});
});


/*类目-添加*/
function category_add(title,url,w,h){
	layer_show(title,url,w,h);
}


/*类目-修改*/
function category_modify(title,url,w,h){
	layer_show(title,url,w,h);
}



/* 
function category_modify(id,categoryName){
	console.log(id);
	console.log(categoryName);
	$.ajax({
		type:"post",
	    url:"${pageContext.request.contextPath}/admin/manage/modifyCategoryContext",
	    data:{
	    	  categoryId:id,
	    	  categoryName:categoryName
	    	
	    },
	    dataType:"json",
	    success:function(data){
	    	if(data==null||data.trim()==""){
	    		window.location.href="${pageContext.request.contextPath}/admin/category-modify.jsp";
	    		
	    	}else{
	    		layer.msg("修改失败");
	    	}
	    	
	    	
	    }
		
		
	})  */
	


/*类目-删除 */
function category_del(id){
		
		console.log(id);
	/* 	console.log(id);
		if(window.confirm("确定停用吗")){
			window.location.href="${pageContext.request.contextPath}/manage/category/deleteCategory?categoryId="+id;   
		} */
	   if(window.confirm("确定操作吗")){
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/manage/category/deleteCategory',  
			data:{
				categoryId:id
			},
			dataType: 'json',
			success: function(data){
				if(data==null||data.trim()==""){
		    		window.location.href="${pageContext.request.contextPath}/manage/category/categoryList";
		    		
		    	}
			}
		})        
	 }
}

	
	

	
	

</script> 
</body>
</html>