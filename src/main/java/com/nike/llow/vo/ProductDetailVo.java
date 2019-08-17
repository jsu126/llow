package com.nike.llow.vo;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.nike.llow.domain.Comment;
import com.nike.llow.domain.Product;
import com.nike.llow.domain.Sales;
import com.nike.llow.domain.Standard;
import com.nike.llow.domain.User;

import lombok.Data;

@Data
public class ProductDetailVo {

	/**
     * 商品Id
     */
    private String productId;
    
    /**
     * 收藏 状态   1收藏   0 没有收藏
     */
    private Integer collectionStatus;
    
	/**
	 * 最低价格
	 */
	private BigDecimal productMaxPrice;
	/**
	 * 最高价格
	 */
	private BigDecimal productMinPrice;
	/**
	 * 价格状态
	 */
	private Integer nameStatus;
	
	/**
	 * 评价总数
	 */
	private Integer commentCount;
	/**
	 * 好评数
	 */
	private Integer goodCount;
	/**
	 * 差评数
	 */
	private Integer badCount;
	/**
	 * 中评数
	 */
	private Integer midCount;
	
	/**
	 * 库存总量
	 */
	private Integer stockCount;
	
	/**
	 * 好评度
	 */
	private Integer degree;
    /**
     * 类目名称
     */
    private String categoryName;
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
    
    /**
     * 评论详情
     * 
     */
    private List<CommentAndUserVo> commentAndUserList = new ArrayList<>();
    
    /**
     * 销量详情
     */
   private Integer productSaleCount;
   private Integer productMonthCount;
    
 
    
    /**
     * 单价、库存详情
     */
    private List<Standard> standardList = new ArrayList<>();
    
    /**
     * 用户详情
     */
    private List<User>userList = new ArrayList<>();
    
    /**
     * 看了又看的商品内容
     */
    private List<ProductVo>productList = new ArrayList<>();
    
    
    
}
