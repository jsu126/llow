package com.nike.llow.vo;

import java.util.ArrayList;
import java.util.List;

import com.nike.llow.domain.Standard;

import lombok.Data;

@Data
public class ProductAndStandardVo {
	
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
    
    private List<String> smallPictureList = new ArrayList<>();
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
     * 商品详情
     */
    private String details;
    private List<String> detailsList = new ArrayList<>();
    
    private List<Standard> standardList = new ArrayList<>();

}
