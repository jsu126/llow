<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html style="height:100%;">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/skin/default/skin.css" id="skin" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/HUI/h-ui.admin/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
	<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
</head>
	<body style="height:100%;">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span class="c-gray en">&gt;</span> 用户区域发布图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div id="main" style="width:100%;height:100%;"></div>
    <script>
	var mydata=[
		{name: '北京',value: 0},{name: '天津',value:0},
		{name: '上海',value: 0},{name: '重庆',value:0},
		{name: '河北',value: 0 },{name: '河南',value: 0},
		{name: '云南',value: 0 },{name: '辽宁',value: 0},
		{name: '黑龙江',value: 0},{name: '湖南',value: 0},
		{name: '安徽',value: 0},{name: '山东',value: 0},
		{name: '新疆',value: 0},{name: '江苏',value: 0},
		{name: '浙江',value: 0},{name: '江西',value: 0},
		{name: '湖北',value: 0},{name: '广西',value: 0},
		{name: '甘肃',value: 0},{name: '山西',value: 0},
		{name: '内蒙古',value: 0},{name: '陕西',value: 0},
		{name: '吉林',value: 0},{name: '福建',value: 0},
		{name: '贵州',value: 0},{name: '广东',value: 0 },
		{name: '青海',value: 0},{name: '西藏',value: 0},
		{name: '四川',value: 0},{name: '宁夏',value: 0},
		{name: '海南',value: 0},{name: '台湾',value: 0},
		{name: '香港',value: 0},{name: '澳门',value: 0}
	];
	$(function () {
		$.ajax({
			url:"${pageContext.request.contextPath}/manage/user/userRegionCount",
			dataType:"json",
			success:function(data){
				for(var i = 0; i < 34; i++){
					mydata[i].value = data[i];
					init();
				} 
				
			}
		})
	});
	function init(){
		var option = {
				backgroundColor: '#FFFFFF',
				title: {
					text: '用户区域分布图',
					x:'center'
				},
				tooltip : {
					trigger: 'item'
				},
				visualMap: {
					show : false,
					x: 'left',
					y: 'bottom',
					splitList: [ 
						{start: 30, end:2000},{start: 20, end: 30},
						{start: 15, end: 20},{start: 10, end: 15},
						{start: 5, end: 10},{start: 0, end: 5},
					],
					color: ['#139900','#16CC33', '#10CC00', '#13CC00','#16FF33','#10FF00']
				},
				series: [{
					name: '用户统计数',
					type: 'map',
					mapType: 'china', 
					roam: true,
					label: {
						normal: {
							show: true
						},
						emphasis: {
							show: false
						}
					},
					data:mydata
				}]
			};
			var chart = echarts.init(document.getElementById('main'));
		    chart.setOption(option);
	}
    </script>
</body>
</html>