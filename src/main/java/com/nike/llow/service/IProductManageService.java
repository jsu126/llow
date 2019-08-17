package com.nike.llow.service;

import java.util.List;
import java.util.Set;

import com.nike.llow.domain.Product;
import com.nike.llow.vo.ProductAndStandardVo;
import com.nike.llow.vo.ProductInfoVo;
import com.nike.llow.vo.ProductVo;
import com.nike.llow.vo.ResVo;

/**
 * @author zero
 * @date 2019年8月8日
 * @version
 */
public interface IProductManageService {

	/**
	 * 查询所有的商品
	 * @return
	 */
	List<Product> findListProducts();
	
	/**
	 * 根据productId查询商品的详细信息
	 * @param pid
	 * @return
	 */
	ProductVo getProductVo(String pid);
	
	/**
	 * 商品的下架和发布
	 * @param product
	 */
	void updateProductStatus(Product product);
	
	/**
	 * 根据productId查询到商品
	 * @param pid
	 * @return
	 */
	Product getProduct(String pid);
	
	/**
	 * 删除商品
	 * @param product
	 * @return
	 */
	ResVo deleteProduct(Product product);
	

	/**
	 * 添加商品信息
	 * @param productInfoVo
	 */
	void saveProduct(ProductInfoVo productInfoVo);

	/**
	 * 获取商品
	 * @param pid
	 * @return
	 */
	ProductAndStandardVo getProductInfo(String pid);

	/**
	 * 更新商品
	 * @param productInfoVo
	 */
	void updateProduct(ProductInfoVo productInfoVo);

	/**
	 * 商品数量
	 * @return
	 */
	Long countProduct();

	/**
	 * 评价统计
	 * @param pid
	 * @return
	 */
	List<Long> countCommentList(String pid);

	/**
	 * 年销售统计
	 * @param year
	 * @return
	 */
	List<Long> countSales(String year);

	/**
	 * 年份
	 * @return
	 */
	List<Object> findListSalesYear();
	
	
	
	
	
	
	
}
