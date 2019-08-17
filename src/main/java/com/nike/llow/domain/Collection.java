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
public class Collection {
	/**
     * 收藏Id
     */
    private int collectionId;
    /**
     * 用户Id
     */
    private String userId;
    /**
     * 商品Id
     */
    private String productId;
}
