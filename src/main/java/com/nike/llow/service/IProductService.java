package com.nike.llow.service;

import java.util.List;

import com.nike.llow.domain.Category;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.ShopCart;
import com.nike.llow.vo.PageInfoVo;
import com.nike.llow.vo.ProductDetailVo;
import com.nike.llow.vo.ProductInfoVo;
import com.nike.llow.vo.ProductVo;
import com.nike.llow.vo.ResVo;


/**
 * @author ldg
 * @date 2019年8月9日
 * @version
 */

public interface IProductService {
	
     /**
      * 获取index页面的类目列表的界面
     * @return
     */
     List<Category> listCategorys(); 
     
     /**
      * 根据商品名称分页查询商品列表
     * @param title
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfoVo findproductSearchList(String title,int pageNum,int pageSize);
    
    /**
     * 根据分类查找商品列表
     * @param status
     * @param currentPage
     * @param count
     * @return
     */
    PageInfoVo productGenreList(String status,int pageNum, int pageSize);
    /**
	 * 根据类目id查找商品列表
	 * @param categoryId
	 * @param currentPage
	 * @param count
	 * @return
	 */
    PageInfoVo productSortList(int categoryId, int pageNum, int pageSize);
    /**
     * 查询所有的商品列表
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageInfoVo findProductList(int pageNum,int pageSize);
    
    /**
     * 根据商品ID,属性名称查询商品详细信息
     * @param productId
     * @return
     */
    ProductDetailVo findproductDetailVo(String productId,String standardName,int pageNum, int pageSize,String usid);
    
    
    /**添加到购物车
     * @param shopCart
     */
    void addShopcart(String userId,String productId,String standardName,int count);
	/**
	 * 查找购物车数量
	 * @param userId
	 * @return
	 */
	ResVo getShopCartCount(String userId);

	/**
	 * 商品推荐
	 * @return
	 */
	List<Product> findProductRecommend();

	/**
	 * 新品推荐
	 * @return
	 */
	List<Product> findnewProductRecommend();

	/**
	 * 热销商品
	 * @return
	 */
	List<ProductVo> findBestSeller();
	
	
}
