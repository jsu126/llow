package com.nike.llow.vo;

import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductInfoVo {
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
	private int friendStatus;
	/**
	 * 恋人状态 0不推荐 1推荐
	 */
	private int loverStatus;
	/**
	 * 节日状态 0不推荐 1推荐
	 */
	private int holidayStatus;
	/**
	 * 亲人状态 0不推荐 1推荐
	 */
	private int kinsfolkStatus;
	/**
	 * 上/下架 0上架 1下架2删除
	 */
	private int status;
	/**
	 * 商品详情
	 */
	private String details;
	
	private String[] standardNames;
	private int[] stocks;
	private double[] prices;
	@Override
	public String toString() {
		return "ProductInfoVo [productId=" + productId + ", categoryId=" + categoryId + ", productName=" + productName
				+ ", mainPicture=" + mainPicture + ", smallPicture=" + smallPicture + ", friendStatus=" + friendStatus
				+ ", loverStatus=" + loverStatus + ", holidayStatus=" + holidayStatus + ", kinsfolkStatus="
				+ kinsfolkStatus + ", status=" + status + ", details=" + details + ", standardNames="
				+ Arrays.toString(standardNames) + ", stocks=" + Arrays.toString(stocks) + ", prices="
				+ Arrays.toString(prices) + "]";
	}
}
