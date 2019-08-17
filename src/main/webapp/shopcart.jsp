<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>购物车页面</title>

<link
	href="${pageContext.request.contextPath}/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/basic/css/demo.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/cartstyle.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/optstyle.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/layer/layer.js"></script>

<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/images/favicon.ico">

<style type="text/css">
	.menu-hd a:hover {
		color:red;
	}
</style>
</head>

<body>

	<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="menu-hd">
				<c:if test="${user==null}">
					<a href="${pageContext.request.contextPath}/login.jsp"
						target="_top" class="h">亲，请登录</a>
					<a href="${pageContext.request.contextPath}/register.jsp"
						target="_top">免费注册</a>
				</c:if>
				<c:if test="${user!=null}">
					<a href="${pageContext.request.contextPath}/information.jsp"
						target="_top" class="h">${user.username}</a>
					<a href="${pageContext.request.contextPath}/user/exit"
						target="_top">退出</a>
				</c:if>

			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="${pageContext.request.contextPath}" target="_top"
						class="h">商城首页</a>
				</div>
			</div>
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="${pageContext.request.contextPath}/information.jsp"
						target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">
					<a href="${pageContext.request.contextPath}/user/collection"
						target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
				</div>
		</ul>
	</div>

	<!--悬浮搜索框-->

	<div class="nav white">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/images/logo.png" />
		</div>
		<div class="logoBig">
			<li><img
				src="${pageContext.request.contextPath}/images/logobig.png" /></li>
		</div>
	</div>

	<div class="clear"></div>

	<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">数量</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">金额</div>
					</div>
					<div class="th th-op">
						<div class="td-inner">操作</div>

					</div>
				</div>
			</div>
			<div class="clear"></div>

			<tr class="item-list">
				<div class="bundle  bundle-last ">
					<div class="bundle-hd"></div>
					<div class="clear"></div>
					<div class="bundle-main">
						<c:forEach items="${shopCartVoList}" var="list">
							<ul class="item-content clearfix">
								<li class="td td-chk"><c:choose>
										<c:when
											test="${list.standard.stock>=1 && list.count<=list.standard.stock}">
											<div class="cart-checkbox ">
												<input id="selectOne_${list.shopCartId}" name="myCheckbox"
													type="checkbox" onclick="selectOne(${list.shopCartId})">
												<label for="J_CheckBox_170037950254"></label>
											</div>
										</c:when>
										<c:otherwise>
											<div class="cart-checkbox ">
												<input id="selectOne_${list.shopCartId}" name="myCheckbox"
													type="checkbox" disabled="disabled"
													onclick="selectOne(${list.shopCartId})"> <label
													for="J_CheckBox_170037950254"></label>
											</div>
										</c:otherwise>
									</c:choose></li>
								<li class="td td-item">
									<div class="item-pic">
										<a href="#" target="_blank"
											data-title="美康粉黛醉美东方唇膏口红正品 持久保湿滋润防水不掉色护唇彩妆"
											class="J_MakePoint" data-point="tbcart.8.12"> <img
											src="${list.picture}" class="itempic J_ItemImg" width="100%"></a>
									</div>
									<div class="item-info">
										<div class="item-basic-info">
											<a
												href="${pageContext.request.contextPath}/product/productInfo?pid=${list.productId}"
												target="_blank" title="美康粉黛醉美唇膏 持久保湿滋润防水不掉色"
												class="item-title J_MakePoint" data-point="tbcart.8.11">${list.productName}</a>
										</div>
									</div>
								</li>
								<li class="td td-info">
									<div class="item-props item-props-can">
										<span class="sku-line">规格:${list.standardName}</span> <span
											class="sku-line">包邮</span> <span tabindex="0"
											class="btn-edit-sku theme-login">修改</span> <i
											class="theme-login am-icon-sort-desc"></i>
									</div>
								</li>
								<li class="td td-price">
									<div class="item-price price-promo-promo">
										<div class="price-content">
											<div class="price-line">
												<em class="price-original">78.00</em>
											</div>
											<div class="price-line">
												<em class="J_Price price-now" tabindex="0">${list.standard.price}</em>
											</div>
										</div>
									</div>
								</li>
								<li class="td td-amount">
									<div class="amount-wrapper ">
										<div class="item-amount ">
											<div class="sl">

												<c:if test="${list.standard.stock==list.count}">
													<input class=" am-btn" name=""
														id="deleteOne_${list.shopCartId}"
														onclick="deleteOne(${list.shopCartId},${list.standard.stock},${list.standard.price})"
														type="button" value="-" />
													<input class="text_box" readonly="readonly"
														id="count_${list.shopCartId}" type="text"
														value="${list.count}" style="width: 30px;" />
													<input class=" am-btn" disabled="disabled" name=""
														id="addOne_${list.shopCartId}"
														onclick="addOne(${list.shopCartId},${list.standard.stock},${list.standard.price})"
														type="button" value="+" />
												</c:if>


												<c:if test="${list.count==1}">
													<input class=" am-btn" disabled="disabled" name=""
														id="deleteOne_${list.shopCartId}"
														onclick="deleteOne(${list.shopCartId},${list.standard.stock},${list.standard.price})"
														type="button" value="-" />
													<input class="text_box" readonly="readonly"
														id="count_${list.shopCartId}" type="text"
														value="${list.count}" style="width: 30px;" />
													<input class=" am-btn" name=""
														id="addOne_${list.shopCartId}"
														onclick="addOne(${list.shopCartId},${list.standard.stock},${list.standard.price})"
														type="button" value="+" />
												</c:if>

												<c:if
													test="${(list.standard.stock!=list.count)&&list.count!=1}">
													<input class=" am-btn" name=""
														id="deleteOne_${list.shopCartId}"
														onclick="deleteOne(${list.shopCartId},${list.standard.stock},${list.standard.price})"
														type="button" value="-" />
													<input class="text_box" readonly="readonly"
														id="count_${list.shopCartId}" type="text"
														value="${list.count}" style="width: 30px;" />
													<input class=" am-btn" name=""
														id="addOne_${list.shopCartId}"
														onclick="addOne(${list.shopCartId},${list.standard.stock},${list.standard.price})"
														type="button" value="+" />
												</c:if>


											</div>
										</div>
									</div>
								</li>
								<li class="td td-sum">
									<div class="td-inner">
										<input tabindex="0" readonly="readonly" type="text"
											id="totalPrice_${list.shopCartId}" name="totalPrice"
											value="${list.totalPrice}" class="J_ItemSum number"
											style="border: none; text-align: center; width: 70%" />
										<%-- <span>库存<input tabindex="0" readonly="readonly"  type="text" id="stock_${list.shopCartId}"     name="totalPrice" value="${list.standard.stock}" class="J_ItemSum number"/></span> --%>
									</div>
								</li>
								<li class="td td-op">
									<div class="td-inner">
										<c:choose>

											<c:when test="${list.standard.stock>=1}">
												<a title="移入收藏夹" class="btn-fav"
													href="${pageContext.request.contextPath}/shopCart/moveToCollection?userId=${list.userId}&productId=${list.productId}&shopCartId=${list.shopCartId}">移入收藏夹</a>
												<a href="javascript:;" data-point-url="#"
													onclick="deleteShopCart(${list.shopCartId})" class="delete">删除</a>
											</c:when>
											<c:otherwise>
												<a title="商品下架" class="btn-fav"">已经下架</a>
												<a href="javascript:;" data-point-url="#"
													onclick="deleteShopCart(${list.shopCartId})" class="delete">删除</a>
											</c:otherwise>
										</c:choose>
									</div>
								</li>
							</ul>

						</c:forEach>
					</div>
				</div>
			</tr>
			<div class="clear"></div>

			<div class="float-bar-wrapper">
				<div id="J_SelectAll2" class="select-all J_SelectAll">
					<div class="cart-checkbox"></div>
				</div>
				<div class="float-bar-right">
					<div class="amount-sum">
						<span class="txt">已选商品</span> <em id="J_SelectedItemsCount"></em><span
							id="totalCount" class="txt">件</span>
						<div class="arrow-box">
							<span class="selected-items-arrow"></span> <span class="arrow"></span>
						</div>
					</div>
					<div class="price-sum">
						<span class="txt">合计:</span> <strong class="price">¥<em
							id="allTotalPrice">0.00</em></strong>
					</div>
					<div class="btn-area">
						<a onclick="caculate()" id="J_Go"
							class="submit-btn submit-btn-disabled"
							aria-label="请注意如果没有选择宝贝，将无法结算" style="text-align: right;">结&nbsp;算</a>
					</div>
				</div>
			</div>
			<div class="footer ">
				<div class="footer-hd ">
					<p>
						<a href="# ">礼来我网</a> <b>|</b> <a
							href="${pageContext.request.contextPath}" target="_top" class="h">首页</a>
						<b>|</b> <a href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
					</p>
				</div>
				<div class="footer-bd ">
					<p>
						<a href="# ">关于我们</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a>
						<a href="# ">网站地图</a> <em>Copyright ©2019-Present llow.com
							版权所有</em>
					</p>
				</div>
			</div>

		</div>

		<!--操作页面-->

		<div class="theme-popover-mask"></div>

		<div class="theme-popover">
			<div class="theme-span"></div>
			<div class="theme-poptit h-title">
				<a href="javascript:;" title="关闭" class="close">×</a>
			</div>
			<div class="theme-popbod dform">
				<form class="theme-signin" name="loginform" action="" method="post">

					<div class="theme-signin-left">

						<li class="theme-options">
							<div class="cart-title">颜色：</div>
							<ul>
								<li class="sku-line selected">12#川南玛瑙<i></i></li>
								<li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
							</ul>
						</li>
						<li class="theme-options">
							<div class="cart-title">包装：</div>
							<ul>
								<li class="sku-line selected">包装：裸装<i></i></li>
								<li class="sku-line">两支手袋装（送彩带）<i></i></li>
							</ul>
						</li>
						<div class="theme-options">
							<div class="cart-title number">数量</div>
							<dd>
								<input class="min am-btn am-btn-default" name="" type="button"
									value="-" /> <input class="text_box" name="" type="text"
									value="1" style="width: 30px;" /> <input
									class="add am-btn am-btn-default" name="" type="button"
									value="+" /> <span class="tb-hidden">库存<span
									class="stock">1000</span>件
								</span>
							</dd>

						</div>
						<div class="clear"></div>
						<div class="btn-op">
							<div class="btn am-btn am-btn-warning">确认</div>
							<div class="btn close am-btn am-btn-warning">取消</div>
						</div>

					</div>
					<div class="theme-signin-right">
						<div class="img-info">
							<img src="images/kouhong.jpg_80x80.jpg" />
						</div>
						<div class="text-info">
							<span class="J_Price price-now">¥39.00</span> <span id="Stock"
								class="tb-hidden">库存<span class="stock">1000</span>件
							</span>
						</div>
					</div>

				</form>
			</div>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li class="active"><a href="shopcart.html"><i
					class="am-icon-shopping-basket"></i>购物车</a></li>
			<li><a href="person/index.html"><i class="am-icon-user"></i>我的</a></li>
		</div>
		<script type="text/javascript">
  	 

		      function deleteOne(shopCartId,stock,price){
            		 
		    	  var checkId="#selectOne_"+shopCartId;
		    	  var prices=parseFloat(price);
		    	  console.log("prices"+prices);
		    	  var id="#count_" + shopCartId;
		    	  var deleteId="#deleteOne_"+shopCartId;
		    	  var addId="#addOne_"+shopCartId;
		    	  var totalPrice="#totalPrice_"+shopCartId;
		    	
		    	  console.log(id);
		    	  var currentCount=parseInt($(id).val());
		    	  console.log(currentCount);
		    	  //判顿当前的数量是否等于库存，如果等于就把加号的按钮解锁，后面减号减一后当前数量就少一了
		    	  if(currentCount<=stock){
		    		  $(addId).prop('disabled',false);
		    	  }
		    	  if(currentCount==1){
		    		  $(deleteId).prop('disabled',true);
		    	  }else{ 
		    		  var newCurrentCount=currentCount-1;
			    	  $(id).val(newCurrentCount);
			    	  console.log("newCurrent"+newCurrentCount);
			    	  if(newCurrentCount==stock){
			    		$(checkId).prop('disabled',false);
			    	  }
			    	  if(newCurrentCount<2){
			    		  console.log(deleteId);
			    		  $(deleteId).prop('disabled',true);
			    		  //当前数量是一的时候不去后台处理，直接给单价
			    		  $(totalPrice).val(price);
			    		  layer.msg("数量不能小于1");
			    	  }if(newCurrentCount<=stock && newCurrentCount>=1){
			    		  
			    		    $(function(){
			    		    	
			    		    	  $.ajax({
			    		    		    url:"${pageContext.request.contextPath}/shopCart/updateShopCartCount?time="+new Date().getTime(),
				    				    type:"post",
				    				    data:{
				    				   	   
				    				    	 shopCartId:shopCartId,
				    				    	 count:newCurrentCount 
				    				   },
				    				    dataType:"json",
				    				    success:function(data){
				    				    	 if(data!=null){
				    				    		 console.log(data);
				    				    		 $(totalPrice).val(data); 
				    				    		
				    				    	 }   
				    				    }    
			    		    	  })
			    		    })
			    	  }
		    		  
		    	  }
		    	  
		      }
		      
		      
		      function addOne(shopCartId,stock,price){
		    	  console.log(shopCartId);
		   
		    	  var id = "#count_" + shopCartId;
		    	  var addId="#addOne_"+shopCartId;
		    	  var deleteId="#deleteOne_"+shopCartId;
		    	  var totalPrice="#totalPrice_"+shopCartId;
		    	  console.log(id);
		    	  var currentCount=parseInt($(id).val());
		    	  //判断当前的数量是否是1,如果是触发给减号解锁，然后加号变成2 
		    	  if(currentCount>=1){
		    		  $(deleteId).prop('disabled',false);
		    	  }
		    	  var newCurrentCount=currentCount+1;
		    	  $(id).val(newCurrentCount);
		    	  console.log(stock);
		     	  console.log("newCurrent"+newCurrentCount);
		    	  if(newCurrentCount>=stock){
		    		  $(totalPrice).val(parseFloat(stock*price));
		    		  console.log(addId);
		    		  $(addId).prop('disabled',true);   
		    		  layer.msg("最大库存");	   
		    	  }if(newCurrentCount<=stock && newCurrentCount>=1){
		    		  $(function(){                               
		    			    console.log(newCurrentCount+"------------->")        
		    			  $.ajax({  
		    				
		    				    url:"${pageContext.request.contextPath}/shopCart/updateShopCartCount?time="+new Date().getTime(),
		    				    type:"post",
		    				    data:{
		    				   	
		    				    	 shopCartId:shopCartId,       
		    				    	 count:(newCurrentCount<stock)?newCurrentCount:parseInt(stock)
		    				   },
		    				    dataType:"json", 
		    				    success:function(data){            
		    				    	 if(data!=null){    
		    				    		$(totalPrice).val(data);            
		    				    		console.log(data);
		    				    	 }
		    				    }      
		    			  })
		    		  })
		    		      
		    	  } 	  
		      }
		                        
		      
		       var totalCount=0;
          	   var allTotalPrice=0;
          	   var shopCartIds=[];
		      //单选框
              function selectOne(shopCartId){
		    	  
            	   var countId="#count_" + shopCartId;
              	   var count=parseInt($(countId).val());
              	   console.log(count+"count");
          		   
              	   var totalPriceId="#totalPrice_"+shopCartId;
          		   var totalPrice=parseFloat($(totalPriceId).val());
          		   console.log(totalPrice+"totalPrice");

          		
          		     
                    var id="#selectOne_"+shopCartId;
        	        price(id,count,totalPrice,shopCartId);   
                 
              }
           	 
              function price(id,count,totalPrice,shopCartId){
               console.log(shopCartId+"------>shpeId");
               var addId="#addOne_"+shopCartId;
		       var deleteId="#deleteOne_"+shopCartId;
           	   var myThis=$(id).prop("checked");
           	   console.log(myThis+"--------myThis.checked");
           	   if(myThis==true){
           		  
           		    $(addId).prop('disabled',true);
           		    $(deleteId).prop('disabled',true);   
           		    totalCount+=count;
           		    allTotalPrice+=totalPrice;
           		    shopCartIds.push(shopCartId); 
           		    console.log(shopCartIds.length);  
           		    $("#totalCount").html(totalCount);
           		    $("#allTotalPrice").html(allTotalPrice);
           	   }else{  
           		     if(count==1){
           		    	$(addId).prop('disabled',false);
            		    $(deleteId).prop('disabled',true);   
           		     }else{
           		    	 $(addId).prop('disabled',false);
             		     $(deleteId).prop('disabled',false);   
           		     }
           		     totalCount-=count;
          		     allTotalPrice-=totalPrice;  
          		     shopCartIds.splice(shopCartIds.findIndex(_=>_.val==shopCartId),1);  
          		     $("#totalCount").html(totalCount);
          		     $("#allTotalPrice").html(allTotalPrice);             
           	   }       	      
           	         
              }       
                 
                    
              function deleteShopCart(id){
            	  console.log(id);
   
                if(window.confirm("确认删除吗")){
                	 window.location.href="${pageContext.request.contextPath}/shopCart/deleteShopCart?shopCartId="+id;
                }
                 
              }     
                     
              function caculate(){
            	  
            	   if(shopCartIds.length<=0){
            		   layer.msg("请选择一个东西");   
            	   }else{
            		   if(window.confirm("确定结算吗")){ 
            			   $.ajax({
            				   
            				   	url:"${pageContext.request.contextPath}/user/checkCertification?time=" + new Date(),
            					dataType:"json",
            				   	success:function(data){
            						if(data == "ok"){
            							console.log(shopCartIds);
            							window.location.href="${pageContext.request.contextPath}/shopCart/caculateShopCart?shopCartIds="+shopCartIds;
            						}else{
            							layer.msg("未实名认证，不能购买东西！");
            						}
            					} 
            			   });
            				
            		   }  
            	   }   
            	  
              }
</script>
</body>

</html>