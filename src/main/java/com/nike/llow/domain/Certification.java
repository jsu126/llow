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
public class Certification {
	/**
     * 实名认证Id
     */
    private int certificationId;
    /**
     * 用户Id
     */
    private String userId;
    /**
     * 实名姓名
     */
    private String realName;
    /**
     * 身份证号码
     */
    private String idCard;
    /**
     * 民族
     */
    private String nationality;
    /**
     * 出生
     */
    private String brithTime;
    /**
     * 地址
     */
    private String address;
    /**
     * 正面图片
     */
    private String positive;
    /**
     * 反面图片
     */
    private String negative;
    /**
     * 审核状态  0待审核 1审核通过 2审核不通过
     */
    private int status;
}
