package com.nike.llow.domain;

import java.math.BigDecimal;

import javax.persistence.Entity;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * @author Stodger
 * @version V1.0
 * @date 2019-08-06 08:31
 */
@Entity
@Getter
@Setter
@EqualsAndHashCode
public class OrderDetail {
	/**
     * 订单详情Id
     */
    private int orderDetailId;
    /**
     * 订单Id
     */
    private Integer orderId;
    /**
     * 商品Id
     */
    private String productId;
    /**
     * 商品名称
     */
    private String productName;
    /**
     * 商品数量(购买数量)
     */
    private Integer productCount;
    /**
     * 商品单价
     */
    private BigDecimal productPrice;
    /**
     * 商品图片
     */
    private String productPicture;
    /**
     *规格名称
     */
    private String standardName;
	@Override
	public String toString() {
		return "OrderDetail [orderDetailId=" + orderDetailId + ", orderId=" + orderId + ", productId=" + productId
				+ ", productName=" + productName + ", productCount=" + productCount + ", productPrice=" + productPrice
				+ ", productPicture=" + productPicture + ", standardName=" + standardName + "]";
	}
    
    
}
