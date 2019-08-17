<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/HUI/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/skin/default/skin.css"
	id="skin" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/layui/css/layui.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link
	href="${pageContext.request.contextPath}/admin/lib/webuploader/0.1.5/webuploader.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="page-container">
		<form action="" method="post" class="form form-horizontal" id="form-article-add">
			<input type="hidden" value="${productAndStandardVo.productId}" name="productId">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>产品标题：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${productAndStandardVo.productName}" placeholder="" id=""
						name="productName">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2"><span
					class="c-red">*</span>商品分类：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box">
					<select name="categoryId" class="select" id="category_list">
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">推荐状态：</label>
				<div class="formControls col-xs-8 col-sm-9 ">
					<input type="checkbox" value="1" name="loverStatus" id="lover">恋人
					<input type="checkbox" value="1" name="friendStatus" id="friend">朋友
					<input type="checkbox" value="1" name="kinsfolkStatus" id="kinsfolk">亲人
					<input type="checkbox" value="1" name="holidayStatus" id="holiday">节日
				</div>
			</div>
			<div class="row cl" id="stand">
				<label class="form-label col-xs-4 col-sm-2">产品规格：</label>
				<c:forEach items="${productAndStandardVo.standardList}" var="standard" varStatus="index" step="1">
					<c:if test="${index.index==0}">
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" name="standardNames" id="" placeholder="名称" value="${standard.standardName}" class="input-text" style="width: 20%">
							<input type="text" name="stocks" id="" placeholder="库存" value="${standard.stock}" class="input-text" style="width: 20%">
							<input type="text" name="prices" id="" placeholder="单价" value="${standard.price}" class="input-text" style="width: 20%">
							<input type="button" id="add_btn" onClick="add()" class="btn" value="添加"/>
						</div>
					</c:if>
					<c:if test="${index.index!=0}">
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" name="" id="" placeholder="" value="" class="input-text" style="width: 22.6%;border: none">
							<input type="text" name="standardNames" id="" placeholder="名称" value="${standard.standardName}" class="input-text" style="width: 20%">
							<input type="text" name="stocks" id="" placeholder="库存" value="${standard.stock}" class="input-text" style="width: 20%">
							<input type="text" name="prices" id="" placeholder="单价" value="${standard.price}" class="input-text" style="width: 20%">
							<input type="button" class="btn btn_del" value="删除"/>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="row cl">
				<input type="hidden" name="smallPicture" id="smallPicture" value="${productAndStandardVo.smallPicture}">
				<label class="form-label col-xs-4 col-sm-2">图片上传：</label>
				<div class="layui-upload col-xs-9">
					<button type="button" class="layui-btn" id="test2">多图片上传</button> 
  					<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
    					预览图：
    					<div class="layui-upload-list" id="demo2">
    						<c:forEach items="${productAndStandardVo.smallPictureList}" var="smallPicture">
    							<img src="${smallPicture}" class="layui-upload-img">
    						</c:forEach>
    					</div>
 					</blockquote>
 				</div>
			</div>
			<div class="row cl">
				<input type="hidden" name="details" id="details" value="${productAndStandardVo.details}">
				<label class="form-label col-xs-4 col-sm-2">详细内容：</label>
				<div class="layui-upload col-xs-9">
					<button type="button" class="layui-btn" id="test3">多图片上传</button> 
  					<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
    					预览图：
    					<div class="layui-upload-list" id="demo3">
    						<c:forEach items="${productAndStandardVo.detailsList}" var="details">
    							<img src="${details}" class="layui-upload-img">
    						</c:forEach>
    					</div>
 					</blockquote>
 				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
					<button	class="btn btn-primary radius" type="button" onClick="updateProduct()">
						<i class="Hui-iconfont">&#xe632;</i> 保存并提交审核
					</button>
					<button onClick="layer_close();" class="btn btn-default radius"
						type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
	</div>

	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/HUI/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->

	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/lib/webuploader/0.1.5/webuploader.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript">
	function updateProduct() {
		var data = $("form").serialize();
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/manage/product/updateProduct",
			data:data,
			dataType:"json",
			success:function(result){
				layer.msg("更新成功",{time:1000});
				layer_close();
				window.location.href="${pageContext.request.contextPath}/manage/product/productList?time=" + new Date();
			}
		})
	}
	$(function () {
		var friendStatus = ${productAndStandardVo.friendStatus};
		var loverStatus = ${productAndStandardVo.loverStatus};
		var holidayStatus = ${productAndStandardVo.holidayStatus};
		var kinsfolkStatus = ${productAndStandardVo.kinsfolkStatus};
		if(friendStatus==1){
			 $("#friend").prop("checked", "checked");
		}
		if(loverStatus==1){
			 $("#lover").prop("checked", "checked");
		}
		if(holidayStatus==1){
			 $("#holiday").prop("checked", "checked");
		}
		if(kinsfolkStatus==1){
			 $("#kinsfolk").prop("checked", "checked");
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/category/categoryList?time=" + new Date(),
			dataType:"json",
			success:function(result){
				console.log(result);
				$.each(result, function (index, item){
					var option = $("<option></option>").append(item.categoryName).val(item.categoryId);
					var id = ${productAndStandardVo.categoryId};
					$(".select").val(id);
					$("#category_list").append(option);
				})
			}
		})
    });
	
	function add(){
		var temp = "<div class='formControls col-xs-8 col-sm-9'>&nbsp;<input type='text' name='' id='' placeholder='' value='' class='input-text' style='width: 22.6%;border: none'><input type='text' name='standardNames' id='' placeholder='名称' value='' class='input-text' style='width: 20%'> <input type='text' name='stocks' id='' placeholder='库存' value='' class='input-text' style='width: 20%'> <input type='text' name='prices' id='' placeholder='单价' value='' class='input-text' style='width: 20%'> <input type='button' class='btn btn_del' value='删除'/></div>"
		$("#stand").append(temp);
	}
	$("#stand").on("click", ".btn_del", function () {
        $(this).parent().remove();
        $(this).parent().prev().remove();
    });
	
	//多图片上传
	layui.use('upload', function(){
  		var $ = layui.jquery, upload = layui.upload;
	  	upload.render({
	    	elem: '#test2'
	    	,url: '${pageContext.request.contextPath}/manage/product/uploadProductImage'
	    	,field: 'upload'
	    	,multiple: true
	    	,before: function(obj){
	      	//预读本地文件示例，不支持ie8
	      	obj.preview(function(index, file, result){
	        	$('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
	      });
	    }
	    ,done: function(res){
	      //上传完毕
	      var smallPicture = $('#smallPicture').val();
	      smallPicture = smallPicture + res + ",";
	      $('#smallPicture').val(smallPicture);
	    }
	  });
	  	upload.render({
	    	elem: '#test3'
	    	,url: '${pageContext.request.contextPath}/manage/product/uploadProductImage'
	    	,field: 'upload'
	    	,multiple: true
	    	,before: function(obj){
	      	//预读本地文件示例，不支持ie8
	      	obj.preview(function(index, file, result){
	        	$('#demo3').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
	      });
	    }
	    ,done: function(res){
	      //上传完毕
	    	 var details = $('#details').val();
	    	 details = details + res + ",";
		      $('#details').val(details);
	    }
	  });
	});
	</script>
</body>
</html>