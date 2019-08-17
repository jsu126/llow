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
<title>商品列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="pos-r">
<!-- <div class="pos-a" style="width:200px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5; overflow:auto;">
	<ul id="treeDemo" class="ztree"></ul>
</div> -->
<div>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<!-- <div class="text-c"> 日期范围：
			<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
			<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
			<input type="text" name="" id="" placeholder=" 产品名称" style="width:250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜产品</button>
		</div> -->
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" onclick="product_add('添加产品','${pageContext.request.contextPath}/admin/product-add.jsp')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加产品</a></span> <span class="r">共有数据：<strong>${fn:length(productList)}</strong> 条</span> </div>
		<div class="mt-20">
			<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th width="40">编号</th>
						<th width="60">缩略图</th>
						<th>商品ID</th>
						<th>产品名称</th>
						<th width="60">发布状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productList}" var="product" varStatus="i" step="1">
						<tr class="text-c va-m">
							<td>${i.index + 1}</td>
							<td><img width="60" class="product-thumb" src="${product.mainPicture}"></td>
							<td class="text-l"><a style="text-decoration:none" onClick="comment_show('商品评价详情','${pageContext.request.contextPath}/admin/product_comment.jsp?pid=${product.productId}','1001')" href="javascript:;">${product.productId}</a></td>
							<td class="text-l"><a style="text-decoration:none" onClick="product_show('商品详情','${pageContext.request.contextPath}/manage/product/productInfo?pid=${product.productId}','1001')" href="javascript:;">${product.productName}</a></td>
							<td class="td-status">
								<c:if test='${product.status==0}'>
									<span class="label label-success radius">已发布</span>
								</c:if>
								<c:if test='${product.status==1}'>
									<span class="label label-defaunt radius">已下架</span>
								</c:if>
								<c:if test='${product.status==2}'>
									<span class="label label-defaunt radius">已删除</span>
								</c:if>
							</td>
							<td class="td-manage">
								<c:if test='${product.status==1&&product.status!=2}'>
									<a style="text-decoration:none" onClick="product_start(this,'${product.productId}')" href="javascript:;" title="发布"><i class="Hui-iconfont" style="color:#4f9e07;font-size: 16px">&#xe603;</i></a>
								</c:if>
								<c:if test='${product.status==0&&product.status!=2}'>
								<a style="text-decoration:none" onClick="product_stop(this,'${product.productId}')" href="javascript:;" title="下架">
									<i class="Hui-iconfont" style="color:#2edee6;font-size: 16px">&#xe6de;</i>
								</a> 
								</c:if>
								<c:if test="${product.status!=2}">
								<a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','${pageContext.request.contextPath}/manage/product/getProductInfo?pid=${product.productId}','${product.productId}')" href="javascript:;" title="编辑">
									<i class="Hui-iconfont" style="color:#519af2;font-size: 16px">&#xe6df;</i>
								</a> 
								</c:if>
							<c:if test='${product.status!=2}'>
								<a style="text-decoration:none" class="ml-5" onClick="product_del(this,'${product.productId}')" href="javascript:;" title="删除">
									<i class="Hui-iconfont" style="color:#ea2222;font-size: 16px">&#xe6e2;</i>
								</a>
							</c:if>
							<c:if test='${product.status==2}'>
								<a style="text-decoration:none" class="ml-5" onClick="product_res(this,'${product.productId}')" href="javascript:;" title="还原">
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
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/HUI/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/datatables/1.10.15/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
/* var setting = {
	view: {
		dblClickExpand: false,
		showLine: false,
		selectedMulti: false
	},
	data: {
		simpleData: {
			enable:true,
			idKey: "id",
			pIdKey: "pId",
			rootPId: ""
		}
	},
	callback: {
		beforeClick: function(treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("tree");
			if (treeNode.isParent) {
				zTree.expandNode(treeNode);
				return false;
			} else {
				//demoIframe.attr("src",treeNode.file + ".html");
				return true;
			}
		}
	}
}; */

/* var zNodes =[
	{ id:1, pId:0, name:"一级分类", open:true},
	{ id:11, pId:1, name:"二级分类"},
	{ id:111, pId:11, name:"三级分类"},
	{ id:112, pId:11, name:"三级分类"},
	{ id:113, pId:11, name:"三级分类"},
	{ id:114, pId:11, name:"三级分类"},
	{ id:115, pId:11, name:"三级分类"},
	{ id:12, pId:1, name:"二级分类 1-2"},
	{ id:121, pId:12, name:"三级分类 1-2-1"},
	{ id:122, pId:12, name:"三级分类 1-2-2"},
]; */
		
		
		
/* $(document).ready(function(){
	var t = $("#treeDemo");
	t = $.fn.zTree.init(t, setting, zNodes);
	//demoIframe = $("#testIframe");
	//demoIframe.on("load", loadReady);
	var zTree = $.fn.zTree.getZTreeObj("tree");
	//zTree.selectNode(zTree.getNodeByParam("id",'11'));
}); */

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,2,4]}// 制定列不参与排序
	]
});
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-查看*/
function product_show(title,url,id){
	/* var index = layer.open({
		type: 2,
		title: title,
		content: url
	}); */
	//layer.full(index);
	layer_show(title,url,500,500);
	
}
function comment_show(title,url){
	/* var index = layer.open({
		type: 2,
		title: title,
		content: url
	}); */
	//layer.full(index);
	layer_show(title,url,750,500);
	
}

/*产品-审核*/
function product_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="product_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}

/*产品-下架*/
function product_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$.ajax({
			url:"${pageContext.request.contextPath}/manage/product/productStatus?time=" + new Date().getTime(),
			type:'post',
			data:{pid:id},
			dataType:'json',
			success:function(i){
				/* $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_start(this,'+id+""+')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
				$(obj).remove(); */
				layer.msg('已下架!',{icon: 5,time:1000});
				window.location.href="${pageContext.request.contextPath}/manage/product/productList";
			}
		});
	});
}

/*产品-发布*/
function product_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$.ajax({
			url:"${pageContext.request.contextPath}/manage/product/productStatus?time=" + new Date().getTime(),
			type:'post',
			data:{pid:id},
			dataType:'json',
			success:function(i){
			/* $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,'+ id+"" +')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
			$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
			$(obj).remove(); */
			layer.msg('已发布!',{icon: 6,time:1000});
			window.location.href="${pageContext.request.contextPath}/manage/product/productList";
			}
			
		});
		
	});
}

/*产品-申请上线*/
function product_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*产品-编辑*/
function product_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*产品-删除*/
function product_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: "${pageContext.request.contextPath}/manage/product/productDel?time=" + new Date().getTime(),
		    data:{pid:id},
			dataType: 'json',
			success: function(data){
			/* 	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_start(this,'+id+')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已删除</span>');
				$(obj).remove(); */
				layer.msg('已删除!',{icon:1,time:1000});
				window.location.href="${pageContext.request.contextPath}/manage/product/productList";
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
/*产品-还原*/
function product_res(obj,id){
	layer.confirm('确认要还原吗？',function(index){
		$.ajax({
			type: 'POST',
			url: "${pageContext.request.contextPath}/manage/product/productDel?time=" + new Date().getTime(),
		    data:{pid:id},
			dataType: 'json',
			success: function(data){
				layer.msg('已还原!',{icon:1,time:1000});
				window.location.href="${pageContext.request.contextPath}/manage/product/productList?time=" + new Date();
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script>
</body>
</html>