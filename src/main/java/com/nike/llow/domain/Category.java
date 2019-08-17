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
public class Category {
	/**
     * 类目Id
     */
    private int categoryId;
    /**
     * 类目名称
     */
    private String categoryName;
    
    /**
     * 是否停用类目
     */
    private int categoryStatus;
}
