<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!DOCTYPE HTML>
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
<title>3D柱状图</title>
</head>
<body>
<div class="page-container">
	年份：<select id="year" class="select" style="width: 10%" onchange="change()">
	</select>
	<div id="container" style="min-width:700px;height:400px"></div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/HUI/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
<script type="text/javascript">
function sales(year) {	
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/manage/product/salesCount",
		data:{year:year},
		success:function(data){
			console.log(data);
			title= year + "年商品销售报表";
			// Set up the chart
		    var chart = new Highcharts.Chart({
		        chart: {
		            renderTo: 'container',
		            type: 'column',
		            margin: 75,
		            options3d: {
		                enabled: true,
		                alpha: 0,
		                beta: 0,
		                depth: 50,
		                viewDistance: 25
		            }
		        },
		        title: {
		            text: title
		        },
		        plotOptions: {
		            column: {
		            	colorByPoint:true,
		                depth: 25
		            }
		        },
		        xAxis: {
		    		categories: ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月']
		    	},
		        series: [{
		        	name:'销售',
		            data: data
		        }]
		    });
		    

		    // Activate the sliders
		    $('#R0').on('change', function(){
		        chart.options.chart.options3d.alpha = this.value;
		        showValues();
		        chart.redraw(false);
		    });
		    $('#R1').on('change', function(){
		        chart.options.chart.options3d.beta = this.value;
		        showValues();
		        chart.redraw(false);
		    });

		    function showValues() {
		        $('#R0-value').html(chart.options.chart.options3d.alpha);
		        $('#R1-value').html(chart.options.chart.options3d.beta);
		    }
		    showValues();
		}
	})
	
}

function years(){
	$.ajax({
		type:'post',
		url:"${pageContext.request.contextPath}/manage/product/salesYeas",
		dataType:"json",
		success:function(data){
			$.each(data,function(index,item){
				var option = $("<option>"+parseInt(item)+"</option>").val(parseInt(item));
				$("#year").append(option);
			});
		}
	})
}


/* $('option').click(function() {
	console.log($("#year").val());
}) */
function change() {
	var year = $("#year").val();
	sales(year);
}

$(function () {
	years();
	var year=new Date().getFullYear();
	sales(year);
});
</script>
</body>
</html>