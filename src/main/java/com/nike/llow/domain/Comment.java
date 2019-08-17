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
public class Comment {
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
	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", userId=" + userId + ", productId=" + productId + ", starCount="
				+ starCount + ", commentConte=" + commentConte + ", commentTime=" + commentTime + "]";
	}
    
    
}
