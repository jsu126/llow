package com.nike.llow.vo;

public class ProductCategoryVo {
	/**
     * 商品Id
     */
    private Integer productId;
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
    
    /**
     * 类目名称
     */
    private String categoryName;
    
    /**
     * 是否停用类目
     */
    private int categoryStatus;
	

}
