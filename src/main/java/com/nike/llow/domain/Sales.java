package com.nike.llow.domain;

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
public class Sales {
	/**
     * 销售Id
     */
    private int salesId;
    /**
     * 商品Id
     */
    private String productId;
    /**
     * 销售数量
     */
    private Integer saleCount;
    
    /**
     * 年份
     */
    private String year;
    /**
     * 月份
     */
    private String month;
	@Override
	public String toString() {
		return "Sales [salesId=" + salesId + ", productId=" + productId + ", saleCount=" + saleCount + ", year=" + year
				+ ", month=" + month + "]";
	}
    
    
}
