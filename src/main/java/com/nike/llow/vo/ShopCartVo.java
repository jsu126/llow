package com.nike.llow.vo;

import java.math.BigDecimal;
import java.util.List;

import org.apache.logging.log4j.core.appender.rolling.SizeBasedTriggeringPolicy;

import com.nike.llow.domain.Standard;

import lombok.Getter;
import lombok.Setter;

/**
 * @author ldg
 * @details 购物车vo
 * @date 2019年8月9日
 * @version 1.0
 */
@Getter
@Setter
public class ShopCartVo {

	/**
	 * 购物车id
	 */
	private Integer shopCartId;
	/**
	 * 用户id
	 */
	private String userId;
	/**
	 * 商品id
	 */
	private String productId;
	/**
	 * 商品名字
	 */
	private String productName;

	/**
	 * 规格名称
	 */
	private String standardName;

	/**
	 * 图片的路径
	 */
	private String picture;

	/**
	 * 总数目
	 */
	private Integer count;
	
	/**
	 * 总价格
	 */
	private Double totalPrice;
	
	
	/**
	 * 库存量
	 */
	private Integer stock;

	/**
	 * 规格表里面的颜色和单价的获取
	 */
	private Standard standard;

	@Override
	public String toString() {
		return "ShopCartVo [shopCartId=" + shopCartId + ", userId=" + userId + ", productId=" + productId
				+ ", productName=" + productName + ", standardName=" + standardName + ", picture=" + picture
				+ ", count=" + count + ", totalPrice=" + totalPrice + ", stock=" + stock + ", standard=" + standard
				+ "]";
	}


	
	
	

}
