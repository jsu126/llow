package com.nike.llow.dao;

import java.util.List;

import com.nike.llow.domain.Collection;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.domain.Standard;

/**
 * @author ldg
 * @date 2019年8月9日
 * @version 1.0
 */
public interface IShopCartDao {

	/**
	 * 获取当前用户的购物
	 * @param userId
	 * @return
	 */
	List<ShopCart> listShopCarts(String userId);

	/**
	 * 根据productid和standardName 查出规格表的单价
	 * @param productId
	 * @param standardName
	 * @return
	 */
	 Standard getStandard(String productId, String standardName);

	 /**
	  * 找到当前购物车具体一条商品的信息
	 * @param shopCartId
	 * @return
	 */
	ShopCart getShopCart(Integer shopCartId);
	 
	/**
	 * 异步更新购物车的数量
	 * @param shopCart
	 */
	void updateShopCartCount(ShopCart shopCart);

	/**
	 * 获取当前用购物车的数量
	 * @param userId
	 * @return
	 */
	 Double getShopCartCount(String userId);

	/**
	 * 删除购物车的商品
	 * @param shopCart
	 */
	void deleteShopCart(ShopCart shopCart);

	/**
	 * 添加到收藏夹
	 * @param collection
	 */
	void insertToCollection(Collection collection);

	/**
	 * 如果收藏夹有了该商品，就不重复添加
	 * @param userId
	 * @param productId
	 * @return
	 */
	Collection hasCollocetion(String userId, String productId);

	
		
	

}
