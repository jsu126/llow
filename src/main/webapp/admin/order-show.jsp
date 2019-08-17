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
<title>商品查看</title>
</head>
<body>
<div class="cl pd-20" style=" background-color:#5bacb6">
        	<%-- <img class="avatar size-XL l" src="${productVo.mainPicture}"> --%>
	<dl style="color:#fff">
		<!-- <dt>
			<span class="f-18">收货地址</span>
		</dt> -->
		<dd class="pt-10 f-12" style="margin-left:0">收货人：${orderInfoVo.address.consingee}</dd>
		<dd class="pt-10 f-12" style="margin-left:0">手机号：${orderInfoVo.address.phone}</dd>
		<dd class="pt-10 f-12" style="margin-left:0">收货地址：${orderInfoVo.address.provide}&nbsp;${orderInfoVo.address.city}&nbsp;${orderInfoVo.address.region}&nbsp;${orderInfoVo.address.detailAddress}</dd>
	</dl>
</div>
<div class="pd-20">
	<table class="table table-border table-bordered table-bg table-hover table-sort">
				<thead>
					<tr class="text-c">
						<th class="text-r" width="20"><center>编号</center></th>
						<th class="text-r" width="60"><center>缩略图</center></th>
						<th class="text-r"><center>商品名</center></th>
						<th class="text-r"><center>规格</center></th>
						<th class="text-r" width="40"><center>单价</center></th>
						<th class="text-r" width="40"><center>数量</center></th>
					</tr>
				</thead>
		<tbody>
		  <c:forEach items="${orderInfoVo.orderDetailList}" var="orderDetail" varStatus="i" step="1">
		  <tr class="text-c va-m">
		  	<td>${i.index+1}</td>
		  	<td><img width="60" class="product-thumb" src="${orderDetail.productPicture}"></td>
		  	<td>${orderDetail.productName}</td>
		  	<td>${orderDetail.standardName}</td>
		  	<td>${orderDetail.productPrice}</td>
		  	<td>${orderDetail.productCount}</td>
		  </tr>
		  </c:forEach>
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/HUI/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/js/H-ui.admin.js"></script> 
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
</body>
</html>