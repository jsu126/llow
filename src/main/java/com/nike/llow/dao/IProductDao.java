package com.nike.llow.dao;

import java.util.List;

import com.nike.llow.domain.Category;
import com.nike.llow.domain.Comment;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Sales;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;

/**
 * @author zero
 * @date 2019年8月9日
 * @version
 */
public interface IProductDao {

	/**
	 * 根据商品名称分页查询商品列表
	 * @param keyWord
	 * @param currentPage
	 * @param count
	 * @return
	 */
	List<Product> productSearchList(String keyWord,int currentPage, int count);
	
	/**
	 * 查询所有的商品列表
	 * @param currentPage
	 * @param count
	 * @return
	 */
	List<Product> productList(int currentPage, int count);
	/**
	 * 根据分类查找商品列表
	 * @param status
	 * @param currentPage
	 * @param count
	 * @return
	 */
	List<Product>productGenreList(String status,int currentPage, int count);
	/**
	 * 根据类目id查找商品列表
	 * @param categoryId
	 * @param currentPage
	 * @param count
	 * @return
	 */
	List<Product>productSortList(int categoryId, int currentPage, int count);
	/**
	 * 查询所有商品的数量
	 * @return
	 */
	long productListCount();
	
	/**查询分页列表的数量
	 * @param keyWord
	 * @return
	 */
	long productSearchListCount(String keyWord);
	
	/**
	 * 查询分类分页列表的数量
	 * @param status
	 * @return
	 */
	long productGenreListCount(String status);
	
	/**
	 * 查找类目id分页列表的数量
	 * @param categoryId
	 * @return
	 */
	long productSortListCount(int categoryId);
	
	/**
	 * 查询商品的价格范围
	 * @param productId
	 * @return
	 */
	List<Object[]> getPriceScope(String productId);  
	
	/**查询商品的销售信息
	 * @param productId
	 * @return
	 */
	List<Sales> findSale(String productId);
	
	/**
	 * 查询商品的评论详情
	 * @param productId
	 * @return
	 */
	List<Comment> findCommentList  (String productId);
	
	/**
	 * 查询商品的库存，价格信息
	 * @param productId
	 * @return
	 */
	List<Standard> findStandardList(String productId);
	/**
	 * 根据productId查询商品的信息
	 * @param pid
	 * @return
	 */
	Product getProduct(String productId);
	
	/**
	 * 根据productId查询商品的分类
	 * @param categoryId
	 * @return
	 */
	Category getCategory(Integer categoryId);
	
	/**
	 * 更加userId查询用户
	 * @param userId
	 * @return
	 */
	User getUser(String userId);

	Standard getStandard(String productId, String standardName);

	/**
	 * 更新
	 * @param standard
	 */
	void updateStandard(Standard standard);
	
	/**添加到购物车
	 * @param shopCart
	 */
	void addShopcart(ShopCart shopCart);
	
	/**
	 * 判断购物车是否存在该条订单
	 * @param userId
	 * @param productId
	 * @param standardName
	 * @return
	 */
	ShopCart shopCartIsIn(String userId,String productId,String standardName);
	
	/**更新购物车
	 * @param shopCart
	 */
	void updateShopCart(ShopCart shopCart);

	Sales getSales();

	/**
	 * 销售
	 * @param productId
	 * @param year
	 * @param month
	 * @return
	 */
	Sales getSales(String productId, String year, String month);

	/**
	 * 保存销售
	 * @param sales
	 */
	void saveSales(Sales sales);

	/**
	 * 更新销售
	 * @param sales
	 */
	void updateSales(Sales sales);
	
	/**
	 * 查找购物车数量
	 * @param userId
	 * @return
	 */
	long getShopCartCount(String userId);
	
	/**
	 * 查找看了又看了的商品
	 * @param productId
	 * @param categoryId
	 * @return
	 */
	List<Product>findproductCateList(String productId,Integer categoryId);

	/**
	 * 本月推荐
	 * @param year
	 * @param month
	 * @return
	 */
	List<Sales> findSaleOrderByDesc(String year, String month);

	/**
	 * 新品推荐
	 * @return
	 */
	List<Product> findnewProductRecommend();

	/**
	 * 热销商品
	 * @return
	 */
	List<Sales> findSales();
	
	
	
}
