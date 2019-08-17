package com.nike.llow.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
public class Standard {
	/**
     * 属性Id
     */
    private int standardId;
    /**
     * 商品Id
     */
    private String productId;
    /**
     * 属性名称
     */
    private String standardName;
    /**
     * 商品单价
     */
    private BigDecimal price;
    /**
     * 库存
     */
    private Integer stock;
    
    
	@Override
	public String toString() {
		return "Standard [standardId=" + standardId + ", productId=" + productId + ", standardName=" + standardName
				+ ", price=" + price + ", stock=" + stock + "]";
	}
    
    

    
    
}
