package com.nike.llow.vo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;

import com.nike.llow.domain.Standard;

import lombok.Getter;
import lombok.Setter;


@Entity
@Getter
@Setter
public class ProductVo {
	
	private String productId;
	private String productName;
	private String mainPicture;
	private BigDecimal productMaxPrice;
	private BigDecimal productMinPrice;
	private Integer productSaleCount;
	
	private List<Standard>standardList = new ArrayList<>();

	@Override
	public String toString() {
		return "ProductVo [productName=" + productName + ", mainPicture=" + mainPicture + ", productMaxPrice="
				+ productMaxPrice + ", productMinPrice=" + productMinPrice + ", productSaleCount=" + productSaleCount
				+ ", standardList=" + standardList + "]";
	}

	

	

}
