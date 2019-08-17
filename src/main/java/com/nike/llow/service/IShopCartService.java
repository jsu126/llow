package com.nike.llow.service;

import java.util.List;

import org.apache.logging.log4j.core.appender.rolling.SizeBasedTriggeringPolicy;

import com.nike.llow.domain.ShopCart;
import com.nike.llow.vo.ShopCartVo;

/**
 * @author ldg
 * @date 2019年8月9日
 * @version
 */
public interface IShopCartService {

	/**
	 * 购物车列表
	 * @param userId
	 * @return
	 */
	
	List<ShopCartVo> listShopCarts(String userId);
	
	/**
	 * 找到当这条购物车商品的信息
	 * @param shopCartId
	 * @return
	 */
	ShopCart getShopCart(Integer shopCartId);

	/**
	  * 异步更新购物车的数量
	 * @param shopCart
	 */
	void updateShopCartCount(ShopCart shopCart,Integer count);
	
	
	/**
	 * 得到异步更新的总价格
	 * @return
	 */
	Double getTotalPrice(Integer shopCartId);
	
	/**
	 * 获取当前用户的购物车的数量
	 * @param userId
	 * @return
	 */
	Double getShopCartCount(String userId);

	/**
	 *删除购物车的商品
	 * @param shopCartId
	 */
	void deleteShopCart(Integer shopCartId);

	/**
	 * 添加到收藏夹
	 * @param userId
	 * @param productId
	 */
	void moveToCollection(String userId, String productId);
	
		
	


}
