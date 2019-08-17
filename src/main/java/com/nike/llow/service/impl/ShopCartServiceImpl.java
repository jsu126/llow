package com.nike.llow.service.impl;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.junit.Assert.assertNotNull;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nike.llow.dao.IProductManageDao;
import com.nike.llow.dao.IShopCartDao;
import com.nike.llow.domain.Collection;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.domain.Standard;
import com.nike.llow.service.IShopCartService;
import com.nike.llow.util.BigDecimalUtil;
import com.nike.llow.vo.ShopCartVo;

@Service
@Transactional
public class ShopCartServiceImpl implements IShopCartService {
	@Autowired
	private IShopCartDao iShopCartDao;
	@Autowired
	private IProductManageDao iProductManageDao;

	@Override
	public List<ShopCartVo> listShopCarts(String userId) {   
		List<ShopCart> listShopCarts = new ArrayList<ShopCart>();
		List<ShopCartVo> listShopCartVos = new ArrayList<ShopCartVo>();
		List<Standard> listStandards = null;
		ShopCartVo shopCartVo;
		Product product;
		Standard standard;
		BigDecimalUtil bigDecimalUtil=new BigDecimalUtil();
		// 查询该用户购物车的列表信息后封装
		listShopCarts = iShopCartDao.listShopCarts(userId);
		System.out.println(listShopCarts.size()+"---------------------------listShopCarts.size");
		if (listShopCarts != null) {
			for (int i = 0; i < listShopCarts.size(); i++) {
				System.out.println(i+"-----------------------------------------i");
				shopCartVo = new ShopCartVo();
				// 填写当前这一条购物车商品的数量
				shopCartVo.setCount(listShopCarts.get(i).getProductCount());
				System.out.println(listShopCarts.get(i).getProductCount()+"------------------------->数量");
				int count=listShopCarts.get(i).getProductCount();
				// 填写购物车的id
				shopCartVo.setShopCartId(listShopCarts.get(i).getShopCartId());
				System.out.println(listShopCarts.get(i).getShopCartId()+"------------------------->购物车id");
				// 填写用户的id
			    shopCartVo.setUserId(userId);
				// 填写购物车的productId
				shopCartVo.setProductId(listShopCarts.get(i).getProductId());
				System.out.println(listShopCarts.get(i).getProductId()+"------------------------->产品id");
				// 填写规格的名称
				shopCartVo.setStandardName(listShopCarts.get(i).getStandardName());
				System.out.println(listShopCarts.get(i).getStandardName()+"------------------------->规格名字");
				// 查找出productId图片，名字
				product = new Product();
				product = iProductManageDao.getProduct(listShopCarts.get(i).getProductId());
				// 填写商品图片
				shopCartVo.setPicture(product.getMainPicture());
				System.out.println(product.getMainPicture()+"------------------------->产品图片");
				// 填写商品名字
				shopCartVo.setProductName(product.getProductName());
				System.out.println(product.getProductName()+"------------------------->产品名字");
				// 根据productid和standardName 查出规格表的单价
				standard = new Standard();
				standard = iShopCartDao.getStandard(listShopCarts.get(i).getProductId(),
						listShopCarts.get(i).getStandardName());
				System.out.println(standard.getPrice()+"------------------------->产品价格");
				// standard填写到shopCartVo里面
				shopCartVo.setStandard(standard);
				//当前一条商品的总价格 
				BigDecimal b=bigDecimalUtil.mul(count, standard.getPrice().doubleValue());
				shopCartVo.setTotalPrice(b.doubleValue());
				// shopCartVo添加到数组里面
				listShopCartVos.add(shopCartVo);
			}

			return listShopCartVos;
		}

		return null;
	}
	
	@Override
	public ShopCart getShopCart(Integer shopCartId) {
		return iShopCartDao.getShopCart(shopCartId);
	}

	@Override
	public void updateShopCartCount(ShopCart shopCart,Integer count) {
		shopCart.setProductCount(count);
		iShopCartDao.updateShopCartCount(shopCart);
	}

	@Override
	public Double getTotalPrice(Integer shopCartId) {
		ShopCart shopCart=iShopCartDao.getShopCart(shopCartId);
		Integer count=shopCart.getProductCount();
		/*Double  num=iShopCartDao.getShopCartNum()*/
		Standard standard=iShopCartDao.getStandard(shopCart.getProductId(),shopCart.getStandardName());
		BigDecimal b=BigDecimalUtil.mul(count,standard.getPrice().doubleValue());
		return b.doubleValue();
	}

	@Override
	public Double getShopCartCount(String userId) {
		           
		return iShopCartDao.getShopCartCount(userId);
	}

	@Override
	public void deleteShopCart(Integer shopCartId) {
		ShopCart shopCart=iShopCartDao.getShopCart(shopCartId);
		iShopCartDao.deleteShopCart(shopCart);
		
	}

	@Override
	public void moveToCollection(String userId, String productId) {
		Collection collection=new Collection ();
		Collection hasCollocetion=iShopCartDao.hasCollocetion(userId,productId);
	    if(hasCollocetion==null) {   
	    	collection.setUserId(userId);
	  	    collection.setProductId(productId);
	  		iShopCartDao.insertToCollection(collection);
	    }
	}
	

}
