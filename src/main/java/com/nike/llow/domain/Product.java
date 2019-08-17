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
public class Product {
	/**
     * 商品Id
     */
    private String productId;
    /**
     * 类目Id
     */
    private Integer categoryId;
    /**
     * 商品名称
     */
    private String productName;
    /**
     * 商品主图
     */
    private String mainPicture;
    /**
     * 商品副图
     */
    private String smallPicture;
    /**
     * 朋友状态 0不推荐 1推荐
     */
    private Integer friendStatus;
    /**
     * 恋人状态 0不推荐 1推荐
     */
    private Integer loverStatus;
    /**
     * 节日状态 0不推荐 1推荐
     */
    private Integer holidayStatus;
    /**
     * 亲人状态 0不推荐 1推荐
     */
    private Integer kinsfolkStatus;
    /**
     * 上/下架  0上架 1下架
     */
    private Integer status;
    /**
     * 商品详情
     */
    private String details;
    
    
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", categoryId=" + categoryId + ", productName=" + productName + ", mainPicture=" + mainPicture + ", smallPicture="
				+ smallPicture + ", friendStatus=" + friendStatus + ", loverStatus=" + loverStatus + ", holidayStatus="
				+ holidayStatus + ", kinsfolkStatus=" + kinsfolkStatus + ", status=" + status + ", details=" + details
				+ "]";
	}
	
    
    
}
