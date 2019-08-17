package com.nike.llow.dao;

import java.util.List;
import java.util.Set;

import com.nike.llow.domain.Product;
import com.nike.llow.domain.Standard;

/**
 * @author zero
 * @date 2019年8月8日
 * @version
 */
public interface IProductManageDao {

	/**
	 * 查询所有的商品
	 * @return
	 */
	List<Product>findAllProduct();
	
	/**
	 * 根据productId查询商品的信息
	 * @param pid
	 * @return
	 */
	Product getProduct(String pid);
	
	/**
	 * 根据productId查询商品的单价
	 * @param pid
	 * @return
	 */
	List<Standard> getStandard(String pid);
	
	/**
	 * 更新商品
	 * @param product
	 */
	void updateProduct(Product product);
	

	/**
	 * 保存商品
	 * @param product
	 */
	void saveProduct(Product product);
	
	/**
	 * 保存规格
	 * @param standard
	 */
	void saveStandard(Standard standard);

	/**
	 * 删除商品
	 * @param result
	 */
	void deleteProduct(Product result);

	/**
	 * 商品数量
	 * @return
	 */
	Long countProduct();

	
	/**
	 * 统计评价
	 * @param pid
	 * @param i
	 * @return
	 */
	long countComment(String pid,int i);

	/**
	 * 统计销售
	 * @param year
	 * @param month
	 * @return
	 */
	long countSales(String year, String month);

	List<Object> findListSalesYear();
	
}

