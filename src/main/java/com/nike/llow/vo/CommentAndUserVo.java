package com.nike.llow.vo;



import lombok.Data;

@Data
public class CommentAndUserVo {
	/**
     * 评论Id
     */
    private int commentId;

	 /**
     * 用户Id
     */
    private String userId;
    /**
     * 商品Id
     */
    private String productId;
    /**
     * 属性名称
     */
    private String standardName;
    /**
     * 服务星级数 (好、中、差)
     */
    private Integer starCount;
    /**
     * 评论内容
     */
    private String commentConte;
    /**
     * 评论时间
     */
    private String commentTime;
    /**
     * 用户名
     */
    private String username;
    /**
     * 头像
     */
    private String picture;
}
