function shopCart(urlsource){
	console.log(urlsource);
	$.ajax({
		type:"post",
		url:urlsource,
		dateType:"json",
		success:function(data){
			console.log(data.shopCartCount);
			$("#J_MiniCartNum").html(data.shopCartCount);
		}
	})
}


